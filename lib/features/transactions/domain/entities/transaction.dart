class Transaction {
  Transaction({
    required this.amount,
    required this.type,
    required this.createdAt,
    this.category,
    this.note,
  });

  double amount;
  TransactionType type;
  String? category;
  String? note;
  DateTime createdAt;

  Transaction copyWith({
    double? amount,
    String? category,
    TransactionType? type,
    DateTime? createdAt,
    String? note,
  }) {
    return Transaction(
      amount: amount ?? this.amount,
      type: type ?? this.type,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      note: note ?? this.note,
    );
  }

  @override
  String toString() {
    return 'amount $amount, type $type, category $category, note $note, createdAt $createdAt';
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
