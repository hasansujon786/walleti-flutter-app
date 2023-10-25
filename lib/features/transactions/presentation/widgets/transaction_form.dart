import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../domain/entities/transaction.dart';
import '../providers/template_provider.dart';
import 'tnx_category_pikcer.dart';
import 'transaction_category_tile.dart';
import 'transaction_form_toolbar.dart';

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

const btnText = AppColors.darkGreen;
const btnOutline = AppColors.extraLightGrey;

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  var _isSaveBtnDisablled = true;
  var _isNoteInputVisibled = false;
  var _isCategoryListVisibled = true;

  // transaction input value
  late TextEditingController _amountController;
  late TextEditingController _noteController;
  var _choosenTransactinType = TransactionType.expance;
  var _choosenDate = DateTime.now();
  String? _choosenCategory;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _noteController = TextEditingController();

    // disabllel btn if feild is empty
    _amountController.addListener(() {
      if (_isSaveBtnDisablled && _amountController.text.isNotEmpty) {
        setState(() => _isSaveBtnDisablled = false);
      } else if (!_isSaveBtnDisablled && _amountController.text.isEmpty) {
        setState(() => _isSaveBtnDisablled = true);
      }
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _toggleNote() {
    setState(() => _isNoteInputVisibled = !_isNoteInputVisibled);
  }

  void _handleOnSave(BuildContext context, WidgetRef ref) {
    final tnx = Transaction(
      amount: double.tryParse(_amountController.text) ?? 0,
      type: _choosenTransactinType,
      category: _choosenCategory,
      note: _isNoteInputVisibled && _noteController.text.isNotEmpty ? _noteController.text : null,
      createdAt: _choosenDate,
    );
    ref.read(transactionsProvider.notifier).create(tnx);
    Navigator.pop(context);
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
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 20, 16, MediaQuery.of(context).viewInsets.bottom), // content padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    TransactionCategoryTile(
                      category: _choosenCategory ?? 'U',
                      onSelect: (_) {
                        setState(() => _isCategoryListVisibled = true);
                      },
                    ),
                    const SizedBox(height: 4),
                    Text(Transaction.isExpanseType(_choosenTransactinType) ? 'Expanse' : 'Income')
                  ],
                ),
                const SizedBox(width: 12),
                _buildInputAmount(),
              ],
            ),
            if (_isNoteInputVisibled) _buildNoteInput(),
            const SizedBox(height: 12),
            TransactionFormToolBar(
              onSave: _handleOnSave,
              toggleNote: _toggleNote,
              isSaveBtnDisablled: _isSaveBtnDisablled,
              onSelectNewDate: (newDate) {
                if (newDate != null) {
                  _choosenDate = newDate;
                }
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
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

  Widget _buildInputAmount() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: TextField(
          autofocus: true,
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: Transaction.isExpanseType(_choosenTransactinType) ? 'Expanse' : 'Income',
          ),
        ),
      ),
    );
  }
}
