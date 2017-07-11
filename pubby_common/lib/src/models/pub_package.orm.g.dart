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
  final List<String> _and = [];

  final List<String> _or = [];

  final List<String> _not = [];

  final PubPackageQueryWhere where = new PubPackageQueryWhere();

  void and(PubPackageQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _and.add(compiled);
    }
  }

  void or(PubPackageQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _or.add(compiled);
    }
  }

  void not(PubPackageQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _not.add(compiled);
    }
  }

  String toSql() {
    var buf = new StringBuffer('SELECT * FROM "pub_packages"');
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

  static PubPackage parseRow(List row) {
    return new PubPackage.fromJson({
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
  }

  Stream<PubPackage> get(PostgreSQLConnection connection) {
    StreamController<PubPackage> ctrl = new StreamController<PubPackage>();
    connection.query(toSql()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<PubPackage> getOne(int id, PostgreSQLConnection connection) {
    return connection.query('SELECT * FROM "pub_packages" WHERE "id" = @id;',
        substitutionValues: {'id': id}).then((rows) => parseRow(rows.first));
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
        }).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  Stream<PubPackage> delete(PostgreSQLConnection connection) {
    var buf = new StringBuffer('DELETE FROM "pub_packages"');
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
        ' RETURNING "id", "user_id", "name", "version_string", "description", "readme", "tags", "donation_link", "pre_release", "created_at", "updated_at";');
    StreamController<PubPackage> ctrl = new StreamController<PubPackage>();
    connection.query(buf.toString()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
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
    return parseRow(result[0]);
  }

  static Future<PubPackage> insertPubPackage(
      PostgreSQLConnection connection, PubPackage pub_package) {
    return PubPackageQuery.insert(connection,
        userId: pub_package.userId,
        name: pub_package.name,
        versionString: pub_package.versionString,
        description: pub_package.description,
        readme: pub_package.readme,
        tags: pub_package.tags,
        donationLink: pub_package.donationLink,
        preRelease: pub_package.preRelease,
        createdAt: pub_package.createdAt,
        updatedAt: pub_package.updatedAt);
  }

  static Future<PubPackage> updatePubPackage(
      PostgreSQLConnection connection, PubPackage pub_package) {
    var query = new PubPackageQuery();
    query.where.id.equals(int.parse(pub_package.id));
    return query
        .update(connection,
            userId: pub_package.userId,
            name: pub_package.name,
            versionString: pub_package.versionString,
            description: pub_package.description,
            readme: pub_package.readme,
            tags: pub_package.tags,
            donationLink: pub_package.donationLink,
            preRelease: pub_package.preRelease,
            createdAt: pub_package.createdAt,
            updatedAt: pub_package.updatedAt)
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
    if (versionString.hasValue) {
      expressions.add('"version_string" ' + versionString.compile());
    }
    if (description.hasValue) {
      expressions.add('"description" ' + description.compile());
    }
    if (readme.hasValue) {
      expressions.add('"readme" ' + readme.compile());
    }
    if (tags.hasValue) {
      expressions.add('"tags" ' + tags.compile());
    }
    if (donationLink.hasValue) {
      expressions.add('"donation_link" ' + donationLink.compile());
    }
    if (preRelease.hasValue) {
      expressions.add('"pre_release" ' + preRelease.compile());
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
