import '../../../../shared/data/local/database.dart';

abstract class TransactionRepository {
  Future<TransactionData> createTransaction(TransactionData newTransaction);

  Future<void> deleteTransaction(TransactionData transaction);

  Future<List<TransactionData>> getAllTransactions();

  Future<TransactionData> getTransaction(int id);

  Future<void> updateTransaction(TransactionData updatedTransaction);
}
