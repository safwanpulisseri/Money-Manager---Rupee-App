// models/category.dart
import 'package:hive_flutter/hive_flutter.dart';
part 'category.g.dart';

@HiveType(typeId: 2)
class CategoryModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String imagePath;

  CategoryModel({
    required this.name,
    required this.imagePath,
  });
}
