import 'package:flutter/material.dart';
import 'package:app_login_page/screens/signin_screen.dart';
import 'package:path/path.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 275,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/Image/bbb1.png',
                      width: 225,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInScreen()),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
