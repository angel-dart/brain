import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'pb_search/pb_search.dart';

@Component(selector: 'pb-content', templateUrl: 'pb_content.html')
@RouteConfig(const [
  const Route(path: '/search', name: 'Search', component: PbSearchComponent)
])
class PbContentComponent {}
