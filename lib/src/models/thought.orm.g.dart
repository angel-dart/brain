// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: PostgresORMGenerator
// Target: class _Thought
// **************************************************************************

import 'dart:async';
import 'package:angel_orm/angel_orm.dart';
import 'package:postgres/postgres.dart';
import 'thought.dart';

class ThoughtQuery {
  final List<String> _and = [];

  final List<String> _or = [];

  final List<String> _not = [];

  final ThoughtQueryWhere where = new ThoughtQueryWhere();

  void and(ThoughtQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _and.add(compiled);
    }
  }

  void or(ThoughtQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _or.add(compiled);
    }
  }

  void not(ThoughtQuery other) {
    var compiled = other.where.toWhereClause(keyword: false);
    if (compiled != null) {
      _not.add(compiled);
    }
  }

  String toSql() {
    var buf = new StringBuffer('SELECT * FROM "thoughts"');
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

  static Thought parseRow(List row) {
    return new Thought.fromJson({
      'id': row[0].toString(),
      'type': row[1],
      'title': row[2],
      'description': row[3],
      'url': row[4],
      'created_at': row[5],
      'updated_at': row[6]
    });
  }

  Stream<Thought> get(PostgreSQLConnection connection) {
    StreamController<Thought> ctrl = new StreamController<Thought>();
    connection.query(toSql()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<Thought> getOne(int id, PostgreSQLConnection connection) {
    return connection.query('SELECT * FROM "thoughts" WHERE "id" = @id;',
        substitutionValues: {'id': id}).then((rows) => parseRow(rows.first));
  }

  Stream<Thought> update(PostgreSQLConnection connection,
      {String type,
      String title,
      String description,
      String url,
      DateTime createdAt,
      DateTime updatedAt}) {
    var buf = new StringBuffer(
        'UPDATE "thoughts" SET ("type", "title", "description", "url", "created_at", "updated_at") = (@type, @title, @description, @url, @createdAt, @updatedAt) ');
    var whereClause = where.toWhereClause();
    if (whereClause == null) {
      buf.write('WHERE "id" = @id');
    } else {
      buf.write(whereClause);
    }
    var __ormNow__ = new DateTime.now();
    var ctrl = new StreamController<Thought>();
    connection.query(
        buf.toString() +
            ' RETURNING "id", "type", "title", "description", "url", "created_at", "updated_at";',
        substitutionValues: {
          'type': type,
          'title': title,
          'description': description,
          'url': url,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        }).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  Stream<Thought> delete(PostgreSQLConnection connection) {
    var buf = new StringBuffer('DELETE FROM "thoughts"');
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
        ' RETURNING "id", "type", "title", "description", "url", "created_at", "updated_at";');
    StreamController<Thought> ctrl = new StreamController<Thought>();
    connection.query(buf.toString()).then((rows) {
      rows.map(parseRow).forEach(ctrl.add);
      ctrl.close();
    }).catchError(ctrl.addError);
    return ctrl.stream;
  }

  static Future<Thought> deleteOne(
      int id, PostgreSQLConnection connection) async {
    var result = await connection.query(
        'DELETE FROM "thoughts" WHERE id = @id RETURNING "id", "type", "title", "description", "url", "created_at", "updated_at";',
        substitutionValues: {'id': id});
    return parseRow(result[0]);
  }

  static Future<Thought> insert(PostgreSQLConnection connection,
      {String type,
      String title,
      String description,
      String url,
      DateTime createdAt,
      DateTime updatedAt}) async {
    var __ormNow__ = new DateTime.now();
    var result = await connection.query(
        'INSERT INTO "thoughts" ("type", "title", "description", "url", "created_at", "updated_at") VALUES (@type, @title, @description, @url, @createdAt, @updatedAt) RETURNING "id", "type", "title", "description", "url", "created_at", "updated_at";',
        substitutionValues: {
          'type': type,
          'title': title,
          'description': description,
          'url': url,
          'createdAt': createdAt != null ? createdAt : __ormNow__,
          'updatedAt': updatedAt != null ? updatedAt : __ormNow__
        });
    return parseRow(result[0]);
  }

  static Future<Thought> insertThought(
      PostgreSQLConnection connection, Thought thought) {
    return ThoughtQuery.insert(connection,
        type: thought.type,
        title: thought.title,
        description: thought.description,
        url: thought.url,
        createdAt: thought.createdAt,
        updatedAt: thought.updatedAt);
  }

  static Future<Thought> updateThought(
      PostgreSQLConnection connection, Thought thought) {
    var query = new ThoughtQuery();
    query.where.id.equals(int.parse(thought.id));
    return query
        .update(connection,
            type: thought.type,
            title: thought.title,
            description: thought.description,
            url: thought.url,
            createdAt: thought.createdAt,
            updatedAt: thought.updatedAt)
        .first;
  }

  static Stream<Thought> getAll(PostgreSQLConnection connection) =>
      new ThoughtQuery().get(connection);
}

class ThoughtQueryWhere {
  final NumericSqlExpressionBuilder<int> id =
      new NumericSqlExpressionBuilder<int>();

  final StringSqlExpressionBuilder type = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder title = new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder description =
      new StringSqlExpressionBuilder();

  final StringSqlExpressionBuilder url = new StringSqlExpressionBuilder();

  final DateTimeSqlExpressionBuilder createdAt =
      new DateTimeSqlExpressionBuilder('created_at');

  final DateTimeSqlExpressionBuilder updatedAt =
      new DateTimeSqlExpressionBuilder('updated_at');

  String toWhereClause({bool keyword}) {
    final List<String> expressions = [];
    if (id.hasValue) {
      expressions.add('"id" ' + id.compile());
    }
    if (type.hasValue) {
      expressions.add('"type" ' + type.compile());
    }
    if (title.hasValue) {
      expressions.add('"title" ' + title.compile());
    }
    if (description.hasValue) {
      expressions.add('"description" ' + description.compile());
    }
    if (url.hasValue) {
      expressions.add('"url" ' + url.compile());
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
