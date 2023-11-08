import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_login_page/home/mental_all.dart';
import 'package:app_login_page/home/mental_chatbot.dart';
import 'package:app_login_page/home/mental_home.dart';
import 'package:app_login_page/home/mental_journal_splashscreen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mental_journal.dart';

class GratitudePage extends StatefulWidget {
  @override
  _GratitudePageState createState() => _GratitudePageState();
}

class _GratitudePageState extends State<GratitudePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  Map<String, dynamic> _events = {}; // Updated type
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
    final eventsString =
        _prefs!.getString('events') ?? '{}';
    try {
      final decodedMap = decodeMap(eventsString);
      setState(() {
        _events = Map<String, dynamic>.from(decodedMap);
      });
    } catch (e) {
      print('Error decoding events: $e');
      setState(() {
        _events = {}; // Set empty map as default in case of decoding error
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
        builder: (context) => WritePage(
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
    Navigator.pop(context);
  }

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
        backgroundColor: DarkBlue,
        title: Text('JOURNAL'),
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
          Container(
            height: 50,
            color: DarkBlue,
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
                      MaterialPageRoute(
                          builder: (context) => Chatbot()),
                    );
                  },
                  child:
                  Icon(Icons.question_answer_rounded, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JournalPage()),
                    );
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FontAwesomeIcons.journalWhills,
                        color: Colors.blue),
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

class WritePage extends StatefulWidget {
  final DateTime selectedDay;
  final Function(DateTime, String) onSaveThoughts;
  final Map<String, dynamic> events;

  WritePage(
      {required this.selectedDay,
        required this.onSaveThoughts,
        required this.events});

  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  TextEditingController _thoughtsController = TextEditingController();
  List<String> previousThoughts = [];

  @override
  void initState() {
    super.initState();
    previousThoughts = _loadPreviousThoughts();
  }

  List<String> _loadPreviousThoughts() {
    final formattedDate = _formatDateTime(widget.selectedDay);
    final events = widget.events[formattedDate];
    if (events is List<dynamic>) {
      return List<String>.from(events);
    } else if (events is String) {
      return [events];
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
    widget.events[formattedDate] =
    previousThoughts.isNotEmpty ? previousThoughts : [];
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
        backgroundColor: DarkBlue,
        title: Text('Thoughts'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text(
                    'Date: ${widget.selectedDay.day}/${widget.selectedDay.month}/${widget.selectedDay.year}',
                    style: TextStyle(fontSize: 18,),
                  ),
                  SizedBox(height:15),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'I am grateful for...',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
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
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: previousThoughts.length,
                          itemBuilder: (context, index) {
                            final thought = previousThoughts[index];
                            return Dismissible(
                              key: Key(thought),
                              direction: DismissDirection.horizontal,
                              onDismissed: (direction) {
                                _deleteThought(index);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        thought,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _deleteThought(index);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
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
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _thoughtsController,
              decoration: InputDecoration(
                labelText: 'Thoughts',
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:
                DarkBlue,
              ),
              child: Text('Save'),
              onPressed: () {
                final thoughts = _thoughtsController.text;
                if (thoughts.isNotEmpty) {
                  previousThoughts.add(thoughts);
                  _saveThoughts();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Map<String, dynamic> decodeMap(String encodedMap) {
  return encodedMap.isNotEmpty ? json.decode(encodedMap) : {};
}

String encodeMap(Map<String, dynamic> map) {
  return json.encode(map);
}
