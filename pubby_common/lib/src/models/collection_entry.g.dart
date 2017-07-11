// GENERATED CODE - DO NOT MODIFY BY HAND

part of pubby_common.models.collection_entry;

// **************************************************************************
// Generator: JsonModelGenerator
// Target: class _CollectionEntry
// **************************************************************************

class CollectionEntry extends _CollectionEntry {
  @override
  String id;

  @override
  String collectionId;

  @override
  String pubPackageId;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  CollectionEntry(
      {this.id,
      this.collectionId,
      this.pubPackageId,
      this.createdAt,
      this.updatedAt});

  factory CollectionEntry.fromJson(Map data) {
    return new CollectionEntry(
        id: data['id'],
        collectionId: data['collection_id'],
        pubPackageId: data['pub_package_id'],
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
        'collection_id': collectionId,
        'pub_package_id': pubPackageId,
        'created_at': createdAt == null ? null : createdAt.toIso8601String(),
        'updated_at': updatedAt == null ? null : updatedAt.toIso8601String()
      };

  static CollectionEntry parse(Map map) => new CollectionEntry.fromJson(map);

  CollectionEntry clone() {
    return new CollectionEntry.fromJson(toJson());
  }
}
