import 'package:flutter/material.dart';
import 'package:rupee_app/screens/home/main_home.dart';
import 'package:rupee_app/screens/introduction/signup.dart';
// import 'package:flutter_application_3/screens/Indroduction/signup.dart';
// import 'package:flutter_application_3/screens/Indroduction/splash.dart';
// import 'package:flutter_application_3/screens/home/mainhome.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.red, Colors.orange],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Align children in the center
                children: [
                  Image.asset(
                    'assets/Login_logo.png',
                    height: 200,
                    width: 200,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Align text in the center
                    children: [
                      Text(
                        'Please login to continue and get the ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Align text in the center
                    children: [
                      Text(
                        'best from our app',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                  height: 540,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: TextField(
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
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(fontSize: 20),
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
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenMainHome()));
                        },
                        child: Text(
                          'Log in',
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont’t have account?',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScreenSignup()));
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                ' here!',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      )
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
}
