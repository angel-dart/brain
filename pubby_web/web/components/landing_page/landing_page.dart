import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import '../../services/search.dart';

@Component(
    selector: 'landing-page',
    templateUrl: 'landing_page.html',
    styleUrls: const ['landing_page.css'])
class LandingPageComponent {
  final SearchService _searchService;
  final Router _router;
  bool searching = false;
  String searchQuery = '';

  LandingPageComponent(this._searchService, this._router);

  String get buttonText => searching ? 'Searching...' : 'Search';

  void handleSubmit() {
    if (!searching && searchQuery.isNotEmpty) {
      searching = true;
      _searchService.query(searchQuery).then((_) {
        _router.navigate(['../Search']);
      }).catchError((e) {
        searching = false;
        // TODO: Handle search error...
      });
    }
  }
}
