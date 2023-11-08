import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_login_page/home/mental_all.dart';
import 'package:app_login_page/home/mental_chatbot.dart';
import 'package:app_login_page/home/mental_journal.dart';
import 'package:app_login_page/home/mental_journal_splashscreen.dart';
import 'package:app_login_page/home/mental_manage_pain.dart';
import 'package:app_login_page/home/mental_anger.dart';
import 'package:app_login_page/home/mental_home.dart';
import 'package:app_login_page/home/mental_trauma.dart';

import 'mental_chatbot.dart';
import 'mental_gratitude.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}
class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
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
            padding: EdgeInsets.only(top: screenHeight/3.5,left:10,right:10),
              child: Column(
                children: [
                  //existing code here
                  //existing code here
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GratitudePage()),
                          );},
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/1.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(1.0),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:screenWidth/8,top:85),
                              child: Text(
                                'Gratitude',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
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
                                builder: (context) => JournalPage()),
                          );},
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/2.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(1.0),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:screenWidth/8,top:85),
                              child: Text(
                                'Thoughts',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
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
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(FontAwesomeIcons.thLarge, color: Colors.blue),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Chatbot()),
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
                            builder: (context) => JournalSplashScreen()),
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
