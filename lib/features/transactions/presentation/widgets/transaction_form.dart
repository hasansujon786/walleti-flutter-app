import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction.dart';
import '../providers/template_provider.dart';

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
  var _isButtonDisablled = true;
  late TextEditingController _amountController;
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _titleController = TextEditingController();

    // disabllel btn if feild is empty
    _amountController.addListener(() {
      if (_isButtonDisablled && _amountController.text.isNotEmpty) {
        setState(() {
          _isButtonDisablled = false;
        });
      } else if (!_isButtonDisablled && _amountController.text.isEmpty) {
        setState(() {
          _isButtonDisablled = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _handleOnCreate(BuildContext context, WidgetRef ref) {
    final tnx = Transaction(
      title: _titleController.text,
      amount: double.tryParse(_amountController.text) ?? 0,
      type: TransactionType.income,
    );
    ref.read(transactionsProvider.notifier).create(tnx);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 20, 16, MediaQuery.of(context).viewInsets.bottom), // content padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _createInputAmount(),
            const SizedBox(height: 16),
            _createInputTitle(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.note_add_outlined),
                const Spacer(),
                _buildCreateBtn(),
                // _buildCreateBtn(),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  TextField _createInputTitle() {
    return TextField(
      controller: _titleController,
      decoration: const InputDecoration(
        // border: OutlineInputBorder(),
        labelText: 'Transaction title',
      ),
    );
  }

  TextField _createInputAmount() {
    return TextField(
      autofocus: true,
      controller: _amountController,
      decoration: const InputDecoration(
        // border: OutlineInputBorder(),
        labelText: 'Transaction amount',
      ),
    );
  }

  Consumer _buildCreateBtn() {
    final theme = Theme.of(context);
    return Consumer(
      builder: (context, ref, child) {
        return TextButton(
          onPressed: _isButtonDisablled ? null : () => _handleOnCreate(context, ref),
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: 16,
              color: _isButtonDisablled ? Colors.grey.shade500 : theme.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
