import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction.dart';
import '../providers/template_provider.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  late TextEditingController _amountController;
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter transaction amount',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter transaction title',
            ),
          ),
          const SizedBox(height: 16),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                onPressed: () async {
                  final tnx = Transaction(
                    title: _titleController.text,
                    amount: double.tryParse(_amountController.text) ?? 0,
                    type: TransactionType.income,
                  );
                  ref.read(transactionsProvider.notifier).create(tnx);
                  Navigator.pop(context);
                },
                child: const Text('create'),
              );
            },
          )
        ],
      ),
    );
  }
}
