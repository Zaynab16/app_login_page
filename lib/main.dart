import 'package:app_login_page/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'home/mental_settings.dart';
import 'home/mental_theme_notifier.dart';
import 'package:provider/provider.dart';

//import 'home/mental_theme_notifier.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // initialize hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox("Habit_Database");



  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: Size(360, 780),
    builder: (context , child) =>GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Mate',
      theme: Provider.of<ThemeNotifier>(context).getTheme(),
      home: Welcome(),
      routes: {
        '/settings': (context) => SettingsPage(),
      },
    ));
  }
}

