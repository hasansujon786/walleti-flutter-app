import 'package:walleti/shared/data/local/database.dart';

class TransactionInput extends TransactionData {
  TransactionInput({
    String? note,
    int? category,
    required double amount,
    required DateTime createdAt,
    required TransactionType type,
  }) : super(id: 0, amount: amount, type: type, createdAt: createdAt, note: note, category: category);

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
