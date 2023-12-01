// models/user.dart
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class UserModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String country;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final Uint8List image;

  UserModel(
      {required this.name,
      required this.email,
      required this.country,
      required this.password,
      required this.image});
}
