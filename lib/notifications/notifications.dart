import 'package:app_login_page/models/pill.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  late BuildContext _context;

  Future<FlutterLocalNotificationsPlugin> initNotifies(
      BuildContext context) async {
    this._context = context;

    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    return flutterLocalNotificationsPlugin;
  }

  Future showNotification(String title, String description, int time, int id,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id.toInt(),
      title,
      description,
      tz.TZDateTime.now(tz.local).add(Duration(milliseconds: time)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'medicines_id',
          'medicines',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future removeNotify(int notifyId,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    try {
      await flutterLocalNotificationsPlugin.cancel(notifyId);
    } catch (e) {
      return null;
    }
  }
}
