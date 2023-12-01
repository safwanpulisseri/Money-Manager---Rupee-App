import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rupee_app/screens/home/main_home.dart';
import 'package:rupee_app/screens/introduction/login.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({super.key});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                                builder: (context) => ScreenLogin()));
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
                    topRight: Radius.circular(30)),
                child: Container(
                  color: Colors.white,
                  height: 780,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                content: Text(
                                  'Choose Image from  ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            fromGallery();
                                            Navigator.of(context).pop();
                                          },
                                          icon: Icon(Icons.image,
                                              color: Colors.orange
                                                  .withAlpha(500))),
                                      IconButton(
                                          onPressed: () {
                                            fromCamera();
                                            Navigator.of(context).pop();
                                          },
                                          icon: Icon(Icons.camera_alt,
                                              color:
                                                  Colors.orange.withAlpha(500)))
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            // CircleAvatar(
                            //     radius: 80,
                            //     backgroundImage:
                            //         AssetImage('assets/IMG_3864.jpg')),
                            Container(
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
                            style:
                                TextStyle(fontSize: 20), // Adjust the text size
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
                            style:
                                TextStyle(fontSize: 20), // Adjust the text size
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
                          child: CountryCodePicker(
                            onChanged: (CountryCode countryCode) {
                              print("New Country selected: " +
                                  countryCode.toString());
                            },
                            initialSelection:
                                'IN', // Initial selected country code
                            favorite: [
                              '+91',
                              'US'
                            ], // Optional. To show only specific countries
                            showCountryOnly:
                                true, // Set to true to only show country names without flags
                            showFlagMain:
                                true, // Set to false to hide the main flag
                            showFlagDialog:
                                true, // Set to false to hide the flag dialog
                            builder: (CountryCode? countryCode) {
                              return Row(children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Image.asset(countryCode!.flagUri!,
                                    package: 'country_code_picker'),
                                SizedBox(width: 8.0),
                                Text(
                                  countryCode.name!,
                                  style: TextStyle(fontSize: 20),
                                )
                              ]);
                            },
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
                            controller: _passwordController,
                            style:
                                TextStyle(fontSize: 20), // Adjust the text size
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
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenMainHome()));
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 245, 91, 1),
                          minimumSize: Size(200, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
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

  Future<void> fromGallery() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<void> fromCamera() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.camera);
  }
}
