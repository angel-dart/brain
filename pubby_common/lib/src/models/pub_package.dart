library pubby_common.models.pub_package;

import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'pub_package.g.dart';

@serializable
@orm
class _PubPackage extends Model {
  String userId, name, versionString, description, readme, tags, donationLink;
  bool preRelease;
}
