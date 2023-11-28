// db_functions.dart
import 'package:hive/hive.dart';
import 'package:rupee_app/models/transaction.dart';

class DbFunctions {
  static Future<void> addTransaction(
      TransactionModel transaction, String s) async {
    final box = await Hive.openBox<TransactionModel>("transactions");
    box.add(transaction);
  }

  static Future<List<TransactionModel>> getTransactions() async {
    final database = await Hive.openBox<TransactionModel>("transactions");
    return database.values.toList();
  }
}
