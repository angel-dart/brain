// GENERATED CODE - DO NOT MODIFY BY HAND

part of pubby_common.models.user;

// **************************************************************************
// Generator: JsonModelGenerator
// Target: class _User
// **************************************************************************

class User extends _User {
  @override
  String id;

  @override
  String githubId;

  @override
  String name;

  @override
  String avatar;

  @override
  String bio;

  @override
  String website;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  User(
      {this.id,
      this.githubId,
      this.name,
      this.avatar,
      this.bio,
      this.website,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(Map data) {
    return new User(
        id: data['id'],
        githubId: data['github_id'],
        name: data['name'],
        avatar: data['avatar'],
        bio: data['bio'],
        website: data['website'],
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
        'github_id': githubId,
        'name': name,
        'avatar': avatar,
        'bio': bio,
        'website': website,
        'created_at': createdAt == null ? null : createdAt.toIso8601String(),
        'updated_at': updatedAt == null ? null : updatedAt.toIso8601String()
      };

  static User parse(Map map) => new User.fromJson(map);

  User clone() {
    return new User.fromJson(toJson());
  }
}
