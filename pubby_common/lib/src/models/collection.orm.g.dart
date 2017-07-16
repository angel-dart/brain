// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: PostgresORMGenerator
// Target: class _Collection
// **************************************************************************

import 'dart:async';
import 'package:angel_orm/angel_orm.dart';
import 'package:postgres/postgres.dart';
import 'collection.dart';

class CollectionQuery {
  final Map<CollectionQuery, bool> _unions = {};

  String _sortKey;

  String _sortMode;

  int limit;

  int offset;

  final List<CollectionQueryWhere> _or = [];

  final CollectionQueryWhere where = new CollectionQueryWhere();

  void union(CollectionQuery query) {
    _unions[query] = false;
  }

  void unionAll(CollectionQuery query) {
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

  void or(CollectionQueryWhere selector) {
    _or.add(selector);
  }

  String toSql([String prefix]) {
    var buf = new StringBuffer();
    buf.write(prefix != null
        ? prefix
        : 'SELECT id, user_id, name, description, website, public, featured, created_at, updated_at FROM "collections"');
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

  static Collection parseRow(List row) {
    var result = new Collection.fromJson({
      'id': row[0].toString(),
      'user_id': row[1],
      'name': row[2],
      'description': row[3],
      'website': row[4],
      'public': row[5],
      'featured': row[6],
      'created_at': row[7],
      'updated_at': row[8]
    });
    return result;
  }

  Stream<Collection> get(PostgreSQLConnection connection) {
    StreamController<Collection> ctrl = new StreamController<Collection>();
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

  static Future<Collection> getOne(int id, PostgreSQLConnection connection) {
    var query = new CollectionQuery();
    query.where.id.equals(id);
    return query.get(connection).first.catchError((_) => null);
  }

  Stream<Collection> update(PostgreSQLConnection connection,
      {String userId,
      String name,
      String description,
      String website,
      bool public,
      bool featured,
      DateTime createdAt,
      DateTime updatedAt}) {
    var buf = new StringBuffer(
        'UPDATE "collections" SET ("user_id", "name", "description", "website", "public", "featured", "created_at", "updated_at") = (@userId, @name, @description, @website, @public, @featured, @createdAt, @updatedAt) ');
    var whereClause = where.toWhereClause();
    if (whereClause == null) {
      buf.write('WHERE "id" = @id');
    } else {
      buf.write(whereClause);
    }
    var __ormNow__ = new DateTime.now();
    var ctrl = new StreamController<Collection>();
    connection.query(
        buf.toString() +
            ' RETURNING "id", "user_id", "name", "description", "website", "public", "featured", "created_at", "updated_at";',
        substitutionValues: {
          'userId': userId,
          'name': name,
          'description': description,
          'website': website,
          'public': public,
          'featured': featured,
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

  Stream<Collection> delete(PostgreSQLConnection connection) {
    StreamController<Collection> ctrl = new StreamController<Collection>();
    connection
        .query(toSql('DELETE FROM "collections"') +
            ' RETURNING "id", "user_id", "name", "description", "website", "public", "featured", "created_at", "updated_at";')
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

  static Future<Collection> deleteOne(
      int id, PostgreSQLConnection connection) async {
    var result = await connection.query(
        'DELETE FROM "collections" WHERE id = @id RETURNING "id", "user_id", "name", "description", "website", "public", "featured", "created_at", "updated_at";',
        substitutionValues: {'id': id});
    return parseRow(result[0]);
  }

  static Future<Collection> insert(PostgreSQLConnection connection,
      {String userId,
      String name,
      String description,
      String website,
      bool public,
      bool featured,
      DateTime createdAt,
      DateTime updatedAt}) async {
    var __ormNow__ = new DateTime.now();
    var result = await connection.query(
        'INSERT INTO "collections" ("user_id", "name", "description", "website", "public", "featured", "created_at", "updated_at") VALUES (@userId, @name, @description, @website, @public, @featured, @createdAt, @updatedAt) RETURNING "id", "user_id", "name", "description", "website", "public", "featured", "created_at", "updated_at";',
        substitutionValues: {
          'userId': userId,
          'name': name,
          'description': description,
          'website': website,
          'public': public,
          'featured': featured,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        });
    var output = parseRow(result[0]);
    return output;
  }

  static Future<Collection> insertCollection(
      PostgreSQLConnection connection, Collection collection) {
    return CollectionQuery.insert(connection,
        userId: collection.userId,
        name: collection.name,
        description: collection.description,
        website: collection.website,
        public: collection.public,
        featured: collection.featured,
        createdAt: collection.createdAt,
        updatedAt: collection.updatedAt);
  }

  static Future<Collection> updateCollection(
      PostgreSQLConnection connection, Collection collection) {
    var query = new CollectionQuery();
    query.where.id.equals(int.parse(collection.id));
    return query
        .update(connection,
            userId: collection.userId,
            name: collection.name,
            description: collection.description,
            website: collection.website,
            public: collection.public,
            featured: collection.featured,
            createdAt: collection.createdAt,
            updatedAt: collection.updatedAt)
        .first;
  }

  static Stream<Collection> getAll(PostgreSQLConnection connection) =>
      new CollectionQuery().get(connection);
}

class CollectionQueryWhere {
  final NumericSqlExpressionBuilder<int> id =
      new NumericSqlExpressionBuilder<int>();

  final StringSqlExpressionBuilder userId = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder name = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder description =
      new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder website = new StringSqlExpressionBuilder();

  final BooleanSqlExpressionBuilder public = new BooleanSqlExpressionBuilder();

  final BooleanSqlExpressionBuilder featured =
      new BooleanSqlExpressionBuilder();

  final DateTimeSqlExpressionBuilder createdAt =
      new DateTimeSqlExpressionBuilder('collections.created_at');

  final DateTimeSqlExpressionBuilder updatedAt =
      new DateTimeSqlExpressionBuilder('collections.updated_at');

  String toWhereClause({bool keyword}) {
    final List<String> expressions = [];
    if (id.hasValue) {
      expressions.add('collections.id ' + id.compile());
    }
    if (userId.hasValue) {
      expressions.add('collections.user_id ' + userId.compile());
    }
    if (name.hasValue) {
      expressions.add('collections.name ' + name.compile());
    }
    if (description.hasValue) {
      expressions.add('collections.description ' + description.compile());
    }
    if (website.hasValue) {
      expressions.add('collections.website ' + website.compile());
    }
    if (public.hasValue) {
      expressions.add('collections.public ' + public.compile());
    }
    if (featured.hasValue) {
      expressions.add('collections.featured ' + featured.compile());
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
