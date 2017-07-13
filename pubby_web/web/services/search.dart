import 'dart:async';
import 'dart:convert';
import 'package:angel_client/angel_client.dart';
import 'package:angel_paginate/angel_paginate.dart';
import 'package:angular2/angular2.dart';
import 'package:pubby_common/models.dart';
import 'backend.dart';

@Injectable()
class SearchService {
  final BackendService _backend;
  final List<PubPackage> packages = [];
  PaginationResult<Map> _search;

  SearchService(this._backend);

  PaginationResult<Map> get search => _search;

  Future<PaginationResult<Map>> query(String query,
      {int itemsPerPage: 10, int page: 1}) async {
    var data = {'query': query, 'items_per_page': itemsPerPage, 'page': page};
    var response = await _backend.app.post('/api/search',
        body: JSON.encode(data),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    if (response.statusCode != 200)
      throw new AngelHttpException.fromJson(response.body);

    _search = new PaginationResult.fromMap(JSON.decode(response.body));
    packages
      ..clear()
      ..addAll(_search.data.map(PubPackage.parse));
    return _search;
  }
}
