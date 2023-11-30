import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rupee_app/models/category.dart';
import 'package:rupee_app/models/transaction.dart';
import 'package:rupee_app/screens/home/main_home.dart';
import 'package:rupee_app/screens/introduction/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
  //   Hive.registerAdapter(TransactionModelAdapter());
  // }
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId) &&
      !Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
    Hive.registerAdapter(
        CategoryModelAdapter()); // Register the adapter for CategoryModel
  }

  await Hive.openBox<TransactionModel>('transaction_db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenMainHome(),
    );
  }
}
