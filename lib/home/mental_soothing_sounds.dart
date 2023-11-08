import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_login_page/home/mental_all.dart';
import 'package:app_login_page/home/mental_chatbot.dart';
import 'package:app_login_page/home/mental_home.dart';
import 'package:app_login_page/home/mental_journal_splashscreen.dart';
import 'package:app_login_page/home/mental_nature.dart';
import 'package:app_login_page/home/mental_night.dart';
import 'package:app_login_page/home/mental_rain.dart';
import 'package:app_login_page/home/mental_waterfall.dart';

import 'mental_journal.dart';
import 'newchatbot.dart';

class SoothingSoundsPage extends StatefulWidget {
  @override
  _SoothingSoundsPageState createState() => _SoothingSoundsPageState();
}
class _SoothingSoundsPageState extends State<SoothingSoundsPage> {
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
        title: Text('Soothing Sounds'),
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
                              builder: (context) => NatureVideo()),
                        );},
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color(0xFFC3FFB9),
                            image: DecorationImage(
                              image: AssetImage('assets/images/nature.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.7),
                                BlendMode.dstATop,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Nature Sound',
                                  style: TextStyle(
                                    color: Colors.white,
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
                              builder: (context) => RainVideo()),
                        );},
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color(0xFFD7E0D5),
                            image: DecorationImage(
                              image: AssetImage('assets/images/rain.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.8),
                                BlendMode.dstATop,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Rain Sound',
                                  style: TextStyle(
                                    color: Colors.white,
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
                              builder: (context) => WaterVideo()),
                        );},
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color(0xFFB5F1E1),
                            image: DecorationImage(
                              image: AssetImage('assets/images/waterfall.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.8),
                                BlendMode.dstATop,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Waterfall',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Sound',
                                  style: TextStyle(
                                    color: Colors.white,
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
                              builder: (context) => NightVideo()),
                        );},
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color(0xFFA5B4FF),
                            image: DecorationImage(
                              image: AssetImage('assets/images/night.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.8),
                                BlendMode.dstATop,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Night Sound',
                                  style: TextStyle(
                                    color: Colors.white,
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
