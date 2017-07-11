import 'dart:convert';
import 'package:angel_orm/angel_orm.dart';
import 'package:http/http.dart' as http;
import 'package:postgres/postgres.dart';
import 'package:pubby_common/models.dart';
import 'package:pubby_common/orm.dart';
import 'package:pubby_server/pubby_server.dart';

// TODO: Run as daemon, listen for changes
main() async {
  var app = await createServer();
  var pool =
      app.container.make(PostgreSQLConnectionPool) as PostgreSQLConnectionPool;
  var client = new http.Client();
  await scrapePage('https://pub.dartlang.org/api/packages', client, pool);
  client.close();
}

scrapePage(
    String url, http.Client client, PostgreSQLConnectionPool pool) async {
  print('Now scraping "$url"...');
  var response = await client.get(url);
  var doc = JSON.decode(response.body) as Map;
  List<Map> packages = doc['packages'];
  var parsed = packages.map(parsePackage);

  for (var pkg in parsed) {
    await pool
        .run((connection) => PubPackageQuery.insertPubPackage(connection, pkg));
  }

  var nextUrl = doc['next_url']?.toString();
  if (nextUrl?.isNotEmpty == true) {
    return await scrapePage(nextUrl, client, pool);
  } else {
    print('Reached the end of the listing.');
    print('Current page: "$url"');
    print('JSON contents: $doc');
  }
}

// TODO: Should be async to support more features ;)
PubPackage parsePackage(Map map) {
  Map latest = map['latest'];
  return new PubPackage(
      name: map['name'],
      versionString: latest['version'],
      description: latest['pubspec']['description']);
}
