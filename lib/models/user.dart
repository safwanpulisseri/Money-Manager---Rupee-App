// models/user.dart
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class UserModel {
  @HiveField(0)
  final Uint8List image;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String country;

  UserModel({
    required this.image,
    required this.name,
    required this.country,
  });
}
