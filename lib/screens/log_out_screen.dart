import 'package:app_login_page/screens/signin_screen.dart';
import 'package:app_login_page/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({Key? key}) : super(key: key);

  @override
  _LogOutScreenState createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");


              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const Welcome()));
            });
          },
        ),
      ),




    );
  }
}
