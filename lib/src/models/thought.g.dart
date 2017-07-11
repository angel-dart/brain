// GENERATED CODE - DO NOT MODIFY BY HAND

part of brain.models.thought;

// **************************************************************************
// Generator: JsonModelGenerator
// Target: class _Thought
// **************************************************************************

class Thought extends _Thought {
  @override
  String id;

  @override
  String type;

  @override
  String title;

  @override
  String description;

  @override
  String url;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  Thought(
      {this.id,
      this.type,
      this.title,
      this.description,
      this.url,
      this.createdAt,
      this.updatedAt});

  factory Thought.fromJson(Map data) {
    return new Thought(
        id: data['id'],
        type: data['type'],
        title: data['title'],
        description: data['description'],
        url: data['url'],
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
        'type': type,
        'title': title,
        'description': description,
        'url': url,
        'created_at': createdAt == null ? null : createdAt.toIso8601String(),
        'updated_at': updatedAt == null ? null : updatedAt.toIso8601String()
      };

  static Thought parse(Map map) => new Thought.fromJson(map);

  Thought clone() {
    return new Thought.fromJson(toJson());
  }
}
