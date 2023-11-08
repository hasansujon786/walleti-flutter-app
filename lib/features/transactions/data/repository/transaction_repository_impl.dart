import '../../../../shared/data/local/database.dart';
import '../../domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<List<TransactionData>> getAllTransactions() async {
    final database = AppDatabase();

    final allItems = await database.select(database.transactionEntries).get();
    database.close();
    return allItems;
  }

  @override
  Future<int> createTransaction(TransactionData newTransaction) async {
    // final database = AppDatabase();

    // final id = await database.into(database.transactionEntries).insert(TransactionEntriesCompanion.insert(
    //       amount: 23.0,
    //       type: TransactionType.income,
    //       createdAt: DateTime.now(),
    //       note: Value(newTransaction.note),
    //       category: Value(newTransaction.category),
    //     ));
    // database.close();

    return 0;
  }

  @override
  Future<TransactionData> getTransaction(int id) async {
    final database = AppDatabase();

    final found = await (database.select(database.transactionEntries)..where((tbl) => tbl.id.equals(id))).getSingle();
    database.close();
    return found;
  }
}
