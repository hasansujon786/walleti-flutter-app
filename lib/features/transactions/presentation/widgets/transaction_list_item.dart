import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../domain/entities/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem(this.tnx, {super.key});

  final Transaction tnx;

  @override
  Widget build(BuildContext context) {
    final isExpanse = Transaction.isExpanseType(tnx.type);

    return ListTile(
      title: Text(tnx.category ?? 'Unknown'),
      trailing: Text(
        '${isExpanse ? '-' : '+'} ${tnx.amount}',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isExpanse ? AppColors.expanse : AppColors.income,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(width: 1, color: Colors.grey.shade200),
      ),
      tileColor: Colors.white,
    );
  }
}
