import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../transactions/presentation/providers/tnxs_provider.dart';
import '../../../transactions/presentation/widgets/transaction_list_item.dart';

class DbTransactionListView extends ConsumerWidget {
  final bool isTransactionsView;
  const DbTransactionListView({Key? key, this.isTransactionsView = true}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final transactionState = ref.watch(allTransactions);

    return transactionState.when(
      data: (data) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => TransactionListItem(data[index]),
            childCount: data.length,
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(child: Center(child: Text('loading'))),
      error: (error, stackTrace) => const SliverToBoxAdapter(child: Center(child: Text('error'))),
    );
  }

  SliverToBoxAdapter buildSliverBoxCenter(Widget child) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: Center(child: child),
      ),
    );
  }
}
