// models/transaction.dart
import 'package:hive/hive.dart';
import 'package:rupee_app/models/category.dart';
part 'transaction.g.dart';

@HiveType(typeId: 1)
class TransactionModel {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final CategoryModel category;

  TransactionModel({
    required this.amount,
    required this.description,
    required this.date,
    required this.category,
  });
}
