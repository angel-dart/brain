import 'package:angular2/platform/browser.dart';
import 'package:angular2/router.dart';
import 'components/pubby_app/pubby_app.dart';
import 'services/services.dart';

main() => bootstrap(PubbyAppComponent, [ROUTER_PROVIDERS, PUBBY_PROVIDERS]);
