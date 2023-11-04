import 'package:flutter/material.dart';

import '../../../../shared/extensions/date_time_extention.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/utils/utils.dart';
import '../../domain/entities/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem(this.tnx, {super.key});

  final Transaction tnx;

  @override
  Widget build(BuildContext context) {
    final isExpanse = Transaction.isExpanseType(tnx.type);

    return ListTile(
      onTap: () {
        print('asdf');
      },
      title: Row(
        children: [
          Text(tnx.category ?? 'Unknown'),
          const SizedBox(width: 8),
          Text(tnx.createdAt.relateiveDate),
        ],
      ),
      trailing: Text.rich(
        TextSpan(
          children: [
            if (isExpanse) const TextSpan(text: '-'),
            if (!isExpanse)
              const WidgetSpan(
                child: Text('+', style: TextStyle(fontSize: 12, color: AppColors.income, fontWeight: FontWeight.w600)),
                alignment: PlaceholderAlignment.middle,
              ),
            TextSpan(text: Formatters.currency.format(tnx.amount)),
          ],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isExpanse ? AppColors.expanse : AppColors.income,
          ),
        ),
      ),
    );
  }
}
