import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_login_page/home/mental_all.dart';
import 'package:app_login_page/home/mental_belly_breathing.dart';
import 'package:app_login_page/home/mental_chatbot.dart';
import 'package:app_login_page/home/mental_groundingexercises.dart';
import 'package:app_login_page/home/mental_home.dart';
import 'package:app_login_page/home/mental_journal_splashscreen.dart';
import 'package:app_login_page/home/mental_square_breathing.dart';
import 'package:app_login_page/home/mental_triangle_breathing.dart';

import 'mental_journal.dart';
import 'newchatbot.dart';

class CalmingTechniquesPage extends StatefulWidget {
  @override
  _CalmingTechniquesPageState createState() => _CalmingTechniquesPageState();
}
class _CalmingTechniquesPageState extends State<CalmingTechniquesPage> {
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    return Scaffold(
      appBar: AppBar(
        title: Text('Calming Techniques'),
        backgroundColor: DarkBlue,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BellyBreathingVideo()),
                          );},
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Color(0xFFD2C3FF), // Replace the image with a color
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Belly',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Breathing',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SquareBreathingVideo()),
                          );},
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Color(0xFFEFBBE7),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Square',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Breathing',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TriangleBreathingVideo()),
                          );},
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Color(0xFFB5F1E1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Triangle',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Breathing',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GroundingExercisesVideo()),
                          );},
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Color(0xFFB5F1B6),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Grounding',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Exercises',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),

          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              color: DarkBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WallpaperPage()),
                      );
                    },
                    child: Icon(Icons.home, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllList()),
                      );
                    },

                      child: Icon(FontAwesomeIcons.thLarge, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatbotScreen()),
                      );
                    },
                    child: Icon(Icons.question_answer_rounded,
                        color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JournalPage()),
                      );
                    },
                    child: Icon(FontAwesomeIcons.journalWhills, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
