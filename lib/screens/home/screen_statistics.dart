import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:rupee_app/controller/db_functions.dart';
import 'package:rupee_app/models/category.dart';
import 'package:rupee_app/models/transaction.dart';
import 'package:rupee_app/screens/home/screen_home.dart';
import 'package:rupee_app/screens/widgets/list.dart';

class ScreenStatistics extends StatefulWidget {
  const ScreenStatistics({super.key});

  @override
  State<ScreenStatistics> createState() => _ScreenStatisticsState();
}

class _ScreenStatisticsState extends State<ScreenStatistics> {
  @override
  Widget build(BuildContext context) {
    return screenStatisticsWidget(context);
  }

  Container screenStatisticsWidget(BuildContext context) {
    return Container(
      color: Colors.white,
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
                        indexColor = index;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: indexColor == index
                            ? Colors.orange.withAlpha(500)
                            : Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        day[index],
                        style: TextStyle(
                          color:
                              indexColor == index ? Colors.white : Colors.black,
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
                itemCount: transactionListNotifier.value.length,
                itemBuilder: (context, index) {
                  final TransactionModel transaction =
                      transactionListNotifier.value[index];
                  final CategoryModel category = transaction.category;
                  final DateTime date = transaction.date;

                  return ListTile(
                    title: Text(
                      category.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('${date.day}/${date.month}/${date.year}'),
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
                }),
          )
        ],
      ),
    );
  }

  List day = [
    'Day',
    'Week',
    'Month',
    'Year',
  ];
  //
  int indexColor = 0;
}
