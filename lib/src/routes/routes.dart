import 'dart:async';
import 'package:angel_compress/angel_compress.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_proxy/angel_proxy.dart';
import 'think.dart' as think;

Future configureServer(Angel app) async {
  await app.configure(think.configureServer);
  await app.configure(new PubServeLayer());
  app.responseFinalizers.add(gzip());
}