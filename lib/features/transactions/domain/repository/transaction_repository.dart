import '../../../../shared/data/local/database.dart';

abstract class TransactionRepository {
  Future<List<TransactionData>> getAllTransactions();
  Future<int> createTransaction(TransactionData newTransaction);
  Future<TransactionData> getTransaction(int id);
}
