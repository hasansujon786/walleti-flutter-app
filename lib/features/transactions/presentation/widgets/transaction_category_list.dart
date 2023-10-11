import 'package:flutter/material.dart';

import 'transaction_category_tile.dart';

class TransactionCategoryList extends StatelessWidget {
  const TransactionCategoryList({
    super.key,
    this.onSelect,
  });

  final void Function(String)? onSelect;

  void emmitOnSelect(val) {
    onSelect?.call(val);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      children: [
        TransactionCategoryTile(category: '1', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '2', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '3', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '4', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '5', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '6', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '7', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '8', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '9', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '10', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '11', onSelect: emmitOnSelect),
        TransactionCategoryTile(category: '12', onSelect: emmitOnSelect),
      ],
    );
  }
}
