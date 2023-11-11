import 'package:flutter/material.dart';
import 'package:flutter_awesome_calculator/flutter_awesome_calculator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_styles.dart';
import '../../domain/entities/transaction.dart';
import '../providers/providers.dart';
import 'widgets.dart';

showTransactionForm(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) => const TransactionForm(),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
  );
}

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _isSaveBtnDisablled = false;
  var _isNoteInputVisibled = false;
  var _isCategoryListVisibled = true;

  // transaction input value
  double _inputAmount = 0;
  late TextEditingController _noteController;
  var _choosenTransactinType = TransactionType.expance;
  var _choosenDate = DateTime.now();
  String? _choosenCategory;
  var _inputAmountExpression = '';

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _toggleNote() {
    setState(() => _isNoteInputVisibled = !_isNoteInputVisibled);
  }

  void _handleOnSave(BuildContext context, WidgetRef ref) async {
    final tnxInput = TransactionInput(
      amount: _inputAmount,
      type: _choosenTransactinType,
      // TODO: add category
      // category: _choosenCategory,
      note: _isNoteInputVisibled && _noteController.text.isNotEmpty ? _noteController.text : null,
      createdAt: _choosenDate,
    );

    ref.read(transactionListProvider.notifier).addTransaction(tnxInput).then((_) {
      Navigator.pop(context);
    });
  }

  void _handleOnCategorySelect(String value, TransactionType type) {
    setState(() {
      _choosenCategory = value;
      _choosenTransactinType = type;
      _isCategoryListVisibled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isCategoryListVisibled) {
      return TnxCategoryPikcer(
        onSelect: _handleOnCategorySelect,
        initialTnxType: _choosenTransactinType,
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            // content padding MediaQuery.of(context).viewInsets.bottom
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCurrentCategory(),
                    const SizedBox(width: 8),
                    _buildInputAmount(),
                  ],
                ),
                if (_isNoteInputVisibled) _buildNoteInput(),
                const SizedBox(height: 8),
                TransactionFormToolBar(
                  onSave: _handleOnSave,
                  toggleNote: _toggleNote,
                  isSaveBtnDisablled: _inputAmount <= 0 || _inputAmount.isNegative || _isSaveBtnDisablled,
                  onSelectNewDate: (newDate) {
                    if (newDate != null) {
                      _choosenDate = newDate;
                    }
                  },
                ),
              ],
            ),
          ),
          FlutterAwesomeCalculator(
            showAnswerField: false,
            height: 292,
            context: context,
            buttonRadius: AppStyles.roundedXl,
            digitsButtonColor: AppColors.white,
            clearButtonColor: AppColors.primary,
            operatorsButtonColor: AppColors.primaryLight,
            backgroundColor: Colors.transparent,
            expressionAnswerColor: Colors.black,
            onChanged: (answer, expression) {
              _inputAmountExpression = expression;
              if (answer.isEmpty) {
                _inputAmount = 0;
              } else {
                _inputAmount = double.tryParse(answer) ?? 0;
              }
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInputAmount() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 4),
          Text(_inputAmountExpression, style: const TextStyle(fontSize: 14)),
          Text('\$$_inputAmount', style: const TextStyle(fontSize: 28)),
        ],
      ),
    );
  }

  Column _buildCurrentCategory() {
    final isExpanseType = TransactionInput.isExpanseType(_choosenTransactinType);
    return Column(
      children: [
        TransactionCategoryTile(
          category: _choosenCategory ?? 'U',
          onSelect: (_) => setState(() => _isCategoryListVisibled = true),
        ),
        const SizedBox(height: 4),
        Text(
          isExpanseType ? 'Expanse' : 'Income',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isExpanseType ? AppColors.expanse : AppColors.income,
          ),
        )
      ],
    );
  }

  Widget _buildNoteInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TextField(
        controller: _noteController,
        decoration: const InputDecoration(
          labelText: 'Note',
        ),
      ),
    );
  }
}
