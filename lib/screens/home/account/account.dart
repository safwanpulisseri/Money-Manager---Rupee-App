import 'package:flutter/material.dart';
import 'package:rupee_app/controller/db_functions.dart';
import 'package:rupee_app/screens/home/account/about_us.dart';
import 'package:rupee_app/screens/home/account/credit_card.dart';
import 'package:rupee_app/screens/home/account/how_to_use.dart';
import 'package:rupee_app/screens/home/account/privacy_policy.dart';
import 'package:rupee_app/screens/home/account/profile.dart';
import 'package:rupee_app/screens/home/main_home.dart';
import 'package:rupee_app/screens/introduction/intro.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.orange])),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenMainHome()));
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              Text(
                                'Back',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/IMG_3864.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(width: 3, color: Colors.black),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 2), color: Colors.grey)
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'Safwan Pulisseri',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenEditProfile()));
                          },
                          child: Row(
                            children: [
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                height: 250,
              ),
              Container(
                height: 640,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => ScreenCreditCard()));
                    //   },
                    //   child: Container(
                    //     width: 300,
                    //     height: 60,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Colors.transparent,
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Container(
                    //           child: Icon(
                    //             Icons.credit_card,
                    //             size: 30,
                    //             color: Colors.white,
                    //           ),
                    //           height: 45,
                    //           width: 55,
                    //           decoration: BoxDecoration(
                    //               gradient: LinearGradient(
                    //                   colors: [Colors.red, Colors.orange]),
                    //               borderRadius: BorderRadius.circular(10)),
                    //         ),
                    //         SizedBox(
                    //           width: 20,
                    //         ),
                    //         Text(
                    //           'Cards',
                    //           style: TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 25,
                    //               fontWeight: FontWeight.w400),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.white,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10)),
                    //       minimumSize: Size(330, 60),
                    //       side: BorderSide(color: Colors.black, width: 2)),
                    // ),//
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.share,
                                size: 30,
                                color: Colors.white,
                              ),
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.red, Colors.orange]),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Share app',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(330, 60),
                          side: BorderSide(color: Colors.black, width: 2)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenHowToUse()));
                      },
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.question_mark,
                                size: 30,
                                color: Colors.white,
                              ),
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.red, Colors.orange]),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'How to use',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(330, 60),
                          side: BorderSide(color: Colors.black, width: 2)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenPrivacyPolicy()));
                      },
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.privacy_tip_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.red, Colors.orange]),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(330, 60),
                          side: BorderSide(color: Colors.black, width: 2)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenAboutUs()));
                      },
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset('assets/Login_logo.png'),
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.red, Colors.orange]),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'About us',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(330, 60),
                          side: BorderSide(color: Colors.black, width: 2)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        logout();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenIntro()));
                      },
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.delete_forever,
                                size: 30,
                                color: Colors.white,
                              ),
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.red, Colors.orange]),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Clear All',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(330, 60),
                          side: BorderSide(color: Colors.black, width: 2)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {
    transactionListNotifier.value.clear();
    transactionListNotifier.notifyListeners();
  }
}
