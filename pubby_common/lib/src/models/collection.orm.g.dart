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
  final List<String> _and = [];

  final List<String> _or = [];

  final List<String> _not = [];

  final CollectionQueryWhere where = new CollectionQueryWhere();

  void and(CollectionQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _and.add(compiled);
    }
  }

  void or(CollectionQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _or.add(compiled);
    }
  }

  void not(CollectionQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _not.add(compiled);
    }
  }

  String toSql() {
    var buf = new StringBuffer('SELECT * FROM "collections"');
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

  static Collection parseRow(List row) {
    return new Collection.fromJson({
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
  }

  Stream<Collection> get(PostgreSQLConnection connection) {
    StreamController<Collection> ctrl = new StreamController<Collection>();
    connection.query(toSql()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<Collection> getOne(int id, PostgreSQLConnection connection) {
    return connection.query('SELECT * FROM "collections" WHERE "id" = @id;',
        substitutionValues: {'id': id}).then((rows) => parseRow(rows.first));
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
        }).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  Stream<Collection> delete(PostgreSQLConnection connection) {
    var buf = new StringBuffer('DELETE FROM "collections"');
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
        ' RETURNING "id", "user_id", "name", "description", "website", "public", "featured", "created_at", "updated_at";');
    StreamController<Collection> ctrl = new StreamController<Collection>();
    connection.query(buf.toString()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
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
    return parseRow(result[0]);
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
      new DateTimeSqlExpressionBuilder('created_at');

  final DateTimeSqlExpressionBuilder updatedAt =
      new DateTimeSqlExpressionBuilder('updated_at');

  String toWhereClause({bool keyword}) {
    final List<String> expressions = [];
    if (id.hasValue) {
      expressions.add('"id" ' + id.compile());
    }
    if (userId.hasValue) {
      expressions.add('"user_id" ' + userId.compile());
    }
    if (name.hasValue) {
      expressions.add('"name" ' + name.compile());
    }
    if (description.hasValue) {
      expressions.add('"description" ' + description.compile());
    }
    if (website.hasValue) {
      expressions.add('"website" ' + website.compile());
    }
    if (public.hasValue) {
      expressions.add('"public" ' + public.compile());
    }
    if (featured.hasValue) {
      expressions.add('"featured" ' + featured.compile());
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
