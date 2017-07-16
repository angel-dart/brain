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
  final Map<CollectionEntryQuery, bool> _unions = {};

  String _sortKey;

  String _sortMode;

  int limit;

  int offset;

  final List<CollectionEntryQueryWhere> _or = [];

  final CollectionEntryQueryWhere where = new CollectionEntryQueryWhere();

  void union(CollectionEntryQuery query) {
    _unions[query] = false;
  }

  void unionAll(CollectionEntryQuery query) {
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

  void or(CollectionEntryQueryWhere selector) {
    _or.add(selector);
  }

  String toSql([String prefix]) {
    var buf = new StringBuffer();
    buf.write(prefix != null
        ? prefix
        : 'SELECT id, collection_id, pub_package_id, created_at, updated_at FROM "collection_entries"');
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

  static CollectionEntry parseRow(List row) {
    var result = new CollectionEntry.fromJson({
      'id': row[0].toString(),
      'collection_id': row[1],
      'pub_package_id': row[2],
      'created_at': row[3],
      'updated_at': row[4]
    });
    return result;
  }

  Stream<CollectionEntry> get(PostgreSQLConnection connection) {
    StreamController<CollectionEntry> ctrl =
        new StreamController<CollectionEntry>();
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

  static Future<CollectionEntry> getOne(
      int id, PostgreSQLConnection connection) {
    var query = new CollectionEntryQuery();
    query.where.id.equals(id);
    return query.get(connection).first.catchError((_) => null);
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

  Stream<CollectionEntry> delete(PostgreSQLConnection connection) {
    StreamController<CollectionEntry> ctrl =
        new StreamController<CollectionEntry>();
    connection
        .query(toSql('DELETE FROM "collection_entries"') +
            ' RETURNING "id", "collection_id", "pub_package_id", "created_at", "updated_at";')
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
    var output = parseRow(result[0]);
    return output;
  }

  static Future<CollectionEntry> insertCollectionEntry(
      PostgreSQLConnection connection, CollectionEntry collectionEntry) {
    return CollectionEntryQuery.insert(connection,
        collectionId: collectionEntry.collectionId,
        pubPackageId: collectionEntry.pubPackageId,
        createdAt: collectionEntry.createdAt,
        updatedAt: collectionEntry.updatedAt);
  }

  static Future<CollectionEntry> updateCollectionEntry(
      PostgreSQLConnection connection, CollectionEntry collectionEntry) {
    var query = new CollectionEntryQuery();
    query.where.id.equals(int.parse(collectionEntry.id));
    return query
        .update(connection,
            collectionId: collectionEntry.collectionId,
            pubPackageId: collectionEntry.pubPackageId,
            createdAt: collectionEntry.createdAt,
            updatedAt: collectionEntry.updatedAt)
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
      new DateTimeSqlExpressionBuilder('collection_entries.created_at');

  final DateTimeSqlExpressionBuilder updatedAt =
      new DateTimeSqlExpressionBuilder('collection_entries.updated_at');

  String toWhereClause({bool keyword}) {
    final List<String> expressions = [];
    if (id.hasValue) {
      expressions.add('collection_entries.id ' + id.compile());
    }
    if (collectionId.hasValue) {
      expressions
          .add('collection_entries.collection_id ' + collectionId.compile());
    }
    if (pubPackageId.hasValue) {
      expressions
          .add('collection_entries.pub_package_id ' + pubPackageId.compile());
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
