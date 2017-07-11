import 'dart:io';
import 'package:angel_diagnostics/angel_diagnostics.dart';
import 'package:pubby_server/pubby_server.dart';

main(List<String> args) async {
  var app = await createServer();
  await app.configure(logRequests(new File('log.txt')));
  var server = await app.startServer(InternetAddress.LOOPBACK_IP_V4, 3000);
  print(
      'Pubby (PRODUCTION) listening at http://${server.address.address}:${server.port}');
}
