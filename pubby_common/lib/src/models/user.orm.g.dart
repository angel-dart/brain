// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: PostgresORMGenerator
// Target: class _User
// **************************************************************************

import 'dart:async';
import 'package:angel_orm/angel_orm.dart';
import 'package:postgres/postgres.dart';
import 'user.dart';

class UserQuery {
  final List<String> _and = [];

  final List<String> _or = [];

  final List<String> _not = [];

  final UserQueryWhere where = new UserQueryWhere();

  void and(UserQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _and.add(compiled);
    }
  }

  void or(UserQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _or.add(compiled);
    }
  }

  void not(UserQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _not.add(compiled);
    }
  }

  String toSql() {
    var buf = new StringBuffer('SELECT * FROM "users"');
    var whereClause = where.toWhereClause();
    if (whereClause != null) {
      buf.write(' ' + whereClause);
    }
    if (_and.isNotEmpty) {
      buf.write(' AND (' + _and.join(',') + ')');
    }
    if (_or.isNotEmpty) {
      buf.write(' OR (' + _or.join(',') + ')');
    }
    if (_not.isNotEmpty) {
      buf.write(' NOT (' + _not.join(',') + ')');
    }
    buf.write(';');
    return buf.toString();
  }

  static User parseRow(List row) {
    return new User.fromJson({
      'id': row[0].toString(),
      'github_id': row[1],
      'name': row[2],
      'avatar': row[3],
      'bio': row[4],
      'website': row[5],
      'created_at': row[6],
      'updated_at': row[7]
    });
  }

  Stream<User> get(PostgreSQLConnection connection) {
    StreamController<User> ctrl = new StreamController<User>();
    connection.query(toSql()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<User> getOne(int id, PostgreSQLConnection connection) {
    return connection.query('SELECT * FROM "users" WHERE "id" = @id;',
        substitutionValues: {'id': id}).then((rows) => parseRow(rows.first));
  }

  Stream<User> update(PostgreSQLConnection connection,
      {String githubId,
      String name,
      String avatar,
      String bio,
      String website,
      DateTime createdAt,
      DateTime updatedAt}) {
    var buf = new StringBuffer(
        'UPDATE "users" SET ("github_id", "name", "avatar", "bio", "website", "created_at", "updated_at") = (@githubId, @name, @avatar, @bio, @website, @createdAt, @updatedAt) ');
    var whereClause = where.toWhereClause();
    if (whereClause == null) {
      buf.write('WHERE "id" = @id');
    } else {
      buf.write(whereClause);
    }
    var __ormNow__ = new DateTime.now();
    var ctrl = new StreamController<User>();
    connection.query(
        buf.toString() +
            ' RETURNING "id", "github_id", "name", "avatar", "bio", "website", "created_at", "updated_at";',
        substitutionValues: {
          'githubId': githubId,
          'name': name,
          'avatar': avatar,
          'bio': bio,
          'website': website,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        }).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  Stream<User> delete(PostgreSQLConnection connection) {
    var buf = new StringBuffer('DELETE FROM "users"');
    var whereClause = where.toWhereClause();
    if (whereClause != null) {
      buf.write(' ' + whereClause);
      if (_and.isNotEmpty) {
        buf.write(' AND (' + _and.join(', ') + ')');
      }
      if (_or.isNotEmpty) {
        buf.write(' OR (' + _or.join(', ') + ')');
      }
      if (_not.isNotEmpty) {
        buf.write(' NOT (' + _not.join(', ') + ')');
      }
    }
    buf.write(
        ' RETURNING "id", "github_id", "name", "avatar", "bio", "website", "created_at", "updated_at";');
    StreamController<User> ctrl = new StreamController<User>();
    connection.query(buf.toString()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<User> deleteOne(int id, PostgreSQLConnection connection) async {
    var result = await connection.query(
        'DELETE FROM "users" WHERE id = @id RETURNING "id", "github_id", "name", "avatar", "bio", "website", "created_at", "updated_at";',
        substitutionValues: {'id': id});
    return parseRow(result[0]);
  }

  static Future<User> insert(PostgreSQLConnection connection,
      {String githubId,
      String name,
      String avatar,
      String bio,
      String website,
      DateTime createdAt,
      DateTime updatedAt}) async {
    var __ormNow__ = new DateTime.now();
    var result = await connection.query(
        'INSERT INTO "users" ("github_id", "name", "avatar", "bio", "website", "created_at", "updated_at") VALUES (@githubId, @name, @avatar, @bio, @website, @createdAt, @updatedAt) RETURNING "id", "github_id", "name", "avatar", "bio", "website", "created_at", "updated_at";',
        substitutionValues: {
          'githubId': githubId,
          'name': name,
          'avatar': avatar,
          'bio': bio,
          'website': website,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        });
    return parseRow(result[0]);
  }

  static Future<User> insertUser(PostgreSQLConnection connection, User user) {
    return UserQuery.insert(connection,
        githubId: user.githubId,
        name: user.name,
        avatar: user.avatar,
        bio: user.bio,
        website: user.website,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt);
  }

  static Future<User> updateUser(PostgreSQLConnection connection, User user) {
    var query = new UserQuery();
    query.where.id.equals(int.parse(user.id));
    return query
        .update(connection,
            githubId: user.githubId,
            name: user.name,
            avatar: user.avatar,
            bio: user.bio,
            website: user.website,
            createdAt: user.createdAt,
            updatedAt: user.updatedAt)
        .first;
  }

  static Stream<User> getAll(PostgreSQLConnection connection) =>
      new UserQuery().get(connection);
}

class UserQueryWhere {
  final NumericSqlExpressionBuilder<int> id =
      new NumericSqlExpressionBuilder<int>();

  final StringSqlExpressionBuilder githubId = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder name = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder avatar = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder bio = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder website = new StringSqlExpressionBuilder();

  final DateTimeSqlExpressionBuilder createdAt =
      new DateTimeSqlExpressionBuilder('created_at');

  final DateTimeSqlExpressionBuilder updatedAt =
      new DateTimeSqlExpressionBuilder('updated_at');

  String toWhereClause({bool keyword}) {
    final List<String> expressions = [];
    if (id.hasValue) {
      expressions.add('"id" ' + id.compile());
    }
    if (githubId.hasValue) {
      expressions.add('"github_id" ' + githubId.compile());
    }
    if (name.hasValue) {
      expressions.add('"name" ' + name.compile());
    }
    if (avatar.hasValue) {
      expressions.add('"avatar" ' + avatar.compile());
    }
    if (bio.hasValue) {
      expressions.add('"bio" ' + bio.compile());
    }
    if (website.hasValue) {
      expressions.add('"website" ' + website.compile());
    }
    if (createdAt.hasValue) {
      expressions.add(createdAt.compile());
    }
    if (updatedAt.hasValue) {
      expressions.add(updatedAt.compile());
    }
    return expressions.isEmpty
        ? null
        : ((keyword != false ? 'WHERE ' : '') + expressions.join(' AND '));
  }
}
