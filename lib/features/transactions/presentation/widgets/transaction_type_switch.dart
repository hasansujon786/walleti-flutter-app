import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';

const _wrapperWidth = 200.0;
const _swWidth = _wrapperWidth / 2;

class TransactionTypeSwitch extends StatefulWidget {
  const TransactionTypeSwitch({super.key, required this.controller});

  final PageController controller;

  @override
  State<TransactionTypeSwitch> createState() => _TransactionTypeSwitchState();
}

class _TransactionTypeSwitchState extends State<TransactionTypeSwitch> {
  late double curPage = widget.controller.initialPage.toDouble();

  void changePage() {
    if (curPage == 1) {
      widget.controller.previousPage(duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
    } else {
      widget.controller.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      curPage = widget.controller.page ?? 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _wrapperWidth,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: curPage * _swWidth,
            bottom: 5,
            child: Container(width: _swWidth, height: 2, color: Theme.of(context).primaryColor),
          ),
          Row(
            children: [
              buildSwitch('Expense', curPage < 1),
              buildSwitch('Income', curPage > 0),
            ],
          ),
        ],
      ),
    );
  }

  TextButton buildSwitch(String text, bool isActiveSW) {
    const disableColor = AppColors.grey;
    final primaryColor = Theme.of(context).primaryColor;

    return TextButton(
      onPressed: isActiveSW ? null : changePage,
      style: const ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(_swWidth, 48))),
      child: Text(
        text,
        style: TextStyle(
          color: isActiveSW ? primaryColor : disableColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
