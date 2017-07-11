import 'package:angel_orm_generator/angel_orm_generator.dart';
import 'package:angel_serialize_generator/angel_serialize_generator.dart';
import 'package:build_runner/build_runner.dart';
import 'package:source_gen/source_gen.dart';

final InputSet MODELS =
    new InputSet('pubby_common', const ['lib/src/models/*.dart']);

final PhaseGroup PHASES = new PhaseGroup()
  ..addPhase(new Phase()
    ..addAction(new GeneratorBuilder([new JsonModelGenerator()]), MODELS)
    ..addAction(
        new GeneratorBuilder([new PostgresORMGenerator()],
            isStandalone: true, generatedExtension: '.orm.g.dart'),
        MODELS)
    ..addAction(new SQLMigrationGenerator(), MODELS));
