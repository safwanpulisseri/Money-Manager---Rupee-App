import 'package:flutter/material.dart';
import 'package:rupee_app/screens/introduction/login.dart';
import 'package:rupee_app/screens/introduction/signup.dart';
//import 'package:flutter_application_3/screens/Indroduction/Login.dart';

class ScreenIntro extends StatelessWidget {
  const ScreenIntro({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Image.asset(
                      'assets/intrologo-removebg-preview-2.png',
                      height: 350,
                      width: 350,
                    ),
                  ],
                ),
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red,
                      Colors.orange
                    ], // Use parentheses instead of square brackets
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 50),
                    bottomRight: Radius.elliptical(30, 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Let's",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'manage',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(children: [
                          Text(
                            'money ',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.red),
                          ),
                        ]),
                        Text(
                          'with us',
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenSignup(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 245, 91, 1),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    // Adding slope to the left side
    path.lineTo(0, h - 30); // Move slightly up
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
