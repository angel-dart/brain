import 'dart:html';
import 'package:angular2/angular2.dart';
import '../../../services/search.dart';
import '../../../services/title.dart';
import 'package:angular2/router.dart';

@Component(selector: 'pb-search', templateUrl: 'pb_search.html')
class PbSearchComponent implements OnActivate, OnInit {
  final TitleService _titleService;
  final SearchService s;
  int itemsPerPage = 10;
  String query;

  @ViewChild('input')
  ElementRef input;

  PbSearchComponent(this._titleService, this.s);

  @override
  ngOnInit() {
    var $input = input.nativeElement as InputElement;

    $input.onKeyDown.listen((e) {
      if (e.keyCode == KeyCode.ENTER)
        search();
    });
  }

  @override
  routerOnActivate(_, __) {
    _titleService.title = 'Search';
  }

  void search() {
    var q = query;
    s.query(query, itemsPerPage: 10).then((_) {
      _titleService.title = 'Search:"$q"';
    });
  }
}
