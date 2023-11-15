import 'package:flutter/material.dart';

import '../../../../shared/data/local/database.dart';
import '../../../../shared/extensions/date_time_extention.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/utils/utils.dart';
import '../../domain/entities/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem(this.tnx, {super.key, required this.onTap});

  final TransactionData tnx;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final isExpense = tnx.type.isExpenseType();

    return ListTile(
      onTap: onTap,
      title: Row(
        children: [
          // Text(tnx.category ? tnx.category : 'Unknown'),
          const SizedBox(width: 8),
          Text(tnx.createdAt.relateiveDate),
        ],
      ),
      trailing: Text.rich(
        TextSpan(
          children: [
            if (isExpense) const TextSpan(text: '-'),
            if (!isExpense)
              const WidgetSpan(
                child: Text('+', style: TextStyle(fontSize: 12, color: AppColors.income, fontWeight: FontWeight.w600)),
                alignment: PlaceholderAlignment.middle,
              ),
            TextSpan(text: Formatters.currency.format(tnx.amount)),
          ],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isExpense ? AppColors.expense : AppColors.income,
          ),
        ),
      ),
    );
  }
}
