import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import '../../notifications/notifications.dart';
import '../../MedTdatabase/repository.dart';
import '../../models/pill.dart';
import '../../MedTscreens/home/medicines_list.dart';
import '../../MedTscreens/home/calendar.dart';
import '../../models/calendar_day_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Notifications _notifications = Notifications();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final Repository _repository = Repository();

  List<Pill> allListOfPills = [];
  List<Pill> dailyPills = [];

  final CalendarDayModel _days = CalendarDayModel(
    dayLetter: '',
    dayNumber: 0,
    year: 0000,
    month: 0,
    isChecked: false,
  );
  late List<CalendarDayModel> _daysList;

  int _lastChooseDay = 0;

  @override
  void initState() {
    super.initState();
    initNotifies();
    setData();
    _daysList = _days.getCurrentDays();
  }

  Future<void> initNotifies() async {
    flutterLocalNotificationsPlugin =
        await _notifications.initNotifies(context);
  }

  Future<void> setData() async {
    allListOfPills.clear();
    final pillMaps = await _repository.getAllData("Pills");
    if (pillMaps != null) {
      allListOfPills = pillMaps
          .map((pillMap) => Pill(
                id: 0,
                howManyWeeks: 0,
                time: 0,
                amount: '',
                medicineForm: '',
                name: '',
                type: '',
                notifyId: 0,
              ).pillMapToObject(pillMap))
          .toList();
    }
    chooseDay(_daysList[_lastChooseDay]);
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () async {
          await Navigator.pushNamed(context, "/add_new_medicine")
              .then((_) => setData());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24.0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 0.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: deviceHeight * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Journal",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      Icon(
                        Icons.notifications_none,
                        size: 42.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Calendar(chooseDay, _daysList),
                SizedBox(height: deviceHeight * 0.03),
                if (dailyPills.isEmpty)
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Text(
                        "No Medicine",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                else
                  MedicinesList(
                    dailyPills,
                    setData,
                    flutterLocalNotificationsPlugin,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseDay(CalendarDayModel clickedDay) {
    setState(() {
      _lastChooseDay = _daysList.indexOf(clickedDay);
      _daysList.forEach((day) => day.isChecked = false);
      final chooseDay = _daysList[_daysList.indexOf(clickedDay)];
      chooseDay.isChecked = true;
      dailyPills = allListOfPills.where((pill) {
        final pillDate = DateTime.fromMicrosecondsSinceEpoch(pill.time * 1000);
        return chooseDay.dayNumber == pillDate.day &&
            chooseDay.month == pillDate.month &&
            chooseDay.year == pillDate.year;
      }).toList();
      dailyPills.sort((pill1, pill2) => pill1.time.compareTo(pill2.time));
    });
  }
}
