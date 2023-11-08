import 'package:app_login_page/MedTscreens/home/home.dart';
import 'package:app_login_page/exercise_home_page.dart';
import 'package:app_login_page/screens/log_out_screen.dart';
import 'package:app_login_page/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'MedTmain.dart';
import 'SleepCalculator/lib/sleep_page.dart';
import 'habit_page.dart';
import 'home/contact.dart';
import 'home/mental_home.dart';
import 'home/mental_splashscreen.dart';
import 'home/mental_theme_notifier.dart';

class menuuuu extends StatefulWidget {
  const menuuuu({Key? key}) : super(key: key);

  @override
  _menuuuuState createState() => _menuuuuState();
}

TextEditingController textEditingController = TextEditingController();
FlutterTts flutterTts = FlutterTts();
void textToSpeech(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setVolume(5);
  await flutterTts.setSpeechRate(0.4);
  await flutterTts.setPitch(4);
  await flutterTts.speak(text);
}
class _menuuuuState extends State<menuuuu> {
  bool isSpread = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 80;
    final backgroundColor = Color(0xFFE7EFE4);
    final darkgreen = Color(0xFF1F3D1D);
    return Scaffold(

      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => WallpaperPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width * 0.45,
                                          height: screenHeight * 0.26,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                  'assets/images/mentalmental1.png')
                                                  .image,
                                            ),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF020A48),
                                                Color(0xFF020A48),

                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          alignment: Alignment.topRight,


                                          child: Container (
                                              height: 55,
                                              width: 50,
                                              decoration:  BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,),
                                              child:  InkWell(
                                                onTap: () {
                                                  textToSpeech('Mental Health');
                                                },

                                                child: Icon(
                                                    Icons.volume_up,
                                                    color: Colors.black
                                                ),
                                              )
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ExerciseHomePage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width * 0.45,
                                          height: screenHeight * 0.41,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: Image.asset(
                                                  'assets/images/exerciseexercise2.png')
                                                  .image,
                                            ),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFF5E33),
                                                Color(0xFFFF5E33)
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          alignment: Alignment.topRight,


                                          child: Container (
                                              height: 55,
                                              width: 50,
                                              decoration:  BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,),
                                              child:  InkWell(
                                                onTap: () {
                                                  textToSpeech('Exercise Routine');
                                                },

                                                child: Icon(
                                                    Icons.volume_up,
                                                    color: Colors.black
                                                ),
                                              )
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Column(
                                    children: [
                                      SizedBox(height:30),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MedicineApp(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width * 0.45,
                                          height: screenHeight * 0.41,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: Image.asset(
                                                  'assets/images/exerciseexercise1.png')
                                                  .image,
                                            ),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF004AAD),
                                                Color(0xFF004AAD)
                                              ],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          alignment: Alignment.topRight,


                                          child: Container (
                                              height: 55,
                                              width: 50,
                                              decoration:  BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,),
                                              child:  InkWell(
                                                onTap: () {
                                                  textToSpeech('Medication Tracker');
                                                },

                                                child: Icon(
                                                    Icons.volume_up,
                                                    color: Colors.black
                                                ),
                                              )
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => HabitPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width * 0.45,
                                          height: screenHeight * 0.26,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: Image.asset(
                                                  'assets/images/habithabit2.png')
                                                  .image,
                                            ),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF5F1BE8),
                                                Color(0xFF5F1BE8)
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          alignment: Alignment.topRight,


                                          child: Container (
                                              height: 55,
                                              width: 50,
                                              decoration:  BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,),
                                              child:  InkWell(
                                                onTap: () {
                                                  textToSpeech('Habit Tracker');
                                                },

                                                child: Icon(
                                                    Icons.volume_up,
                                                    color: Colors.black
                                                ),
                                              )
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SleepPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width ,
                            height: screenHeight * 0.26,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: Image.asset('assets/images/sleepsleep2.png').image,
                              ),
                              gradient: LinearGradient(
                                colors: [Color(0xFF16CD04), Color(0xFF16CD04)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.topRight,


                            child: Container (
                                height: 55,
                                width: 50,
                                decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white ,),
                                child:  InkWell(
                                  onTap: () {
                                    textToSpeech('Sleep Routine');
                                  },

                                  child: Icon(
                                      Icons.volume_up,
                                      color: Colors.black
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:25),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                setState(() {
                  isSpread = !isSpread;
                });
              },
              child: SizedBox(
                width: isSpread ? 150.0 : 56.0,
                height: 56.0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(isSpread ? 30.0 : 28.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      if (isSpread) ...[
                        Consumer<ThemeNotifier>(
                          builder: (context, themeNotifier, _) {
                            final _isDarkTheme =
                                themeNotifier.getTheme().brightness ==
                                    Brightness.dark;

                            void _toggleTheme(bool value) async {
                              await themeNotifier.setTheme(value);
                            }

                            return GestureDetector(
                              onTap: () {
                                _toggleTheme(
                                    !_isDarkTheme); // Toggle the theme when lightbulb is tapped
                              },
                              child: Icon(
                                Icons.lightbulb_outline_sharp,
                                color: _isDarkTheme
                                    ? Colors.grey
                                    : Color(0xFFF5C91D),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => contact(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.info,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: (){

                            FirebaseAuth.instance.signOut().then((value) {
                              print("Signed Out");
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => const Welcome()));
                            });
                          },
                          child: Icon(
                            Icons.logout_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ],
                      Expanded(
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
