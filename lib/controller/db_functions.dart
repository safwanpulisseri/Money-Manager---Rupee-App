// db_functions.dart
//Transaction's CRUD operation
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rupee_app/models/transaction.dart';

ValueNotifier<List<TransactionModel>> transactionListNotifier =
    ValueNotifier([]);

addTransaction(TransactionModel value) async {
  final transactionDB = await Hive.openBox<TransactionModel>('transaction_db');
  await transactionDB.add(value);
  transactionListNotifier.value.add(value);
  print('DATA ADDED');
  transactionListNotifier.notifyListeners();
}

Future<void> getAllTransactions() async {
  final transactionDB = await Hive.openBox<TransactionModel>('transaction_db');
  transactionListNotifier.value.clear();
  transactionListNotifier.value.addAll(transactionDB.values);
  transactionListNotifier.notifyListeners();
}
