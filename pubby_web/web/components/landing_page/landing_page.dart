import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import '../../services/search.dart';

@Component(
    selector: 'landing-page',
    templateUrl: 'landing_page.html',
    styleUrls: const ['landing_page.css'])
class LandingPageComponent implements OnInit {
  final SearchService _searchService;
  final Router _router;
  bool searching = false;
  String searchQuery = '';

  @ViewChild('input')
  ElementRef input;

  LandingPageComponent(this._searchService, this._router);

  String get buttonText => searching ? 'Searching...' : 'Search';

  @override
  ngOnInit() {
    var $input = input.nativeElement as InputElement;
    $input.onKeyDown.listen((e) {
      if (e.keyCode == KeyCode.ENTER) handleSubmit();
    });
  }

  void handleSubmit() {
    if (!searching && searchQuery.isNotEmpty) {
      searching = true;
      _searchService.query(searchQuery).then((_) {
        _router.navigate(['../Content/Search']);
      }).catchError((e) {
        searching = false;
        // TODO: Handle search error...
      });
    }
  }
}
