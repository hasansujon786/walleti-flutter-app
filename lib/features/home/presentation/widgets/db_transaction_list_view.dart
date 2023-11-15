import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../transactions/presentation/providers/transaction_provider.dart';
import '../../../transactions/presentation/widgets/transaction_list_item.dart';

class DbTransactionListView extends ConsumerWidget {
  final bool isTransactionsView;
  const DbTransactionListView({Key? key, this.isTransactionsView = true}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // return const SliverToBoxAdapter(child: Center(child: Text('no item')));
    // final transactionState = ref.watch(allTransactionsStreamProvider);
    final transactionState = ref.watch(transactionListProvider);

    return transactionState.when(
      data: (data) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => TransactionListItem(
              data[index],
              onTap: () {
                ref.read(transactionListProvider.notifier).deleteTransaction(data[index]);
                // ref.read(transactionListProvider.notifier).updateTransaction(data[index].copyWith(amount: 100));
              },
            ),
            childCount: data.length,
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(child: Center(child: Text('loading'))),
      error: (error, stackTrace) => const SliverToBoxAdapter(child: Center(child: Text('error'))),
      // skipLoadingOnReload: true,
      // skipLoadingOnRefresh: true,
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
