import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:walleti/features/transactions/domain/entities/transaction.dart';
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

// Converters
class TransactionsTypeConverter extends TypeConverter<TransactionType, String> {
  const TransactionsTypeConverter();

  @override
  TransactionType fromSql(String fromDb) {
    TransactionType.values.map((e) {
      if (e.name == fromDb) {
        return e;
      }
    });
    return TransactionType.income;
  }

  @override
  String toSql(TransactionType value) => value.name;
}

class ColorConverter extends TypeConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromSql(int fromDb) => Color(fromDb);

  @override
  int toSql(Color value) => value.value;
}
