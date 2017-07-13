import 'dart:html';
import 'package:angel_client/browser.dart';
import 'package:angular2/angular2.dart';

@Injectable()
class BackendService {
  final Angel app = new Rest(window.location.origin);
}