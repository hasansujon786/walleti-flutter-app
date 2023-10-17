import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction.dart';

final transactionsProvider = StateNotifierProvider<TransactionsStateNotifier, List<Transaction>>((ref) {
  final  items = <Transaction>[];
  return TransactionsStateNotifier(items);
});

class TransactionsStateNotifier extends StateNotifier<List<Transaction>> {
  TransactionsStateNotifier(initialState) : super(initialState);

  void create(Transaction newTrnx) {
    state = [newTrnx, ...state];
  }
}
