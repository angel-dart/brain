import 'dart:async';
import 'package:angel_diagnostics/angel_diagnostics.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_validate/server.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:postgres/postgres.dart';
import '../models/thought.orm.g.dart';

final Validator THINK_API = new Validator({
  'query*': [isNonEmptyString]
});

configureServer(Angel app) async {
  app.chain([
    profile('validate'),
    validate(THINK_API),
    profile('sanitize'),
    sanitizeQuery,
    profile('think')
  ]).post('/api/think', think);
}

String _sanitize(String str) {
  return str
      .replaceAll('\\', '\\\\')
      .replaceAll("'", "\\'")
      .replaceAll('%', '[%]');
}

Future<bool> sanitizeQuery(RequestContext req) async {
  await req.parse();
  req.body['query'] = _sanitize(req.body['query']);
  return true;
}

Future think(RequestContext req, PostgreSQLConnectionPool pool) async {
  // Sanitized in a middleware
  String searchString = req.body['query'];

  var connection = await pool.connector() as PostgreSQLConnection;
  await connection.open();

  // Naive search...
  var query = new ThoughtQuery()
    ..where.title.like('%$searchString%')
    ..or(new ThoughtQuery()..where.description.like('%$searchString%'));

  // Return a Stream
  return query.get(connection);
}
