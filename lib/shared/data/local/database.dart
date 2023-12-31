import 'dart:io';
import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

import '../../../features/transactions/data/models/transaction_model.dart';
import '../../../features/transactions/domain/entities/transaction.dart';
import './database_util.dart';

part 'database.g.dart';

@singleton
@DriftDatabase(tables: [TransactionEntries, Categories])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @disposeMethod
  void dispose() {
    // close databse on dispose singleton instance
    close();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

// @Riverpod(keepAlive: true)
// AppDatabase appDatabase(AppDatabaseRef ref) {
//   final database = AppDatabase();
//   ref.onDispose(database.close);
//   return database;
// }

