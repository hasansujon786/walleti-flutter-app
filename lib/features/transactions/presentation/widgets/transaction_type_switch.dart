import 'package:flutter/material.dart';
import 'package:walleti/features/transactions/domain/entities/transaction.dart';

class TransactionTypeSwitch extends StatelessWidget {
  const TransactionTypeSwitch({
    super.key,
    this.selectedType = TransactionType.expance,
    this.onValueChange,
  });

  final TransactionType selectedType;
  final void Function(TransactionType)? onValueChange;

  void emmitIncome() {
    onValueChange?.call(TransactionType.income);
  }

  void emmitExpanse() {
    onValueChange?.call(TransactionType.expance);
  }

  @override
  Widget build(BuildContext context) {
    final isExpanseType = Transaction.isExpanseType(selectedType);
    final primaryColor = Theme.of(context).primaryColor;
    final disableColor = Colors.grey.shade500;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: selectedType == TransactionType.expance ? null : 0,
          bottom: 5,
          child: Container(
            width: 48,
            height: 2,
            color: primaryColor,
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: !isExpanseType ? emmitExpanse : null,
              child: Text(
                'Expanse',
                style: TextStyle(color: isExpanseType ? primaryColor : disableColor),
              ),
            ),
            const SizedBox(width: 4),
            TextButton(
              onPressed: isExpanseType ? emmitIncome : null,
              child: Text(
                'Income',
                style: TextStyle(color: !isExpanseType ? primaryColor : disableColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
