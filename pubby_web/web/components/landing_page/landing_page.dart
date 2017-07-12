import 'package:angular2/angular2.dart';

@Component(
    selector: 'landing-page',
    templateUrl: 'landing_page.html',
    styleUrls: const ['landing_page.css'])
class LandingPageComponent {
  bool searching = false;
  String searchQuery;

  String get buttonText => searching ? 'Searching...' : 'Search';

  void handleSubmit() {
    if (!searching) {
      searching = true;
    }
  }
}
