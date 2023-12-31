// Import necessary libraries
import 'package:flutter/material.dart';
import 'package:rupee_app/controller/db_functions.dart';
import 'package:rupee_app/controller/db_user.dart';
import 'package:rupee_app/models/category.dart';
import 'package:rupee_app/models/transaction.dart';
import 'package:rupee_app/screens/home/account/account.dart';
import 'package:rupee_app/screens/home/see_all.dart';
import 'package:rupee_app/screens/introduction/signup.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late String _userName = '';
  late String _userPhoto = '';

  // Future<void> _getUserInfoFromDatabase() async {
  //   try {
  //     // Fetch user information from the database
  //     Map<String, dynamic> userInfo =
  //         await DbFunctions.getUserInfoFromDatabase();

  //     setState(() {
  //       _userName = userInfo['name'] ?? '';
  //       _userPhoto = userInfo['photo'] ?? '';
  //     });
  //   } catch (e) {
  //     print('Error fetching user information: $e');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getAllTransactions(); // Fetch transactions when the screen initializes
    // _getUserInfoFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return screenHomeWidget(context);
  }

  Container screenHomeWidget(BuildContext context) {
    return Container(
      // SCREEN ONE
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 230,
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hi, $_userName', //User's name
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '₹', //RUPEE SYMPOL
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '0.0',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'your balance',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 75, //
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenAccount(),
                                  ),
                                );
                              },
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    userPic!, //User's Photo
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ), // CenterWhitecontainer
          Container(
            height: 600,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 120,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Income'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'RS: 15.000',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 120,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Expenditure'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'RS: 15.000',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Recent Transaction',
                      style: TextStyle(fontSize: 22),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(color: Colors.black),
                            minimumSize: Size(0, 30),
                            backgroundColor: Colors.grey[200],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ScreenSeeAllTransaction()));
                          },
                          child: Text(
                            'See all',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                // List of Recent Transactions
                Expanded(
                  child: ListView.builder(
                    itemCount: transactionListNotifier.value.length,
                    itemBuilder: (context, index) {
                      final TransactionModel transaction =
                          transactionListNotifier.value[index];
                      final CategoryModel category = transaction.category;
                      final DateTime date = transaction.date;

                      return ListTile(
                        title: Text(
                          category.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        subtitle:
                            Text('${date.day}/${date.month}/${date.year}'),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          child: ClipOval(
                            child: Image.asset(
                              category.imagePath,
                              // height: 100,
                              // width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        trailing: Text(
                          '${transaction.amount}',
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
