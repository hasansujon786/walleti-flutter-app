import 'package:flutter/material.dart';

import '../../domain/entities/transaction.dart';
import 'transaction_category_list.dart';
import 'transaction_type_switch.dart';

class TnxCategoryPikcer extends StatefulWidget {
  const TnxCategoryPikcer({
    super.key,
    this.onSelect,
    required this.initialTnxType,
  });

  final void Function(String, TransactionType)? onSelect;
  final TransactionType initialTnxType;

  @override
  State<TnxCategoryPikcer> createState() => _TnxCategoryPikcerState();
}

class _TnxCategoryPikcerState extends State<TnxCategoryPikcer> {
  late PageController pageController = PageController(
    initialPage: widget.initialTnxType.isExpenseType() ? 0 : 1,
  );

  void emmitCategoryOnSelect(String category) {
    var type = TransactionType.expense;
    if (pageController.page == 1) {
      type = TransactionType.income;
    }

    widget.onSelect?.call(category, type);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TransactionTypeSwitch(controller: pageController),
        SizedBox(
          height: 300,
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: [
              TransactionCategoryList(onCategorySelect: emmitCategoryOnSelect),
              TransactionCategoryList(onCategorySelect: emmitCategoryOnSelect),
            ],
          ),
        ),
      ],
    );
  }
}
