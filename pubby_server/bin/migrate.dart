import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:mirrors';
import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:pubby_common/models.dart';
import 'package:pubby_server/pubby_server.dart';

main(List<String> args) async {
  exitCode = 1;

  if (args.isEmpty) {
    stderr.writeln('fatal error: expected input method');
  } else if (args.first != 'up' && args.first != 'down') {
    stderr.writeln('fatal error: expected "up" or "down"');
  } else {
    var op = args.first;
    exitCode = 0;

    // Do some magic...

    // STEP 1: Reflect pubby_common_models
    var pubbyCommon = currentMirrorSystem().findLibrary(#pubby_common_models);

    // STEP 2: Get names of all model classes
    var modelType = reflectClass(Model);
    List<ClassMirror> modelClasses = [];

    for (var dep in pubbyCommon.libraryDependencies) {
      if (dep.isExport) {
        dep.targetLibrary.declarations.forEach((sym, decl) {
          var name = MirrorSystem.getName(sym);
          // Only add the variant WITHOUT an underscore...
          if (decl is ClassMirror &&
              decl.isAssignableTo(modelType) &&
              !name.startsWith('_')) {
            modelClasses.add(decl);
          }
        });
      }
    }

    // STEP 3: Turn these into SQL migration script paths
    var sqlPaths = await Future.wait<String>(modelClasses.map((clazz) {
      var sourceUri = clazz.originalDeclaration.location.sourceUri;
      var withoutExtension = sourceUri.path.replaceAll('.g.dart', '');
      var sqlUri = sourceUri.replace(path: '$withoutExtension.$op.g.sql');
      return Isolate.resolvePackageUri(sqlUri).then((uri) => uri.toFilePath());
    }));

    // STEP 4: Run all scripts
    var app = await createServer();
    var pool = app.container.make(PostgreSQLConnectionPool)
        as PostgreSQLConnectionPool;
    var scriptRuns = sqlPaths.map<Future>((path) async {
      print('Running migration "$path"...');
      var file = new File(path);
      var contents = await file.readAsString();
      return await pool.run((connection) => connection.execute(contents));
    });

    // STEP 5: Await completion
    await Future.wait(scriptRuns);

    // STEP 6: Print farewell message!
    print('Migration complete!');
  }
}
