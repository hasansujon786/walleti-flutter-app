import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction.dart';
import '../providers/template_provider.dart';
import 'transaction_category_list.dart';
import 'transaction_category_tile.dart';
import 'transaction_type_switch.dart';

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
  var _isSaveBtnDisablled = true;
  var _isNoteInputVisibled = false;
  var _isCategoryListVisibled = false;

  // transaction input value
  late TextEditingController _amountController;
  late TextEditingController _noteController;
  var _choosenTransactinType = TransactionType.expance;
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

  void _handleOnSave(BuildContext context, WidgetRef ref) {
    final tnx = Transaction(
      amount: double.tryParse(_amountController.text) ?? 0,
      type: _choosenTransactinType,
      category: _choosenCategory,
      note: _isNoteInputVisibled && _noteController.text.isNotEmpty ? _noteController.text : null,
    );
    ref.read(transactionsProvider.notifier).create(tnx);
    Navigator.pop(context);
  }

  void _handleOnCategorySelect(value) {
    setState(() {
      _choosenCategory = value;
      _isCategoryListVisibled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isCategoryListVisibled) {
      return TransactionCategoryList(onSelect: _handleOnCategorySelect);
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
                TransactionCategoryTile(
                  category: _choosenCategory ?? 'U',
                  onSelect: (_) {
                    setState(() => _isCategoryListVisibled = true);
                  },
                ),
                const SizedBox(width: 12),
                _buildInputAmount(),
              ],
            ),
            if (_isNoteInputVisibled) _buildNoteInput(),
            const SizedBox(height: 12),
            _buildToolBar(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Row _buildToolBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() => _isNoteInputVisibled = !_isNoteInputVisibled);
          },
          icon: const Icon(Icons.note_add_outlined),
        ),
        const SizedBox(width: 12),
        TransactionTypeSwitch(
          selectedType: _choosenTransactinType,
          onValueChange: (value) {
            setState(() => _choosenTransactinType = value);
          },
        ),
        const Spacer(),
        _buildSaveBtn(),
        // _buildCreateBtn(),
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

  Consumer _buildSaveBtn() {
    final theme = Theme.of(context);
    return Consumer(
      builder: (context, ref, child) {
        return TextButton(
          onPressed: _isSaveBtnDisablled ? null : () => _handleOnSave(context, ref),
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: 16,
              color: _isSaveBtnDisablled ? Colors.grey.shade500 : theme.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
