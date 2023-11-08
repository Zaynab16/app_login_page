import 'package:app_login_page/Menuuuu.dart';
import 'package:app_login_page/home/newchatbot.dart';
import 'package:flutter/material.dart';
import 'package:app_login_page/home/mental_anxiety.dart';
import 'package:app_login_page/home/mental_chatbot.dart';
import 'package:app_login_page/home/mental_manage_pain.dart';
import 'package:app_login_page/home/mental_all.dart';
import 'package:app_login_page/home/mental_anger.dart';
import 'package:app_login_page/home/mental_ease.dart';
import 'package:app_login_page/home/mental_insights.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_login_page/home/mental_journal_splashscreen.dart';
import 'package:app_login_page/home/mental_trauma.dart';

import 'package:app_login_page/home/mental_journal.dart';


class WallpaperPage extends StatelessWidget {
  final List<String> talkOptions = [
    'Manage Anger',
    'Manage Pain',
    'Finding Ease',
    'Heal Trauma',
    'Manage Anxiety',
  ];
  final List<IconData> icons = [
    FontAwesomeIcons.solidSun,
    FontAwesomeIcons.pagelines,
    FontAwesomeIcons.snowflake,
    FontAwesomeIcons.handHoldingHeart,
    Icons.spa,
  ];
  final List<Widget> pages = [  AngerPage(),  PainPage(),  EasePage(),  TraumaPage(),  AnxietyPage(),];

  @override
  Widget build(BuildContext context) {
    // Define the width and height of the text widget
    double textWidth = 100;
    double textHeight = 50;
    // Get the current time
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    Color DarkBlue1 = isEvening ? Color(0xFF544594) : Color(0xFF163EB9);
    Color Pink= isEvening ? Color(0xFFF97E99) : Color(0xFFB4A7FD);
    Color OtherColor = isEvening ? Color(0xFFFF81A3)  : Color(0xFF05C0BF);
    ImageProvider wallpaper = isEvening
        ? AssetImage('assets/images/wallpaper.png')
        : AssetImage('assets/images/wallpaper2.png');
    String greetings = isEvening ? 'Good Morning,' : 'Good Evening,';



    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: FractionallySizedBox(
                heightFactor: 0.9, // 9/10 of the screen
                child: Container(
                  color: NewColor, // Fill color for the next unfilled part
                ),
              ),
            ),
            SafeArea(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: wallpaper,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 5,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,color:Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => menuuuu()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 -
                  textWidth / 2 -
                  15 -
                  textWidth,
              top: MediaQuery.of(context).size.height / 2 - textHeight - 180,
              child: Center(
                child: Text(
                  greetings,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 -
                  textWidth / 2 -
                  15 -
                  textWidth,
              top: MediaQuery.of(context).size.height / 2 - textHeight - 145,
              child: Row(
                children: [
                  Text(
                    'How are you feeling today?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      // Navigate to another page here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoodTrackerPage()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/insight1.png',
                      width: 30,
                      height: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Positioned.fill(
                  top: 220,
                  bottom: 50,
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'SELF CARE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 200),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AllList()),
                                      );
                                    },
                                    child: Text(
                                      'See All',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 35),
                              SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 12.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => pages[index]),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.circular(35),
                                                color: Colors.white,
                                              ),
                                              child: Icon(
                                                icons[index],
                                                color: Colors.green,
                                                size: 28,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              talkOptions[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: talkOptions.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.only(left: 25, right: 25),
                                ),
                              ),

                              SizedBox(height: 5),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          'MY 4 A.M FRIEND',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                10.0), // added horizontal margin
                                        child: Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 40.0,
                                                horizontal: 70.0),
                                            decoration: BoxDecoration(
                                              color: DarkBlue,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'How are you feeling?',
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 10.0),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => ChatbotScreen()),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Pink, // background color
                                                  ),
                                                  child: Text(
                                                    'Talk Now',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .black, // text color
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          'THOUGHTS OF THE DAY',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Expanded(
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(25.0),
                                                    child: Container(
                                                      color: DarkBlue,
                                                    ),
                                                  ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "What's on your mind today?",
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.0),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => JournalPage()),
                                                        );
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Pink, // Replace with your desired button background color
                                                      ),
                                                      child: Text(
                                                        'Write Now',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),/*
                              SizedBox(height: 25),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          'SLEEP SOLUTIONS',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Expanded(
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(25.0),
                                                  child: Container(
                                                    color: DarkBlue,
                                                  ),
                                                ),

                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Having difficulties to sleep?",
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.0),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => JournalPage()),
                                                        );
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Pink, // Replace with your desired button background color
                                                      ),
                                                      child: Text(
                                                        'Explore',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),*/
                              SizedBox(height:10,),
                            ],
                          )
                        ],
                      ),
                    ),
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
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.home, color: OtherColor),
                          ),
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
                              MaterialPageRoute(//ChatbotScreen()
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
          ],
        ),
      ),
    );
  }
}
