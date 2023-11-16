import 'dart:ui';

import 'package:drift/drift.dart';

import '../../../features/transactions/domain/entities/transaction.dart';

mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}

// Converters
class ColorConverter extends TypeConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromSql(int fromDb) => Color(fromDb);

  @override
  int toSql(Color value) => value.value;
}

class TransactionsTypeConverter extends TypeConverter<TransactionType, String> {
  const TransactionsTypeConverter();

  @override
  TransactionType fromSql(String fromDb) {
    try {
      return TransactionType.values.byName(fromDb);
    } catch (e) {
      return TransactionType.unknown;
    }
  }

  @override
  String toSql(TransactionType value) => value.name;
}
