import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_login_page/home/mental_journal.dart';
import 'package:page_transition/page_transition.dart';

import 'mental_choose.dart';

class JournalSplashScreen extends StatelessWidget{
  const JournalSplashScreen({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        alignment: Alignment.center,
        children: [
          Lottie.asset('assets/images/writing.json'),
        ],
      ),
      backgroundColor: Colors.white,
      nextScreen: JournalPage(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }



}