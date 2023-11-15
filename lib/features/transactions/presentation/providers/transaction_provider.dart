import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/data/local/database.dart';

part 'transaction_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionList extends _$TransactionList {
  late final AppDatabase _db = ref.read(appDatabaseProvider);

  @override
  Future<List<TransactionData>> build() async {
    return _db.select(_db.transactionEntries).get();
  }

  Future<void> addTransaction(TransactionData transactionInput) async {
    final id = await _db.into(_db.transactionEntries).insert(
          TransactionEntriesCompanion.insert(
            amount: transactionInput.amount,
            type: transactionInput.type,
            createdAt: transactionInput.createdAt,
            note: Value(transactionInput.note),
            category: Value(transactionInput.category),
          ),
        );

    final newTrnx = transactionInput.copyWith(id: id);

    final previousState = await future;
    state = AsyncData([...previousState, newTrnx]);
  }

  Future<void> deleteTransaction(TransactionData transaction) async {
    await (_db.delete(_db.transactionEntries)..where((t) => t.id.equals(transaction.id))).go();

    final previousState = await future;
    final filterItems = previousState.where((element) => element.id != transaction.id).toList();
    state = AsyncData(filterItems);
  }

  Future<void> updateTransaction(TransactionData updatedTransaction) async {
    await (_db.update(_db.transactionEntries)..where((t) => t.id.equals(updatedTransaction.id))).write(
      TransactionEntriesCompanion(
        amount: Value(updatedTransaction.amount),
        type: Value(updatedTransaction.type),
        createdAt: Value(updatedTransaction.createdAt),
        note: Value(updatedTransaction.note),
        category: Value(updatedTransaction.category),
      ),
    );

    final previousState = await future;
    final filterItems = previousState.map((element) {
      return element.id == updatedTransaction.id ? updatedTransaction : element;
    }).toList();

    state = AsyncData(filterItems);
  }
}

@Riverpod(keepAlive: true)
Stream<List<TransactionData>> allTransactionsStream(AllTransactionsStreamRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.select(db.transactionEntries).watch();
}
