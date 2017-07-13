import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import '../landing_page/landing_page.dart';
import '../not_found/not_found.dart';
import '../pb_content/pb_content.dart';

@Component(selector: 'pubby-app', templateUrl: 'pubby_app.html')
@RouteConfig(const [
  const Route(path: '/', name: 'Landing', component: LandingPageComponent),
  const Route(path: '/not-found', name: '404', component: NotFoundComponent),
  const Route(path: '/...', name: 'Content', component: PbContentComponent),
  const Redirect(path: '**', redirectTo: const ['404'], useAsDefault: true)
])
class PubbyAppComponent {}
