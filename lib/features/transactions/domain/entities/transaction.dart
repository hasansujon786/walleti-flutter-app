class Transaction {
  Transaction({
    required this.title,
    required this.amount,
    required this.type,
  });

  String title;
  double amount;
  TransactionType type;

  Transaction copyWith({String? title, double? amount}) {
    return Transaction(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      type: type,
    );
  }
}

enum TransactionType {
  income,
  expance,
}
