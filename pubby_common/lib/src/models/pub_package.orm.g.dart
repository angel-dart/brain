// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: PostgresORMGenerator
// Target: class _PubPackage
// **************************************************************************

import 'dart:async';
import 'package:angel_orm/angel_orm.dart';
import 'package:postgres/postgres.dart';
import 'pub_package.dart';

class PubPackageQuery {
  final Map<PubPackageQuery, bool> _unions = {};

  String _sortKey;

  String _sortMode;

  int limit;

  int offset;

  final List<PubPackageQueryWhere> _or = [];

  final PubPackageQueryWhere where = new PubPackageQueryWhere();

  void union(PubPackageQuery query) {
    _unions[query] = false;
  }

  void unionAll(PubPackageQuery query) {
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

  void or(PubPackageQueryWhere selector) {
    _or.add(selector);
  }

  String toSql([String prefix]) {
    var buf = new StringBuffer();
    buf.write(prefix != null
        ? prefix
        : 'SELECT id, user_id, name, version_string, description, readme, tags, donation_link, pre_release, created_at, updated_at FROM "pub_packages"');
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

  static PubPackage parseRow(List row) {
    var result = new PubPackage.fromJson({
      'id': row[0].toString(),
      'user_id': row[1],
      'name': row[2],
      'version_string': row[3],
      'description': row[4],
      'readme': row[5],
      'tags': row[6],
      'donation_link': row[7],
      'pre_release': row[8],
      'created_at': row[9],
      'updated_at': row[10]
    });
    return result;
  }

  Stream<PubPackage> get(PostgreSQLConnection connection) {
    StreamController<PubPackage> ctrl = new StreamController<PubPackage>();
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

  static Future<PubPackage> getOne(int id, PostgreSQLConnection connection) {
    var query = new PubPackageQuery();
    query.where.id.equals(id);
    return query.get(connection).first.catchError((_) => null);
  }

  Stream<PubPackage> update(PostgreSQLConnection connection,
      {String userId,
      String name,
      String versionString,
      String description,
      String readme,
      String tags,
      String donationLink,
      bool preRelease,
      DateTime createdAt,
      DateTime updatedAt}) {
    var buf = new StringBuffer(
        'UPDATE "pub_packages" SET ("user_id", "name", "version_string", "description", "readme", "tags", "donation_link", "pre_release", "created_at", "updated_at") = (@userId, @name, @versionString, @description, @readme, @tags, @donationLink, @preRelease, @createdAt, @updatedAt) ');
    var whereClause = where.toWhereClause();
    if (whereClause == null) {
      buf.write('WHERE "id" = @id');
    } else {
      buf.write(whereClause);
    }
    var __ormNow__ = new DateTime.now();
    var ctrl = new StreamController<PubPackage>();
    connection.query(
        buf.toString() +
            ' RETURNING "id", "user_id", "name", "version_string", "description", "readme", "tags", "donation_link", "pre_release", "created_at", "updated_at";',
        substitutionValues: {
          'userId': userId,
          'name': name,
          'versionString': versionString,
          'description': description,
          'readme': readme,
          'tags': tags,
          'donationLink': donationLink,
          'preRelease': preRelease,
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

  Stream<PubPackage> delete(PostgreSQLConnection connection) {
    StreamController<PubPackage> ctrl = new StreamController<PubPackage>();
    connection
        .query(toSql('DELETE FROM "pub_packages"') +
            ' RETURNING "id", "user_id", "name", "version_string", "description", "readme", "tags", "donation_link", "pre_release", "created_at", "updated_at";')
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

  static Future<PubPackage> deleteOne(
      int id, PostgreSQLConnection connection) async {
    var result = await connection.query(
        'DELETE FROM "pub_packages" WHERE id = @id RETURNING "id", "user_id", "name", "version_string", "description", "readme", "tags", "donation_link", "pre_release", "created_at", "updated_at";',
        substitutionValues: {'id': id});
    return parseRow(result[0]);
  }

  static Future<PubPackage> insert(PostgreSQLConnection connection,
      {String userId,
      String name,
      String versionString,
      String description,
      String readme,
      String tags,
      String donationLink,
      bool preRelease,
      DateTime createdAt,
      DateTime updatedAt}) async {
    var __ormNow__ = new DateTime.now();
    var result = await connection.query(
        'INSERT INTO "pub_packages" ("user_id", "name", "version_string", "description", "readme", "tags", "donation_link", "pre_release", "created_at", "updated_at") VALUES (@userId, @name, @versionString, @description, @readme, @tags, @donationLink, @preRelease, @createdAt, @updatedAt) RETURNING "id", "user_id", "name", "version_string", "description", "readme", "tags", "donation_link", "pre_release", "created_at", "updated_at";',
        substitutionValues: {
          'userId': userId,
          'name': name,
          'versionString': versionString,
          'description': description,
          'readme': readme,
          'tags': tags,
          'donationLink': donationLink,
          'preRelease': preRelease,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        });
    var output = parseRow(result[0]);
    return output;
  }

  static Future<PubPackage> insertPubPackage(
      PostgreSQLConnection connection, PubPackage pubPackage) {
    return PubPackageQuery.insert(connection,
        userId: pubPackage.userId,
        name: pubPackage.name,
        versionString: pubPackage.versionString,
        description: pubPackage.description,
        readme: pubPackage.readme,
        tags: pubPackage.tags,
        donationLink: pubPackage.donationLink,
        preRelease: pubPackage.preRelease,
        createdAt: pubPackage.createdAt,
        updatedAt: pubPackage.updatedAt);
  }

  static Future<PubPackage> updatePubPackage(
      PostgreSQLConnection connection, PubPackage pubPackage) {
    var query = new PubPackageQuery();
    query.where.id.equals(int.parse(pubPackage.id));
    return query
        .update(connection,
            userId: pubPackage.userId,
            name: pubPackage.name,
            versionString: pubPackage.versionString,
            description: pubPackage.description,
            readme: pubPackage.readme,
            tags: pubPackage.tags,
            donationLink: pubPackage.donationLink,
            preRelease: pubPackage.preRelease,
            createdAt: pubPackage.createdAt,
            updatedAt: pubPackage.updatedAt)
        .first;
  }

  static Stream<PubPackage> getAll(PostgreSQLConnection connection) =>
      new PubPackageQuery().get(connection);
}

class PubPackageQueryWhere {
  final NumericSqlExpressionBuilder<int> id =
      new NumericSqlExpressionBuilder<int>();

  final StringSqlExpressionBuilder userId = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder name = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder versionString =
      new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder description =
      new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder readme = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder tags = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder donationLink =
      new StringSqlExpressionBuilder();

  final BooleanSqlExpressionBuilder preRelease =
      new BooleanSqlExpressionBuilder();

  final DateTimeSqlExpressionBuilder createdAt =
      new DateTimeSqlExpressionBuilder('pub_packages.created_at');

  final DateTimeSqlExpressionBuilder updatedAt =
      new DateTimeSqlExpressionBuilder('pub_packages.updated_at');

  String toWhereClause({bool keyword}) {
    final List<String> expressions = [];
    if (id.hasValue) {
      expressions.add('pub_packages.id ' + id.compile());
    }
    if (userId.hasValue) {
      expressions.add('pub_packages.user_id ' + userId.compile());
    }
    if (name.hasValue) {
      expressions.add('pub_packages.name ' + name.compile());
    }
    if (versionString.hasValue) {
      expressions.add('pub_packages.version_string ' + versionString.compile());
    }
    if (description.hasValue) {
      expressions.add('pub_packages.description ' + description.compile());
    }
    if (readme.hasValue) {
      expressions.add('pub_packages.readme ' + readme.compile());
    }
    if (tags.hasValue) {
      expressions.add('pub_packages.tags ' + tags.compile());
    }
    if (donationLink.hasValue) {
      expressions.add('pub_packages.donation_link ' + donationLink.compile());
    }
    if (preRelease.hasValue) {
      expressions.add('pub_packages.pre_release ' + preRelease.compile());
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
