// models/transaction.dart
import 'package:rupee_app/models/category.dart';

class TransactionModel {
  final double amount;
  final String description;
  final DateTime date;
  final CategoryModel category;

  TransactionModel({
    required this.amount,
    required this.description,
    required this.date,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'description': description,
      'date': date,
      'category':
          category.toMap(), // Assuming CategoryModel has a toMap() method
    };
  }
}
