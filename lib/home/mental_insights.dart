import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:app_login_page/home/mental_mood.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'mental_chatbot.dart';

class MoodTrackerPage extends StatefulWidget {
  @override
  _MoodTrackerPageState createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {
  List<bool> showPlusIcon = List.generate(5, (_) => true);
  List<bool> showCircle = List.generate(5, (_) => false);
  List<bool> showTick = List.generate(5, (_) => false);
  int x = 0;
  List<Color> circleColors = [
    Colors.yellow,
    Colors.greenAccent,
    Colors.deepPurpleAccent,
    Colors.grey,
    Colors.black54
  ];
  List<double> circleHeights = [0, 0, 0, 0, 0];
  List<int> count = [0, 0, 0, 0, 0];

  List<DateTime> dates = [
    DateTime.now().subtract(Duration(days: 4)),
    DateTime.now().subtract(Duration(days: 3)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now(),
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedMoods();
  }

  Future<void> _loadSavedMoods() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < dates.length; i++) {
      int? moodIndex = prefs.getInt(_getFormattedDate(dates[i]));
      if (moodIndex != null) {
        setState(() {
          showCircle[i] = true;
          showPlusIcon[i] = false;
          showTick[i]=true;
          x = moodIndex;
          circleHeights[i] = _getCircleHeight(moodIndex);
          circleColors[i] = _getCircleColor(moodIndex);
          count[moodIndex] += 1;
        });
      } else {
        setState(() {
          showCircle[i] = false;
          showPlusIcon[i] = true;
          showTick[i]=false;
        });
      }
    }
    if ((count[3] + count[4]) > 2 || count[3] > 2 || count[4] > 2) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            title: Column(
              children: [
                Image.asset(
                  'assets/images/sad.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 4,
                ),
                Text('You\'ve been a lot sad lately!'),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
            content: Text(
              'Do you want to talk about it?',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chatbot()),
                  );
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _saveMood(int index, int selectedMoodIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_getFormattedDate(dates[index]), selectedMoodIndex);
    setState(() {
      count[selectedMoodIndex] += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour >= 18 && currentTime.hour < 24;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF05C0BF)  : Color(0xFFFF8FAC);
    Color DarkBlue = isEvening ? Color(0xFF163EB9) : Color(0xFF3D3463);
    Color DarkBlue1 = isEvening ? Color(0xFF163EB9) : Color(0xFF544594);
    Color OtherColor = isEvening ? Color(0xFF05C0BF)  : Color(0xFFFF81A3);
    double screenHeight = MediaQuery.of(context).size.height;
    double columnHeight = screenHeight / 2.5;

    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
        backgroundColor:DarkBlue1,
        /*actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],*/
      ),
      body: SingleChildScrollView(
      child:Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 22,top:5),
                    child: Text(
                      "Mood Streak",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Popins'
                      ),
                    ),
                  ),
                  SizedBox(height:15),
                  Row(
                    children: [
                      for (int i = 0; i < dates.length; i++)
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Transform.translate(
                                offset: Offset(0, -11),
                                child: Divider(
                                  height: 10,
                                  thickness: 2,
                                  color: Color(0xFFE5E5E5),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.white,
                                        child: showTick[i]
                                            ? Icon(Icons.check_box, size: 20, color: OtherColor,)
                                            : Icon(Icons.add_box, size: 20, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "${_getFormattedDate(dates[i])}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: columnHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            EmotionIcon(
                              icon: FontAwesomeIcons.solidLaughBeam,
                              color: 0,
                              iconColor: Colors.yellow,
                            ),
                            EmotionIcon(
                              icon: FontAwesomeIcons.solidSmile,
                              color: 3,
                              iconColor: Colors.greenAccent,
                            ),
                            EmotionIcon(
                              icon: FontAwesomeIcons.solidMeh,
                              color: 5,
                              iconColor: Colors.deepPurpleAccent,
                            ),
                            EmotionIcon(
                              icon: FontAwesomeIcons.solidFrown,
                              color: 3,
                              iconColor: Colors.grey,
                            ),
                            EmotionIcon(
                              icon: FontAwesomeIcons.solidTired,
                              color: 5,
                              iconColor: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  for (int i = 0; i < dates.length; i++)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: columnHeight,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Color(0xFFFFFFFF)),
                                left: BorderSide(color: Color(0xFFFFFFFF)),
                                right: BorderSide(color: Color(0xFFFFFFFF)),
                                bottom: BorderSide(color: Color(0xFFFFFFFF)),
                              ),
                              color: i % 2 == 0
                                  ? Colors.grey.shade100
                                  : Colors.grey.shade200,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (showPlusIcon[i]) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MoodSwingsPage(
                                            showPlusIcon: showPlusIcon,
                                            updatePlusIconVisibility:
                                                (int index) {
                                              setState(() {
                                                showPlusIcon[i] = false;
                                              });
                                            },
                                            index: i,
                                            addCircle: (int index,
                                                int selectedMoodIndex) {
                                              setState(() {
                                                showCircle[i] = true;
                                                showTick[i]=true;
                                                x = selectedMoodIndex;
                                                circleHeights[i] =
                                                    _getCircleHeight(
                                                        selectedMoodIndex);
                                                circleColors[i] =
                                                    _getCircleColor(
                                                        selectedMoodIndex);
                                              });
                                              _saveMood(
                                                  index, selectedMoodIndex);
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Column(
                                    children: [
                                      showPlusIcon[i]
                                          ? CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            )
                                          : SizedBox(),
                                      if (i == 0 && showCircle[i])
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: circleColors[0],
                                            ),
                                            SizedBox(
                                              height: circleHeights[0],
                                            ),
                                          ],
                                        )
                                      else
                                        SizedBox(),
                                      if (i == 1 && showCircle[i])
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: circleColors[1],
                                            ),
                                            SizedBox(
                                              height: circleHeights[1],
                                            ),
                                          ],
                                        )
                                      else
                                        SizedBox(),
                                      if (i == 2 && showCircle[i])
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: circleColors[2],
                                            ),
                                            SizedBox(
                                              height: circleHeights[2],
                                            ),
                                          ],
                                        )
                                      else
                                        SizedBox(),
                                      if (i == 3 && showCircle[i])
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: circleColors[3],
                                            ),
                                            SizedBox(
                                              height: circleHeights[3],
                                            ),
                                          ],
                                        )
                                      else
                                        SizedBox(),
                                      if (i == 4 && showCircle[i])
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: circleColors[4],
                                            ),
                                            SizedBox(
                                              height: circleHeights[4],
                                            ),
                                          ],
                                        )
                                      else
                                        SizedBox(),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Mood',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "${_getFormattedDate(dates[i])}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: !(count[0] == 0 &&
                  count[1] == 0 &&
                  count[2] == 0 &&
                  count[3] == 0 &&
                  count[4] == 0),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 0, right: 0, bottom: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFE5E5E5),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right:0),
                          child: Container(
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SfCircularChart(
                                    legend: Legend(
                                      isVisible: true,
                                      position: LegendPosition.right,
                                      legendItemBuilder: (String name, dynamic series, dynamic point, int index) {
                                        String text;
                                        Widget iconData;
                                        int data = point.y as int;

                                        if (index == 0) {
                                          iconData = Emotion(
                                            icon: FontAwesomeIcons.solidLaughBeam,
                                            color: 0,
                                            iconColor: Colors.yellow,
                                          );
                                          text = 'Excellent';
                                        } else if (index == 1) {
                                          iconData = Emotion(
                                            icon: FontAwesomeIcons.solidSmile,
                                            color: 3,
                                            iconColor: Colors.greenAccent,
                                          );
                                          text = 'Great';
                                        } else if (index == 2) {
                                          iconData = Emotion(
                                            icon: FontAwesomeIcons.solidMeh,
                                            color: 5,
                                            iconColor: Colors.deepPurpleAccent,
                                          );
                                          text = 'Neutral';
                                        } else if (index == 3) {
                                          iconData = Emotion(
                                            icon: FontAwesomeIcons.solidFrown,
                                            color: 3,
                                            iconColor: Colors.grey,
                                          );
                                          text = 'Bad';
                                        } else if (index == 4) {
                                          iconData = Emotion(
                                            icon: FontAwesomeIcons.solidTired,
                                            color: 5,
                                            iconColor: Colors.black45,
                                          );
                                          text = 'Awful';
                                        } else {
                                          iconData = EmotionIcon(
                                            icon: FontAwesomeIcons.solidSmile,
                                            color: 3,
                                            iconColor: Colors.greenAccent,
                                          );
                                          text = '';
                                        }

                                        String legendText = ' $text: ${(data * 25).toStringAsFixed(0)}%';
                                        return Container(
                                          width:120, // Set the width of the container to 300 pixels (you can adjust this value as needed)
                                          padding: EdgeInsets.only(bottom:1), // Optional: Set padding inside the container
                                          child: Row(
                                            children:[
                                              iconData,
                                            Text(
                                            legendText,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),

                                          ],
                                        ),
                                        );

                                      },
                                    ),
                                    series: <CircularSeries>[
                                      DoughnutSeries<int, String>(
                                        dataSource: count,
                                        xValueMapper: (int data, _) => '',
                                        yValueMapper: (int data, _) => data,
                                        dataLabelSettings: DataLabelSettings(
                                          isVisible: count[0] == 0 &&
                                              count[1] == 0 &&
                                              count[2] == 0 &&
                                              count[3] == 0 &&
                                              count[4] == 0
                                              ? false
                                              : false,
                                          labelPosition: ChartDataLabelPosition.inside,
                                        ),
                                        dataLabelMapper: (int data, int index) {
                                          String text;
                                          if (index == 0) {
                                            text = 'Excellent';
                                          } else if (index == 1) {
                                            text = 'Great';
                                          } else if (index == 2) {
                                            text = 'Neutral';
                                          } else if (index == 3) {
                                            text = 'Bad';
                                          } else if (index == 4) {
                                            text = 'Awful';
                                          } else {
                                            text = '';
                                          }
                                          return '$text: ${(data * 25).toStringAsFixed(0)}%';
                                        },
                                      ),
                                    ],
                                    palette: <Color>[
                                      Colors.yellow,
                                      Colors.greenAccent,
                                      Colors.deepPurpleAccent,
                                      Colors.grey,
                                      Color(0xFF6C6C6D),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
      ),
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    // Format the date as "MMM d"
    final formatter = DateFormat.MMMd();
    return formatter.format(date);
  }

  double _getCircleHeight(int moodIndex) {
    return moodIndex == 0
        ? 190
        : moodIndex == 1
            ? 140
            : moodIndex == 2
                ? 85
                : moodIndex == 3
                    ? 30
                    : moodIndex == 4
                        ? 0
                        : 1;
  }

  Color _getCircleColor(int moodIndex) {
    return moodIndex == 0
        ? Colors.yellow
        : moodIndex == 1
            ? Colors.greenAccent
            : moodIndex == 2
                ? Colors.deepPurpleAccent
                : moodIndex == 3
                    ? Colors.grey
                    : moodIndex == 4
                        ? Colors.black54
                        : Colors.pink;
  }
}

class EmotionIcon extends StatelessWidget {
  final IconData icon;
  final int color;
  final Color iconColor;

  const EmotionIcon({
    Key? key,
    required this.icon,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the colors for each emotion level
    final colors = [
      Colors.pinkAccent,
      Colors.yellow.shade700,
      Colors.red.shade700,
      Colors.black,
      Colors.greenAccent,
      Colors.white,
    ];

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors[color],
          ),
        ),
        Icon(
          icon,
          size: 24,
          color: iconColor,
        ),
      ],
    );
  }
}

class Emotion extends StatelessWidget {
  final IconData icon;
  final int color;
  final Color iconColor;

  const Emotion({
    Key? key,
    required this.icon,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the colors for each emotion level
    final colors = [
      Colors.pinkAccent,
      Colors.yellow.shade700,
      Colors.red.shade700,
      Colors.black,
      Colors.greenAccent,
      Colors.white,
    ];

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 17,
          height: 17,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors[color],
          ),
        ),
        Icon(
          icon,
          size: 21,
          color: iconColor,
        ),
      ],
    );
  }
}
