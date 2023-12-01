import 'dart:io';
import 'dart:typed_data';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rupee_app/models/user.dart';
import 'package:rupee_app/screens/home/main_home.dart';
import 'package:rupee_app/screens/introduction/login.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  _ScreenSignupState createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedCountryCode = 'IN';
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
          ),
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenLogin(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                height: 110,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  color: Colors.white,
                  height: 780,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          _pickImage();
                        },
                        child: Column(
                          children: [
                            _selectedImage != null
                                ? Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(
                                        _selectedImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: 100,
                                    width: 100,
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
                                  )
                                : Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/profile.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: 100,
                                    width: 100,
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
                            Text('Add your photo'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: TextField(
                            controller: _nameController,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: TextField(
                            controller: _emailController,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              hintText: 'Enter your Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 2,
                            ),
                          ),
                          child: _buildCountryCodePicker(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            style: TextStyle(fontSize: 20),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await _onSignupButtonClicked(context);
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 245, 91, 1),
                          minimumSize: Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountryCodePicker() {
    return CountryCodePicker(
      onChanged: (CountryCode countryCode) {
        setState(() {
          _selectedCountryCode = countryCode.code!;
        });
      },
      initialSelection: _selectedCountryCode,
      favorite: ['+91', 'US'],
      showCountryOnly: true,
      showFlagMain: true,
      showFlagDialog: true,
      builder: (CountryCode? countryCode) {
        return Row(
          children: [
            SizedBox(width: 15),
            Image.asset(
              countryCode!.flagUri!,
              package: 'country_code_picker',
            ),
            SizedBox(width: 8.0),
            Text(
              countryCode.name!,
              style: TextStyle(fontSize: 20),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _onSignupButtonClicked(BuildContext context) async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (_selectedImage == null ||
        name.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      // Show an error message or handle the case where any field is empty
      return;
    }

    // Convert File to Uint8List
    final Uint8List imageData = await _selectedImage!.readAsBytes();

    // Save user data to Hive
    final UserModel user = UserModel(
      name: name,
      email: email,
      country: _selectedCountryCode,
      password: password,
      image: imageData,
    );

    final Box<UserModel> userBox = await Hive.openBox<UserModel>('users');
    await userBox.add(user);

    // Check if the user has been added to the database
    if (userBox.containsKey(userBox.keyAt(userBox.length - 1))) {
      // User added successfully
      print('User added to the database: $user');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text('User added successfully!'),
        duration: Duration(seconds: 2),
      ));

      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenMainHome(),
        ),
      );
    } else {
      // Failed to add user
      print('Failed to add user to the database');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to Add user. Please try again.'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
