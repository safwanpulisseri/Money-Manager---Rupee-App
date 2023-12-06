// import 'dart:typed_data';

// import 'package:hive/hive.dart';

// import 'package:rupee_app/models/user.dart';

// class AuthService {
//   static final AuthService _instance = AuthService._internal();

//   factory AuthService() {
//     return _instance;
//   }

//   AuthService._internal();

//   Future<bool> login(String username, String password) async {
//     try {
//       final userBox = await Hive.openBox<UserModel>('users');
//       final users = userBox.values
//           .where((user) => user.name == username && user.password == password);

//       if (users.isNotEmpty) {
//         // Successful login
//         return true;
//       } else {
//         // Invalid credentials
//         return false;
//       }
//     } catch (e) {
//       print('Error during login: $e');
//       return false;
//     }
//   }

//   // Future<void> logout() async {
//   //   // Implement your logout logic here
//   //   // Example: Clear user data from storage
//   //   final userBox = await Hive.openBox<UserModel>('users');
//   //   userBox.clear();
//   // }

//   Future<bool> isAuthenticated() async {
//     // Implement your authentication check logic here
//     // Example: Check if the user data is present in storage
//     final userBox = await Hive.openBox<UserModel>('users');
//     return userBox.isNotEmpty;
//   }
// }

// class DbFunctions {
//   static Future<Map<String, dynamic>> getUserInfoFromDatabase() async {
//     try {
//       final userBox = await Hive.openBox<UserModel>('users');
//       final users = userBox.values;

//       if (users.isNotEmpty) {
//         // Assuming the first user is the logged-in user; modify this logic as needed
//         UserModel loggedInUser = users.first;

//         Map<String, dynamic> userInfo = {
//           'name': loggedInUser.name,
//           'photo': loggedInUser
//               .image, // Use the user's actual image data or path here
//         };
//         return userInfo;
//       } else {
//         // No user found
//         return {}; // or handle appropriately
//       }
//     } catch (e) {
//       print('Error fetching user information: $e');
//       return {}; // or handle appropriately
//     }
//   }
// }
