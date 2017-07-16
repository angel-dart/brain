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
  final Map<UserQuery, bool> _unions = {};

  String _sortKey;

  String _sortMode;

  int limit;

  int offset;

  final List<UserQueryWhere> _or = [];

  final UserQueryWhere where = new UserQueryWhere();

  void union(UserQuery query) {
    _unions[query] = false;
  }

  void unionAll(UserQuery query) {
    _unions[query] = true;
  }

  void sortDescending(String key) {
    _sortMode = 'Descending';
    _sortKey = ('' + key);
  }

  void sortAscending(String key) {
    _sortMode = 'Ascending';
    _sortKey = ('' + key);
  }

  void or(UserQueryWhere selector) {
    _or.add(selector);
  }

  String toSql([String prefix]) {
    var buf = new StringBuffer();
    buf.write(prefix != null
        ? prefix
        : 'SELECT id, github_id, name, avatar, bio, website, created_at, updated_at FROM "users"');
    if (prefix == null) {}
    var whereClause = where.toWhereClause();
    if (whereClause != null) {
      buf.write(' ' + whereClause);
    }
    _or.forEach((x) {
      var whereClause = x.toWhereClause(keyword: false);
      if (whereClause != null) {
        buf.write(' OR (' + whereClause + ')');
      }
    });
    if (prefix == null) {
      if (limit != null) {
        buf.write(' LIMIT ' + limit.toString());
      }
      if (offset != null) {
        buf.write(' OFFSET ' + offset.toString());
      }
      if (_sortMode == 'Descending') {
        buf.write(' ORDER BY "' + _sortKey + '" DESC');
      }
      if (_sortMode == 'Ascending') {
        buf.write(' ORDER BY "' + _sortKey + '" ASC');
      }
      _unions.forEach((query, all) {
        buf.write(' UNION');
        if (all) {
          buf.write(' ALL');
        }
        buf.write(' (');
        var sql = query.toSql().replaceAll(';', '');
        buf.write(sql + ')');
      });
      buf.write(';');
    }
    return buf.toString();
  }

  static User parseRow(List row) {
    var result = new User.fromJson({
      'id': row[0].toString(),
      'github_id': row[1],
      'name': row[2],
      'avatar': row[3],
      'bio': row[4],
      'website': row[5],
      'created_at': row[6],
      'updated_at': row[7]
    });
    return result;
  }

  Stream<User> get(PostgreSQLConnection connection) {
    StreamController<User> ctrl = new StreamController<User>();
    connection.query(toSql()).then((rows) async {
      var futures = rows.map((row) async {
        var parsed = parseRow(row);
        return parsed;
      });
      var output = await Future.wait(futures);
      output.forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<User> getOne(int id, PostgreSQLConnection connection) {
    var query = new UserQuery();
    query.where.id.equals(id);
    return query.get(connection).first.catchError((_) => null);
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
        }).then((rows) async {
      var futures = rows.map((row) async {
        var parsed = parseRow(row);
        return parsed;
      });
      var output = await Future.wait(futures);
      output.forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  Stream<User> delete(PostgreSQLConnection connection) {
    StreamController<User> ctrl = new StreamController<User>();
    connection
        .query(toSql('DELETE FROM "users"') +
            ' RETURNING "id", "github_id", "name", "avatar", "bio", "website", "created_at", "updated_at";')
        .then((rows) async {
      var futures = rows.map((row) async {
        var parsed = parseRow(row);
        return parsed;
      });
      var output = await Future.wait(futures);
      output.forEach(ctrl.add);
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
    var output = parseRow(result[0]);
    return output;
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
      new DateTimeSqlExpressionBuilder('users.created_at');

  final DateTimeSqlExpressionBuilder updatedAt =
      new DateTimeSqlExpressionBuilder('users.updated_at');

  String toWhereClause({bool keyword}) {
    final List<String> expressions = [];
    if (id.hasValue) {
      expressions.add('users.id ' + id.compile());
    }
    if (githubId.hasValue) {
      expressions.add('users.github_id ' + githubId.compile());
    }
    if (name.hasValue) {
      expressions.add('users.name ' + name.compile());
    }
    if (avatar.hasValue) {
      expressions.add('users.avatar ' + avatar.compile());
    }
    if (bio.hasValue) {
      expressions.add('users.bio ' + bio.compile());
    }
    if (website.hasValue) {
      expressions.add('users.website ' + website.compile());
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
