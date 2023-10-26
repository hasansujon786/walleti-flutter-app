import 'package:flutter/material.dart';

import '../../../../shared/extensions/date_time_extention.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../domain/entities/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem(this.tnx, {super.key});

  final Transaction tnx;

  @override
  Widget build(BuildContext context) {
    final isExpanse = Transaction.isExpanseType(tnx.type);

    return ListTile(
      title: Row(
        children: [
          Text(tnx.category ?? 'Unknown'),
          const SizedBox(width: 8),
          Text(tnx.createdAt.relateiveDate),
        ],
      ),
      trailing: Text(
        '${isExpanse ? '-' : '+'} ${tnx.amount}',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isExpanse ? AppColors.expanse : AppColors.income,
        ),
      ),
      tileColor: Colors.white,
    );
  }
}
