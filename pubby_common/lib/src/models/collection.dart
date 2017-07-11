library pubby_common.models.collection;

import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'collection.g.dart';

@serializable
@orm
class _Collection extends Model {
  String userId, name, description, website;
  bool public, featured;
}