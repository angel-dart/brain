import 'dart:async';
import 'dart:io';
import 'package:angel_compress/angel_compress.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_proxy/angel_proxy.dart';
import 'package:angel_static/angel_static.dart';
import 'search.dart' as search;

Future configureServer(Angel app) async {
  await app.configure(search.configureServer);

  var vDir = new CachingVirtualDirectory(
      source: new Directory(
          app.isProduction ? '../pubby_web/build/web' : '../pubby_web/web'));
  var indexFile = new File.fromUri(vDir.source.uri.resolve('index.html'));

  await app.configure(new PubServeLayer());

  app.after.add((req, res) {
    return indexFile
        .stat()
        .then((stat) => vDir.serveFile(indexFile, stat, req, res));
  });

  app.responseFinalizers.add(gzip());
}
