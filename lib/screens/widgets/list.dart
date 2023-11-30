// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:rupee_app/controller/db_functions.dart';

// class ScreenList extends StatelessWidget {
//   const ScreenList({Key? key, required this.index});

//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return listOfCategoriesWidget(context);
//   }

//   Widget listOfCategoriesWidget(BuildContext context) {
//     return Slidable(
//       key: Key('transaction_$index'), // Assuming index is available
//       startActionPane: ActionPane(
//         motion: ScrollMotion(),
//         children: [
//           SlidableAction(
//             backgroundColor: Colors.red,
//             onPressed: (ctx) {},
//             icon: Icons.delete,
//             label: 'Delete',
//           ),
//         ],
//       ),
//       endActionPane: ActionPane(motion: ScrollMotion(), children: [
//         SlidableAction(
//           backgroundColor: Colors.blue,
//           onPressed: (ctx) {},
//           icon: Icons.edit,
//           label: 'Edit',
//         )
//       ]),
//       child: ListOfCategoriesItem(
//         transactionKey:
//             Key('transaction_$index'), // Assuming index is available
//         index: index,
//       ),
//     );
//   }
// }

// class ListOfCategoriesItem extends StatelessWidget {
//   final Key transactionKey;
//   final int index;

//   const ListOfCategoriesItem({
//     Key? key,
//     required this.transactionKey,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: transactionListNotifier.value.length,
//         itemBuilder: (context, index) {
//           final transaction = transactionListNotifier.value[index];
//           return ListTile(
//             title: Text(transaction.category.name),
//             subtitle: Text(
//                 '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}'),
//             trailing: Text('${transaction.amount}'),
//             leading: CircleAvatar(
//               backgroundImage: AssetImage(transaction.category.imagePath),
//             ),
//           );
//         });
//   }
// }

// class CategoryImages {
//   static List<String> categoryImages = [
//     'assets/Income1.png',
//     'assets/Bills2.png',
//     'assets/Bills3.png',
//     'assets/Income4.png',
//   ];
// }
