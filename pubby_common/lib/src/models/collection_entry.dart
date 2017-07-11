library pubby_common.models.collection_entry;

import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'collection_entry.g.dart';

@serializable
@orm
class _CollectionEntry extends Model {
  String collectionId, pubPackageId;
}