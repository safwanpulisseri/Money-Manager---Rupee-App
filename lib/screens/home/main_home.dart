import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rupee_app/screens/add_category/main_adding.dart';
import 'package:rupee_app/screens/home/account/account.dart';
import 'package:rupee_app/screens/home/see_all.dart';

class ScreenMainHome extends StatefulWidget {
  const ScreenMainHome({Key? key}) : super(key: key);

  @override
  State<ScreenMainHome> createState() => _ScreenMainHomeState();
}

class _ScreenMainHomeState extends State<ScreenMainHome> {
  int _currentIndex = 0;
  late PageController _pageController;
  late MyDataClass _value; // Assume _value is an instance of some class

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // _value = MyDataClass(id: 'some_id');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: screen_home(context),
            ), // SCREEN ONE
            screen_statistics(), // SCREEN TWO
          ],
        ),
      ),
      // BOTTOM
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenMainAdding(),
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

  Container screen_statistics() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Statistics',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                4,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        index_color = index;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index_color == index
                            ? Colors.orange.withAlpha(500)
                            : Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        day[index],
                        style: TextStyle(
                          color: index_color == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            width: 300,
            child: PieChart(
              swapAnimationDuration: Duration(
                milliseconds: 750, // PIECHART TIME
              ),
              PieChartData(
                sections: [
                  PieChartSectionData(value: 50, color: Colors.red),
                  PieChartSectionData(
                    value: 50,
                    color: Colors.green,
                  ),
                ],
                sectionsSpace: 2,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Transactions',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.swap_vert,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
          // List of Top Transactions
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return list_of_categories(
                    Key('transaction_$index'), index); //ListTile(
                //   leading: CircleAvatar(
                //     backgroundColor: Colors.transparent,
                //     backgroundImage: AssetImage(categoryImages[index]),
                //   ),
                //   title: Text(
                //     'Transaction $index',
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                //   subtitle: Text('Oct 22, 2021'),
                //   trailing: Text(
                //     '+10.000',
                //     style: TextStyle(
                //       color: Colors.green,
                //       fontSize: 20,
                //     ),
                //   ),
                //   onTap: () {
                //     // Action to perform when the item is tapped
                //   },
                // );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container screen_home(BuildContext context) {
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
                              'Hi, Safwan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '₹0.0',
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
                                    'assets/IMG_3864.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 5,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(5, 5),
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
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final transactionKey = Key('transaction_$index');
                      return list_of_categories(transactionKey, index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Slidable list_of_categories(Key transactionKey, int index) {
    return Slidable(
      key: transactionKey,
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            onPressed: (ctx) {},
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          backgroundColor: Colors.blue,
          onPressed: (ctx) {},
          icon: Icons.edit,
          label: 'Edit',
        )
      ]),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(categoryImages[index]),
        ),
        title: Text(
          'Transaction $index',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        subtitle: Text('Oct 22, 2021'),
        trailing: Text(
          '+10.000',
          style: TextStyle(color: Colors.green, fontSize: 20),
        ),
        onTap: () {
          // Action to perform when the item is tapped
        },
      ),
    );
  }

  List<String> categoryImages = [
    'assets/Screenshot_2023-11-19_at_4.01.38_PM-removebg-preview.png',
    'assets/Screenshot_2023-11-19_at_4.01.58_PM-removebg-preview.png',
    'assets/Screenshot_2023-11-19_at_4.02.04_PM-removebg-preview.png',
    'assets/Screenshot_2023-11-19_at_4.02.09_PM-removebg-preview.png',
  ];
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
