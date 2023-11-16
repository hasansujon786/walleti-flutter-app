import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/data/local/database.dart';
import '../../domain/repository/transaction_repository.dart';

@Injectable(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final AppDatabase _db;
  const TransactionRepositoryImpl(this._db);

  @override
  Future<TransactionData> createTransaction(TransactionData newTransaction) async {
    final id = await _db.into(_db.transactionEntries).insert(
          TransactionEntriesCompanion.insert(
            amount: newTransaction.amount,
            type: newTransaction.type,
            createdAt: newTransaction.createdAt,
            note: Value(newTransaction.note),
            category: Value(newTransaction.category),
          ),
        );

    return newTransaction.copyWith(id: id);
  }

  @override
  Future<List<TransactionData>> getAllTransactions() {
    return _db.select(_db.transactionEntries).get();
  }

  @override
  Future<TransactionData> getTransaction(int id) {
    // TODO: implement getTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTransaction(TransactionData transaction) async {
    await (_db.delete(_db.transactionEntries)..where((t) => t.id.equals(transaction.id))).go();
  }

  @override
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
  }
}
