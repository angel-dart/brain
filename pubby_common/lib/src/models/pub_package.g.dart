// GENERATED CODE - DO NOT MODIFY BY HAND

part of pubby_common.models.pub_package;

// **************************************************************************
// Generator: JsonModelGenerator
// Target: class _PubPackage
// **************************************************************************

class PubPackage extends _PubPackage {
  @override
  String id;

  @override
  String userId;

  @override
  String name;

  @override
  String versionString;

  @override
  String description;

  @override
  String readme;

  @override
  String tags;

  @override
  String donationLink;

  @override
  bool preRelease;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  PubPackage(
      {this.id,
      this.userId,
      this.name,
      this.versionString,
      this.description,
      this.readme,
      this.tags,
      this.donationLink,
      this.preRelease,
      this.createdAt,
      this.updatedAt});

  factory PubPackage.fromJson(Map data) {
    return new PubPackage(
        id: data['id'],
        userId: data['user_id'],
        name: data['name'],
        versionString: data['version_string'],
        description: data['description'],
        readme: data['readme'],
        tags: data['tags'],
        donationLink: data['donation_link'],
        preRelease: data['pre_release'],
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
        'version_string': versionString,
        'description': description,
        'readme': readme,
        'tags': tags,
        'donation_link': donationLink,
        'pre_release': preRelease,
        'created_at': createdAt == null ? null : createdAt.toIso8601String(),
        'updated_at': updatedAt == null ? null : updatedAt.toIso8601String()
      };

  static PubPackage parse(Map map) => new PubPackage.fromJson(map);

  PubPackage clone() {
    return new PubPackage.fromJson(toJson());
  }
}
