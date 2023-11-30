import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rupee_app/screens/add_category/main_adding.dart';
//import 'package:rupee_app/screens/home/account/account.dart';
//import 'package:rupee_app/screens/home/see_all.dart';
import 'package:rupee_app/screens/home/screen_home.dart';
import 'package:rupee_app/screens/home/screen_statistics.dart';
import 'package:rupee_app/controller/db_functions.dart';
import 'package:rupee_app/models/transaction.dart';

class ScreenMainHome extends StatefulWidget {
  const ScreenMainHome({Key? key}) : super(key: key);

  @override
  State<ScreenMainHome> createState() => _ScreenMainHomeState();
}

class _ScreenMainHomeState extends State<ScreenMainHome> {
  late List<TransactionModel> transactions;
  int _currentIndex = 0;
  late PageController _pageController;
  late MyDataClass _value; // Assume _value is an instance of some class

  // Future<void> _loadTransactions() async {
  //   transactions = await DbFunctions.getTransactions();
  //   setState(() {});
  // }

  void _onTransactionAdded() {
    // Callback function to reload transactions when a new one is added
    // _loadTransactions();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _value = MyDataClass(id: 'some_id');
    // _loadTransactions(); // Call _loadTransactions here if you want to load transactions when the screen initializes
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getAllTransactions();
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            SingleChildScrollView(
              child: ScreenHome(),
            ), // SCREEN ONE
            ScreenStatistics(), // SCREEN TWO
          ],
        ),
      ),
      // BOTTOM
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenMainAdding(
                onTransactionAdded: _onTransactionAdded,
              ),
            ),
          );
        },
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Icon(Icons.add),
          padding: EdgeInsets.all(16.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        child: CurvedNavigationBar(
          onTap: (index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          },
          backgroundColor: Colors.white,
          animationDuration: Duration(milliseconds: 300),
          color: Colors.orange.withAlpha(500),
          items: [
            Icon(
              Icons.home,
            ),
            Icon(
              Icons.bar_chart_rounded,
            ),
          ],
        ),
      ),
    );
  }

  List day = [
    'Day',
    'Week',
    'Month',
    'Year',
  ]; //
  int index_color = 0;
}

class MyDataClass {
  final String id;
  MyDataClass({required this.id});
}
