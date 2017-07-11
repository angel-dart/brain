// GENERATED CODE - DO NOT MODIFY BY HAND

part of pubby_common.models.collection;

// **************************************************************************
// Generator: JsonModelGenerator
// Target: class _Collection
// **************************************************************************

class Collection extends _Collection {
  @override
  String id;

  @override
  String userId;

  @override
  String name;

  @override
  String description;

  @override
  String website;

  @override
  bool public;

  @override
  bool featured;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  Collection(
      {this.id,
      this.userId,
      this.name,
      this.description,
      this.website,
      this.public,
      this.featured,
      this.createdAt,
      this.updatedAt});

  factory Collection.fromJson(Map data) {
    return new Collection(
        id: data['id'],
        userId: data['user_id'],
        name: data['name'],
        description: data['description'],
        website: data['website'],
        public: data['public'],
        featured: data['featured'],
        createdAt: data['created_at'] is DateTime
            ? data['created_at']
            : (data['created_at'] is String
                ? DateTime.parse(data['created_at'])
                : null),
        updatedAt: data['updated_at'] is DateTime
            ? data['updated_at']
            : (data['updated_at'] is String
                ? DateTime.parse(data['updated_at'])
                : null));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'name': name,
        'description': description,
        'website': website,
        'public': public,
        'featured': featured,
        'created_at': createdAt == null ? null : createdAt.toIso8601String(),
        'updated_at': updatedAt == null ? null : updatedAt.toIso8601String()
      };

  static Collection parse(Map map) => new Collection.fromJson(map);

  Collection clone() {
    return new Collection.fromJson(toJson());
  }
}
