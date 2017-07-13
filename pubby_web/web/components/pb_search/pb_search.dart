import 'package:angular2/angular2.dart';
import '../../services/search.dart';

@Component(selector: 'pb-search', templateUrl: 'pb_search.html')
class PbSearchComponent {
  final SearchService s;
  int itemsPerPage = 10;

  PbSearchComponent(this.s);
}