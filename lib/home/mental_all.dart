import 'package:app_login_page/home/newchatbot.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_login_page/home/mental_anxiety.dart';
//import '../../my_app/lib/mental_chatbot.dart';
import 'package:app_login_page/home/mental_journal_splashscreen.dart';
import 'package:app_login_page/home/mental_manage_pain.dart';
import 'package:app_login_page/home/mental_anger.dart';
import 'package:app_login_page/home/mental_ease.dart';
import 'package:app_login_page/home/mental_home.dart';
import 'package:app_login_page/home/mental_trauma.dart';

import 'mental_chatbot.dart';
import 'mental_journal.dart';

class AllList extends StatefulWidget {
  @override
  _AllListState createState() => _AllListState();
}
class _AllListState extends State<AllList> {
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    double screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 80;

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFFFF81A3)  : Color(0xFF05C0BF);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    Color DarkBlue1 = isEvening ? Color(0xFF544594) : Color(0xFF163EB9);
    return Scaffold(
      appBar: AppBar(
        title: Text('Self Care'),
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
            padding: EdgeInsets.only(top: 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height:20,),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AngerPage()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 12.0, right: 4.0, top: 8.0, bottom:8.0),
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: screenHeight * 0.26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/talktalk1.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.purple.shade200.withOpacity(1.0),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: screenWidth / 15, top: screenHeight * 0.12),
                              child: Text(
                                'Manage Anger',
                                style: TextStyle(
                                  color: Colors.white,
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PainPage()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 4.0, right: 12.0, top: 8.0, bottom:8.0),
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: screenHeight * 0.26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/painpain2.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(1.0),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: screenWidth / 13, top: screenHeight * 0.12),
                              child: Text(
                                'Manage Pain',
                                style: TextStyle(
                                  color: Colors.white,
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

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EasePage()),
                          );},
                          child: Container(
                            margin: EdgeInsets.only(left: 12.0, right: 4.0, top: 8.0, bottom:8.0),
                            width:
                            MediaQuery.of(context).size.width * 0.45,
                            height: screenHeight * 0.26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/easeease1.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(1.0),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:screenWidth/12,top:screenHeight * 0.12),
                              child: Text(
                                'Finding Ease',
                                style: TextStyle(
                                  color: Colors.white,
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TraumaPage()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 4.0, right: 12.0, top: 8.0, bottom:8.0),
                            width:
                            MediaQuery.of(context).size.width * 0.45,
                            height: screenHeight * 0.26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/traumatrauma1.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(1.0),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:screenWidth/12,top:screenHeight * 0.12),
                              child: Text(
                                'Heal Trauma',
                                style: TextStyle(
                                  color: Colors.white,
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
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnxietyPage()),
                          );},
                          child: Container(
                            margin: EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom:8.0),
                            height: screenHeight * 0.26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/anxietyanxiety1.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.8),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:screenWidth/3.2,top:screenHeight * 0.12),
                              child: Text(
                                'Manage Anxiety',
                                style: TextStyle(
                                  color: Colors.white,
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
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom:0,
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
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(FontAwesomeIcons.thLarge, color: NewColor,size:22),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatbotScreen()
                        ),
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
