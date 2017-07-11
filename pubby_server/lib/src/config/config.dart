import 'dart:async';
import 'dart:convert';
import 'package:angel_configuration/angel_configuration.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:postgres/postgres.dart';

Future configureServer(Angel app) async {
  app.lazyParseBodies = true;
  app.injectSerializer(JSON.encode);
  await app.configure(loadConfigurationFile());

  Map<String, dynamic> postgresConfig = app.properties['postgres'];
  var pool = new PostgreSQLConnectionPool(() {
    return new PostgreSQLConnection(
        postgresConfig['host'], postgresConfig['port'], postgresConfig['db'],
        username: postgresConfig['username'],
        password: postgresConfig['password']);
  });
  app.container.singleton(pool);
}
