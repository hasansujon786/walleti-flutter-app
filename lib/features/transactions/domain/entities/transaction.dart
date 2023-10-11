class Transaction {
  Transaction({
    required this.amount,
    required this.type,
    this.category,
    this.note,
  });

  double amount;
  TransactionType type;
  String? category;
  String? note;

  Transaction copyWith({
    double? amount,
    String? category,
    TransactionType? type,
    String? note,
  }) {
    return Transaction(
      amount: amount ?? this.amount,
      type: type ?? this.type,
      category: category ?? this.category,
      note: note ?? this.note,
    );
  }

  @override
  String toString() {
    return 'amount $amount, type $type, category $category, note $note';
  }

  static bool isExpanseType(TransactionType cType) {
    return cType == TransactionType.expance;
  }

  static bool isIncomeType(TransactionType cType) {
    return cType == TransactionType.income;
  }
}

enum TransactionType {
  income,
  expance,
}
