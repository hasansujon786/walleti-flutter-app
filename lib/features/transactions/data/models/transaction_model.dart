import 'package:drift/drift.dart';
import 'package:walleti/shared/data/local/database_util.dart';

@DataClassName('TransactionData')
class TransactionEntries extends Table with AutoIncrementingPrimaryKey {
  RealColumn get amount => real()();
  TextColumn get type => text().map(const TransactionsTypeConverter())();
  DateTimeColumn get createdAt => dateTime()();

  TextColumn get note => text().nullable()();
  IntColumn get category => integer().nullable().references(Categories, #id)();
}

@DataClassName('CategoryData')
class Categories extends Table with AutoIncrementingPrimaryKey {
  TextColumn get name => text()();
  IntColumn get color => integer().map(const ColorConverter())();
}
