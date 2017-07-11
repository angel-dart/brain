library brain.models.thought;

import 'package:angel_framework/common.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'thought.g.dart';

abstract class ThoughtType {
  static const String MEDIUM = 'medium';
  static const String VIDEO = 'video';
  static const String WIKI = 'wiki';
}

@serializable
@orm
class _Thought extends Model {
  String type, title, description, url;
}
