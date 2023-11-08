import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_login_page/home/mental_home.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    return AnimatedSplashScreen(
      splash: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            child: Lottie.asset('assets/images/cloud_sun.json'),
          ),
          Positioned(
            bottom: 20,
            child: const Text(
              'YOU ARE LOVED',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: DarkBlue,
      nextScreen: WallpaperPage(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }



}