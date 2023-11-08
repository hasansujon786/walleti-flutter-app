import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/local/database.dart';

final transactionsProvider = StateNotifierProvider<TransactionsStateNotifier, List<TransactionData>>((ref) {
  final items = <TransactionData>[];
  final db = ref.read(AppDatabase.provider);
  return TransactionsStateNotifier(items, db);
});

class TransactionsStateNotifier extends StateNotifier<List<TransactionData>> {
  final AppDatabase db;
  TransactionsStateNotifier(initialState, this.db) : super(initialState);

  Future<void> create(TransactionData newTrnx) async {
    final id = await db.into(db.transactionEntries).insert(
          TransactionEntriesCompanion.insert(
            amount: newTrnx.amount,
            type: newTrnx.type,
            createdAt: newTrnx.createdAt,
            note: Value(newTrnx.note),
            category: Value(newTrnx.category),
          ),
        );

    newTrnx = newTrnx.copyWith(id: id);
    state = [newTrnx, ...state];
  }
}

final StreamProvider<List<TransactionData>> allTransactions = StreamProvider((ref) {
  final database = ref.watch(AppDatabase.provider);
  return database.select(database.transactionEntries).watch();
});
