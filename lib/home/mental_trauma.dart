import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_login_page/home/mental_affirmations.dart';
import 'package:app_login_page/home/mental_all.dart';
import 'package:app_login_page/home/mental_chatbot.dart';
import 'package:app_login_page/home/mental_home.dart';
import 'package:app_login_page/home/mental_journal_splashscreen.dart';
import 'package:app_login_page/home/mental_soothing_sounds.dart';

import 'mental_journal.dart';
import 'newchatbot.dart';


class TraumaPage extends StatefulWidget {
  @override
  _TraumaPageState createState() => _TraumaPageState();
}
class _TraumaPageState extends State<TraumaPage> {

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    Color DarkBlue1 = isEvening ? Color(0xFF544594) : Color(0xFF163EB9);
    return Scaffold(
      appBar: AppBar(
        title: Text('Heal Trauma'),
        backgroundColor: DarkBlue1,
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
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AffirmationPage()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left:8.0,right:8.0, bottom:8.0, top:25.0),
                            height: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color:Colors.black45,
                              image: DecorationImage(
                                image: AssetImage('assets/images/affirmationaffirmation1.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.9),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Affirmations',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Popins'
                                  ),
                                ),
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
                          onTap: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatbotScreen()),
                          );},
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color:Colors.black45,
                              image: DecorationImage(
                                image: AssetImage('assets/images/talktalk1.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.9),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Let\'s Talk',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Popins'
                                  ),
                                ),
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
                                builder: (context) => SoothingSoundsPage()),
                          );},
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color:Colors.black45,
                              image: DecorationImage(
                                image: AssetImage('assets/images/soundsound1.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(1.0),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Soothing Sounds',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Popins'
                                  ),
                                ),
                              ),
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              color: DarkBlue1,
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
