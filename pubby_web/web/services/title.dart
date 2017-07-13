import 'dart:html';
import 'package:angular2/angular2.dart';

@Injectable()
class TitleService {
  String _title;

  String get title => _title ?? 'Pubby';

  void set title(String value) {
    _title = value;

    if (_title == null)
      document.title = 'Pubby';
    else
      document.title = '$value - Pubby';
  }
}
