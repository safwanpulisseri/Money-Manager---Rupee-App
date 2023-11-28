import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({Key? key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return listOfCategoriesWidget(context);
  }

  Widget listOfCategoriesWidget(BuildContext context) {
    return Slidable(
      key: Key('transaction_$index'), // Assuming index is available
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
      child: ListOfCategoriesItem(
        transactionKey:
            Key('transaction_$index'), // Assuming index is available
        index: index,
      ),
    );
  }
}

class ListOfCategoriesItem extends StatelessWidget {
  final Key transactionKey;
  final int index;

  const ListOfCategoriesItem({
    Key? key,
    required this.transactionKey,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(CategoryImages.categoryImages[index]),
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
    );
  }
}

class CategoryImages {
  static List<String> categoryImages = [
    'assets/Income1.png',
    'assets/Bills2.png',
    'assets/Bills3.png',
    'assets/Income4.png',
  ];
}
