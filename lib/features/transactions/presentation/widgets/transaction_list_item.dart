import 'package:flutter/material.dart';

import '../../domain/entities/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem(this.tnx, {super.key});

  final Transaction tnx;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tnx.category ?? 'Unknown'),
      trailing: Text('${tnx.type == TransactionType.income ? '+' : '-'} ${tnx.amount}'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(width: 1, color: Colors.grey.shade200),
      ),
      tileColor: Colors.white,
    );
  }
}
