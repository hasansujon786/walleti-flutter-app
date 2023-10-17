import 'package:flutter/material.dart';

import 'transaction_category_tile.dart';

class TransactionCategoryList extends StatelessWidget {
  const TransactionCategoryList({
    super.key,
    required this.onCategorySelect,
  });

  final void Function(String) onCategorySelect;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      children: [
        TransactionCategoryTile(category: '1', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '2', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '3', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '4', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '5', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '6', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '7', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '8', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '9', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '10', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '11', onSelect: onCategorySelect),
        TransactionCategoryTile(category: '12', onSelect: onCategorySelect),
      ],
    );
  }
}
