import 'dart:async';
import 'package:angel_framework/angel_framework.dart';
import 'src/config/config.dart' as config;
import 'src/routes/routes.dart' as routes;

Future<Angel> createServer() async {
  var app = new Angel.custom(startShared);
  await app.configure(config.configureServer);
  await app.configure(routes.configureServer);
  return app;
}