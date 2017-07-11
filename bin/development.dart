import 'dart:io';
import 'package:angel_diagnostics/angel_diagnostics.dart';
import 'package:angel_hot/angel_hot.dart';
import 'package:brain/brain.dart';

main(List<String> args) async {
  var hot = new HotReloader(() async {
    var app = await createServer();
    await app.configure(profileRequests());
    await app.configure(logRequests());
    return app;
  }, [new Directory('config'), new Directory('lib'), new File('pubspec.lock')]);
  var server = await hot.startServer(InternetAddress.LOOPBACK_IP_V4, 3000);
  print(
      'Angel Brain listening at http://${server.address.address}:${server.port}');
}
