// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: PostgresORMGenerator
// Target: class _CollectionEntry
// **************************************************************************

import 'dart:async';
import 'package:angel_orm/angel_orm.dart';
import 'package:postgres/postgres.dart';
import 'collection_entry.dart';

class CollectionEntryQuery {
  final List<String> _and = [];

  final List<String> _or = [];

  final List<String> _not = [];

  final CollectionEntryQueryWhere where = new CollectionEntryQueryWhere();

  void and(CollectionEntryQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _and.add(compiled);
    }
  }

  void or(CollectionEntryQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _or.add(compiled);
    }
  }

  void not(CollectionEntryQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _not.add(compiled);
    }
  }

  String toSql() {
    var buf = new StringBuffer('SELECT * FROM "collection_entries"');
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

  static CollectionEntry parseRow(List row) {
    return new CollectionEntry.fromJson({
      'id': row[0].toString(),
      'collection_id': row[1],
      'pub_package_id': row[2],
      'created_at': row[3],
      'updated_at': row[4]
    });
  }

  Stream<CollectionEntry> get(PostgreSQLConnection connection) {
    StreamController<CollectionEntry> ctrl =
        new StreamController<CollectionEntry>();
    connection.query(toSql()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<CollectionEntry> getOne(
      int id, PostgreSQLConnection connection) {
    return connection.query(
        'SELECT * FROM "collection_entries" WHERE "id" = @id;',
        substitutionValues: {'id': id}).then((rows) => parseRow(rows.first));
  }

  Stream<CollectionEntry> update(PostgreSQLConnection connection,
      {String collectionId,
      String pubPackageId,
      DateTime createdAt,
      DateTime updatedAt}) {
    var buf = new StringBuffer(
        'UPDATE "collection_entries" SET ("collection_id", "pub_package_id", "created_at", "updated_at") = (@collectionId, @pubPackageId, @createdAt, @updatedAt) ');
    var whereClause = where.toWhereClause();
    if (whereClause == null) {
      buf.write('WHERE "id" = @id');
    } else {
      buf.write(whereClause);
    }
    var __ormNow__ = new DateTime.now();
    var ctrl = new StreamController<CollectionEntry>();
    connection.query(
        buf.toString() +
            ' RETURNING "id", "collection_id", "pub_package_id", "created_at", "updated_at";',
        substitutionValues: {
          'collectionId': collectionId,
          'pubPackageId': pubPackageId,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        }).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  Stream<CollectionEntry> delete(PostgreSQLConnection connection) {
    var buf = new StringBuffer('DELETE FROM "collection_entries"');
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
        ' RETURNING "id", "collection_id", "pub_package_id", "created_at", "updated_at";');
    StreamController<CollectionEntry> ctrl =
        new StreamController<CollectionEntry>();
    connection.query(buf.toString()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<CollectionEntry> deleteOne(
      int id, PostgreSQLConnection connection) async {
    var result = await connection.query(
        'DELETE FROM "collection_entries" WHERE id = @id RETURNING "id", "collection_id", "pub_package_id", "created_at", "updated_at";',
        substitutionValues: {'id': id});
    return parseRow(result[0]);
  }

  static Future<CollectionEntry> insert(PostgreSQLConnection connection,
      {String collectionId,
      String pubPackageId,
      DateTime createdAt,
      DateTime updatedAt}) async {
    var __ormNow__ = new DateTime.now();
    var result = await connection.query(
        'INSERT INTO "collection_entries" ("collection_id", "pub_package_id", "created_at", "updated_at") VALUES (@collectionId, @pubPackageId, @createdAt, @updatedAt) RETURNING "id", "collection_id", "pub_package_id", "created_at", "updated_at";',
        substitutionValues: {
          'collectionId': collectionId,
          'pubPackageId': pubPackageId,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        });
    return parseRow(result[0]);
  }

  static Future<CollectionEntry> insertCollectionEntry(
      PostgreSQLConnection connection, CollectionEntry collection_entry) {
    return CollectionEntryQuery.insert(connection,
        collectionId: collection_entry.collectionId,
        pubPackageId: collection_entry.pubPackageId,
        createdAt: collection_entry.createdAt,
        updatedAt: collection_entry.updatedAt);
  }

  static Future<CollectionEntry> updateCollectionEntry(
      PostgreSQLConnection connection, CollectionEntry collection_entry) {
    var query = new CollectionEntryQuery();
    query.where.id.equals(int.parse(collection_entry.id));
    return query
        .update(connection,
            collectionId: collection_entry.collectionId,
            pubPackageId: collection_entry.pubPackageId,
            createdAt: collection_entry.createdAt,
            updatedAt: collection_entry.updatedAt)
        .first;
  }

  static Stream<CollectionEntry> getAll(PostgreSQLConnection connection) =>
      new CollectionEntryQuery().get(connection);
}

class CollectionEntryQueryWhere {
  final NumericSqlExpressionBuilder<int> id =
      new NumericSqlExpressionBuilder<int>();

  final StringSqlExpressionBuilder collectionId =
      new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder pubPackageId =
      new StringSqlExpressionBuilder();

  final DateTimeSqlExpressionBuilder createdAt =
      new DateTimeSqlExpressionBuilder('created_at');

  final DateTimeSqlExpressionBuilder updatedAt =
      new DateTimeSqlExpressionBuilder('updated_at');

  String toWhereClause({bool keyword}) {
    final List<String> expressions = [];
    if (id.hasValue) {
      expressions.add('"id" ' + id.compile());
    }
    if (collectionId.hasValue) {
      expressions.add('"collection_id" ' + collectionId.compile());
    }
    if (pubPackageId.hasValue) {
      expressions.add('"pub_package_id" ' + pubPackageId.compile());
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
