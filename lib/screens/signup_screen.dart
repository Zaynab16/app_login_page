import 'package:app_login_page/reusable_widgets/reusable_widget.dart';
import 'package:app_login_page/Menuuuu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import 'log_out_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xfff8f2f2),

      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20,MediaQuery.of(context).size.height*0.2, 20, 0),
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/Image/blissfit.png"),
                    const SizedBox(
                      height: 70,
                    ),
                    reusableTextField("Enter UserName", Icons.person_outline, false,
                        _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Email address", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),



                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    signInSignUpButton(context, false, () {
                      //firebaseUIButton(context, "Sign Up", () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => menuuuu()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });

                    })
                  ],
                ),
              ))),
    );
  }
}

