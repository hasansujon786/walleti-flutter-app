import '../../../../shared/data/local/database.dart';
import '../../domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<int> createTransaction(TransactionData newTransaction) {
    // TODO: implement createTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionData>> getAllTransactions() {
    // TODO: implement getAllTransactions
    throw UnimplementedError();
  }

  @override
  Future<TransactionData> getTransaction(int id) {
    // TODO: implement getTransaction
    throw UnimplementedError();
  }
}
