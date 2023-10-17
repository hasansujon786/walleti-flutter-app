import 'package:flutter/material.dart';

class TransactionCategoryTile extends StatelessWidget {
  const TransactionCategoryTile({
    super.key,
    this.onSelect,
    required this.category,
  });

  final String category;
  final void Function(String)? onSelect;

  void emmitTxnCategoryOnSelect() {
    onSelect?.call(category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: emmitTxnCategoryOnSelect,
      borderRadius: BorderRadius.circular(8.0),
      child: Ink(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(category, style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
    );
  }
}
