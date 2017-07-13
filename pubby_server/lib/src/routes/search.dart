import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_paginate/angel_paginate.dart';
import 'package:angel_validate/server.dart';
import 'package:pubby_common/models.dart';
import 'package:pubby_common/orm.dart';
import 'package:string_scanner/string_scanner.dart';

final Validator SEARCH = new Validator({
  'query*': isNonEmptyString,
  'items_per_page,page': [isInt, isPositive]
});

final RegExp _backslash = new RegExp(r'\+');

String sanitize(String str) {
  var buf = new StringBuffer();
  var scanner = new StringScanner(str);

  while (!scanner.isDone) {
    if (scanner.scan('--')) {
      return null;
    } else if (scanner.scan('/*')) {
      return null;
    } else if (scanner.scan("'")) {
      return null;
    } else if (scanner.scan(_backslash)) {
      return null;
    } else {
      buf.writeCharCode(scanner.readChar());
    }
  }

  return buf.toString();
}

bool parseItemsPerPage(RequestContext req) {
  var perPage =
      int.parse(req.body['items_per_page'].toString(), onError: (_) => 10);
  if (perPage < 1) perPage = 10;
  req.inject('perPage', perPage);
  return true;
}

bool sanitizeQuery(RequestContext req) {
  var s = sanitize(req.body['query']);
  if (s == null)
    throw new AngelHttpException.badRequest(message: 'You silly hacker!');
  req.body['query'] = s;
  return true;
}

configureServer(Angel app) async {
  app.chain([validate(SEARCH), sanitizeQuery, parseItemsPerPage]).post(
      '/api/search',
      (RequestContext req, PostgreSQLConnectionPool pool, int perPage) {
    return pool.run((connection) async {
      await req.parse();
      String queryString = req.body['query'];
      var whole = '%' + queryString + '%';
      var words =
          queryString.split(' ').where((s) => s.isNotEmpty).map(sanitize);

      var query = new PubPackageQuery()..where.name.like(whole);
      /*var query = words.fold<PubPackageQuery>(
          new PubPackageQuery()
            ..where.name.like(whole)
            ..or(new PubPackageQuery()..where.description.like(whole)),
          (q, word) {
        var k = '%$word%';
        return q
          ..or(new PubPackageQuery()..where.name.like(word))
          ..or(new PubPackageQuery()..where.description.like(word));
      });*/
      print(query.toSql());
      var results = await query.get(connection).toList();
      var p = new Paginator<PubPackage>(results, itemsPerPage: perPage);
      var pageNum = int.parse(req.body['page'].toString(), onError: (_) => 1);
      p.goToPage(pageNum);
      return p.current;
    });
  });
}
