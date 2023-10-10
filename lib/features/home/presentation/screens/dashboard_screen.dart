import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../transactions/presentation/providers/template_provider.dart';
import '../../../transactions/presentation/widgets/transaction_list_item.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final tnxs = ref.watch(transactionsProvider);
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      itemBuilder: (context, index) {
        return TransactionListItem(tnxs[index]);
      },
      separatorBuilder: (context, i) => const SizedBox(height: 8),
      itemCount: tnxs.length,
    );
  }
}
