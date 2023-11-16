import 'package:walleti/shared/data/local/database.dart';

class TransactionInput extends TransactionData {
  TransactionInput({
    super.note,
    super.category,
    required super.amount,
    required super.createdAt,
    required super.type,
  }) : super(id: 0);

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
  expense,
  income,
  unknown,
}

extension TransactionTypeUtils on TransactionType {
  bool isExpenseType() {
    return this == TransactionType.expense;
  }

  bool isIncomeType() {
    return this == TransactionType.income;
  }
}
