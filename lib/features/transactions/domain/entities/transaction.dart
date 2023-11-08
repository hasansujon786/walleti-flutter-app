import 'package:walleti/shared/data/local/database.dart';

class TransactionInput extends TransactionData {
  TransactionInput({
    String? note,
    int? category,
    required double amount,
    required DateTime createdAt,
    required TransactionType type,
  }) : super(id: 0, amount: amount, type: type, createdAt: createdAt, note: note, category: category);

  static bool isExpanseType(TransactionType cType) {
    return cType == TransactionType.expance;
  }

  static bool isIncomeType(TransactionType cType) {
    return cType == TransactionType.income;
  }

  static TransactionInput as(TransactionData data) {
    return TransactionInput(
      amount: data.amount,
      type: data.type,
      createdAt: data.createdAt,
      note: data.note,
      category: data.category,
    );
  }
}

enum TransactionType {
  expance,
  income,
}
