import 'dart:convert';
import 'package:app_login_page/home/newchatbot.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_login_page/home/mental_all.dart';
import 'package:app_login_page/home/mental_home.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  bool isSpread = false;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  Map<String, dynamic> _events = {};
  TextEditingController _thoughtsController = TextEditingController();
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    final eventsForDay = _events[_formatDateTime(day)];
    return eventsForDay != null ? [eventsForDay] : [];
  }

  Future<void> _loadEvents() async {
    _prefs = await SharedPreferences.getInstance();
    final eventsString = _prefs!.getString('events') ?? '{}';
    try {
      final decodedMap = decodeMap(eventsString);
      setState(() {
        _events = Map<String, dynamic>.from(decodedMap);
      });
    } catch (e) {
      print('Error decoding events: $e');
      setState(() {
        _events = {};
      });
    }
  }

  @override
  void dispose() {
    _thoughtsController.dispose();
    super.dispose();
  }

  void _saveEvents() {
    _prefs?.setString('events', encodeMap(_events));
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    setState(() {
      _focusedDay = focusedDay;
    });
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThoughtsPage(
          selectedDay: selectedDay,
          onSaveThoughts: _saveThoughts,
          events: _events,
        ),
      ),
    );
    await _loadEvents();
    final formattedDate = _formatDateTime(selectedDay);
    final eventsForDay = _events[formattedDate];
    if (eventsForDay == null ||
        (eventsForDay is List && eventsForDay.isEmpty)) {
      setState(() {
        _events.remove(formattedDate);
      });
      _saveEvents();
    }
  }

  void _saveThoughts(DateTime selectedDay, String thoughts) {
    if (thoughts.isEmpty) {
      return;
    }

    final formattedDate = _formatDateTime(selectedDay);
    if (!(_events.containsKey(formattedDate) &&
        _events[formattedDate] is List<dynamic>)) {
      _events[formattedDate].add(thoughts);
    }
    _saveEvents();
   // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFFFF81A3) : Color(0xFF05C0BF);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    Color Pink = isEvening ? Color(0xFFF97E99) : Color(0xFFB4A7FD);
    Color DarkBlue1 = isEvening ? Color(0xFF544594) : Color(0xFF163EB9);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkBlue1,
        title: Text('Journal'),
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
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              SingleChildScrollView(
                child: Expanded(
                  child: TableCalendar(
                    calendarFormat: _calendarFormat,
                    focusedDay: _focusedDay,
                    firstDay: DateTime.utc(DateTime.now().year - 1),
                    lastDay: DateTime.utc(DateTime.now().year + 1),
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                      });
                    },
                    eventLoader: _getEventsForDay,
                    onDaySelected: _onDaySelected,
                  ),
                ),
              ),
            ],
          ),
          /*Positioned(
            bottom: 80,
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
                                    ? Color(0xFFF5C91D)
                                    : Colors
                                    .grey,
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
          ),*/
          Container(
            height: 50,
            color: DarkBlue1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WallpaperPage()),
                    );
                  },
                  child: Icon(Icons.home, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllList()),
                    );
                  },
                  child: Icon(FontAwesomeIcons.thLarge, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatbotScreen()),
                    );
                  },
                  child:
                      Icon(Icons.question_answer_rounded, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalPage()),
                    );
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child:
                        Icon(FontAwesomeIcons.journalWhills, color: NewColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThoughtEntry {
  final String text;
  final DateTime createdAt;

  ThoughtEntry(this.text, this.createdAt);
}

class ThoughtsPage extends StatefulWidget {
  final DateTime selectedDay;
  final Function(DateTime, String) onSaveThoughts;
  final Map<String, dynamic> events;

  ThoughtsPage(
      {required this.selectedDay,
      required this.onSaveThoughts,
      required this.events});

  @override
  _ThoughtsPageState createState() => _ThoughtsPageState();
}

class _ThoughtsPageState extends State<ThoughtsPage> {
  TextEditingController _thoughtsController = TextEditingController();
  List<ThoughtEntry> previousThoughts = [];

  @override
  void initState() {
    super.initState();
    previousThoughts = _loadPreviousThoughts();
  }

  List<ThoughtEntry> _loadPreviousThoughts() {
    final formattedDate = _formatDateTime(widget.selectedDay);
    final events = widget.events[formattedDate];
    if (events is List<dynamic>) {
      return List<ThoughtEntry>.from(events.map((event) {
        if (event is Map<String, dynamic> &&
            event.containsKey('text') &&
            event.containsKey('createdAt')) {
          return ThoughtEntry(
              event['text'], DateTime.parse(event['createdAt']));
        }
        return null;
      }).where((thoughtEntry) => thoughtEntry != null));
    } else if (events is String) {
      return [ThoughtEntry(events, DateTime.now())];
    } else {
      return [];
    }
  }

  void _deleteThought(int index) {
    setState(() {
      previousThoughts.removeAt(index);
    });

    final formattedDate = _formatDateTime(widget.selectedDay);
    if (previousThoughts.isEmpty) {
      widget.events.remove(formattedDate);
    }

    _saveThoughts();
  }

  void _saveThoughts() {
    final formattedDate = _formatDateTime(widget.selectedDay);
    widget.events[formattedDate] = previousThoughts.isNotEmpty
        ? previousThoughts
            .map((thoughtEntry) => {
                  'text': thoughtEntry.text,
                  'createdAt': thoughtEntry.createdAt.toIso8601String(),
                })
            .toList()
        : [];
    widget.onSaveThoughts(widget.selectedDay, formattedDate);
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _thoughtsController.dispose();
    super.dispose();
  }

  void _openAddThoughtPage() async {
    final thoughtEntry = await Navigator.push<ThoughtEntry>(
      context,
      MaterialPageRoute(
        builder: (context) => AddThoughtPage(
          onSaveThought: (thoughtEntry) {
            setState(() {
              previousThoughts.add(thoughtEntry);
            });
            _saveThoughts();
          },
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    Color DarkBlue1 = isEvening ? Color(0xFF544594) : Color(0xFF163EB9);
    Color LatestColor = isEvening ? Color(0xFF8A3AA8) : Color(0xFF3A54A8);
    Color BackgroundColor = isEvening ? Color(0xFFECE9F3) : Color(0xFFE9EDF3);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        backgroundColor: DarkBlue1,
        title: Text('Thoughts'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/calenderrr.png'),
                        color: LatestColor,
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '${getMonthName(widget.selectedDay.month)} ${widget.selectedDay.day}',
                        style: TextStyle(
                          fontSize: 18,
                          color: LatestColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  if (previousThoughts.isNotEmpty) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thoughts:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: previousThoughts.map((thoughtEntry) {
                                final formattedTime = DateFormat.jm().format(thoughtEntry.createdAt);

                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Dismissible(
                                    key: Key(thoughtEntry.text),
                                    direction: DismissDirection.horizontal,
                                    onDismissed: (direction) {
                                      _deleteThought(previousThoughts.indexOf(thoughtEntry));
                                    },
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(13.0),
                                          border: Border.all(color: Color(0xFFB2B2B2)),
                                        ),
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              formattedTime,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              thoughtEntry.text,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom:16),
            child: Expanded(
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child:IconButton(
                    icon: Icon(Icons.add,color: LatestColor,),
                    onPressed: () {
                      _openAddThoughtPage();
                    },
                  ),
                )
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            color: DarkBlue1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WallpaperPage()),
                    );
                  },
                  child: Icon(Icons.home, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllList()),
                    );
                  },
                  child: Icon(FontAwesomeIcons.thLarge, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatbotScreen()),
                    );
                  },
                  child:
                      Icon(Icons.question_answer_rounded, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalPage()),
                    );
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    child: Icon(FontAwesomeIcons.journalWhills,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddThoughtPage extends StatelessWidget {
  final Function(ThoughtEntry) onSaveThought;

  AddThoughtPage({required this.onSaveThought});

  @override
  Widget build(BuildContext context) {
    TextEditingController _thoughtController = TextEditingController();
    DateTime currentTime = DateTime.now();

    // Check if it's evening (past 6 p.m.)
    bool isEvening = currentTime.hour < 18;
    // Define the colors
    Color NewColor = isEvening ? Color(0xFF181939) : Color(0xFF020A48);
    Color DarkBlue = isEvening ? Color(0xFF3D3463) : Color(0xFF163EB9);
    Color DarkBlue1 = isEvening ? Color(0xFF544594) : Color(0xFF163EB9);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Thought'),
        backgroundColor: DarkBlue1,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _thoughtController,
                // Set the border to none to remove the line
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                // Allow the text to wrap to the next line
                maxLines: null,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final thought = _thoughtController.text;
                if (thought.isNotEmpty) {
                  final thoughtEntry = ThoughtEntry(thought, DateTime.now());
                  onSaveThought(thoughtEntry);
                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(DarkBlue1), // Change the color here
              ),
              child: Text('Save'),
            ),

          ],
        ),
      ),
    );
  }
}




String getMonthName(int monthNumber) {
  List<String> monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  if (monthNumber >= 1 && monthNumber <= 12) {
    return monthNames[monthNumber - 1];
  }
  return 'Invalid Month';
}

Map<String, dynamic> decodeMap(String encodedMap) {
  return encodedMap.isNotEmpty ? json.decode(encodedMap) : {};
}

String encodeMap(Map<String, dynamic> map) {
  return json.encode(map);
}
