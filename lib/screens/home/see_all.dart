import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rupee_app/screens/home/main_home.dart';

class ScreenSeeAllTransaction extends StatefulWidget {
  const ScreenSeeAllTransaction({super.key});

  @override
  State<ScreenSeeAllTransaction> createState() =>
      _ScreenSeeAllTransactionState();
}

class _ScreenSeeAllTransactionState extends State<ScreenSeeAllTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenMainHome()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text(
                          'Transaction History',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                  height: 740,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            cursorHeight: 38,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search',
                                //icon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Radio(
                                    value: 'All',
                                    groupValue: SelectAction,
                                    onChanged: (value) {}),
                              ),
                              Text(
                                'All',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Radio(
                                    value: 'AllIncome',
                                    groupValue: SelectAction,
                                    onChanged: (value) {}),
                              ),
                              Text(
                                'Income',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Radio(
                                    value: 'AllExpense',
                                    groupValue: SelectAction,
                                    onChanged: (value) {}),
                              ),
                              Text(
                                'Expense',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      ),
                      Flexible(
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
              )
            ],
          ),
        ),
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
          backgroundImage: AssetImage(incomeImages[index]),
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

  List<String> incomeImages = [
    'assets/Income1.png',
    'assets/Income2.png',
    'assets/Icome3.png',
    'assets/Income4.png',
  ];
}
