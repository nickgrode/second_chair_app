// File: C:\Users\nickg\Projects\second_chair\lib\database_helper.dart
import 'package:drift/drift.dart';
import 'package:drift/native.dart' if (dart.library.html) 'package:drift/wasm.dart';
import 'package:drift/wasm.dart' show WasmDatabase;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database_helper.g.dart';

class Cases extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer()();
  TextColumn get jurisdictionType => text()();
  TextColumn get state => text().nullable()();
  TextColumn get county => text().nullable()();
  TextColumn get caseNumber => text()();
  TextColumn get charge => text()();
  TextColumn get assignedProsecutor => text().nullable()();
  IntColumn get nextHearingTypeId => integer()();
  DateTimeColumn get nextHearing => dateTime()();
}

class Clients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
}

class HearingTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().unique()();
}

@DriftDatabase(tables: [Cases, Clients, HearingTypes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Case>> watchUpcomingCases() {
    return (select(cases)..where((tbl) => tbl.nextHearing.isBiggerThanValue(DateTime.now()))).watch();
  }
}

DatabaseConnection _openConnection() {
  if (kIsWeb) {
    return DatabaseConnection.delayed(Future(() async {
      final result = await WasmDatabase.open(
        databaseName: 'second_chair_db',
        sqlite3Uri: Uri.parse('packages/drift/wasm/sqlite3.wasm'),
        driftWorkerUri: Uri.parse('packages/drift/wasm/drift_worker.js'),
      );
      return result.resolvedExecutor;
    }));
  } else {
    return DatabaseConnection(LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'second_chair.sqlite'));
      return NativeDatabase(file, logStatements: true);
    }));
  }
}