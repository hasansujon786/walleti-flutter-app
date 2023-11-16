import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../configs/injections.dart';
import '../../../../shared/data/local/database.dart';
import '../../domain/repository/transaction_repository.dart';

part 'transaction_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionList extends _$TransactionList {
  final _repositoy = getIt<TransactionRepository>();

  @override
  Future<List<TransactionData>> build() async {
    return _repositoy.getAllTransactions();
  }

  Future<void> addTransaction(TransactionData transactionInput) async {
    final newTrnx = await _repositoy.createTransaction(transactionInput);

    final previousState = await future;
    state = AsyncData([...previousState, newTrnx]);
  }

  Future<void> deleteTransaction(TransactionData transaction) async {
    await _repositoy.deleteTransaction(transaction);

    final previousState = await future;
    final filterItems = previousState.where((element) => element.id != transaction.id).toList();
    state = AsyncData(filterItems);
  }

  Future<void> updateTransaction(TransactionData updatedTransaction) async {
    await _repositoy.updateTransaction(updatedTransaction);

    final previousState = await future;
    final filterItems = previousState.map((element) {
      return element.id == updatedTransaction.id ? updatedTransaction : element;
    }).toList();

    state = AsyncData(filterItems);
  }
}

// @Riverpod(keepAlive: true)
// Stream<List<TransactionData>> allTransactionsStream(AllTransactionsStreamRef ref) {
//   final db = ref.watch(appDatabaseProvider);
//   return db.select(db.transactionEntries).watch();
// }
