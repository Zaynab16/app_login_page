import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';
//import 'sleep_p_entry.dart';
import 'package:intl/intl.dart' as intl;
import 'decoration/colors.dart' as color;
import 'package:app_login_page/SleepCalculator/lib/sleep_utility/functions.dart';
import 'package:app_login_page/SleepCalculator/lib/sleep_p_entry.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  State<SleepPage> createState() => _SleepPageState();
}



class _SleepPageState extends State<SleepPage> {
  DateTime now = DateTime.now();
  ClockTimeFormat _clockTimeFormat = ClockTimeFormat.twentyFourHours;
  ClockIncrementTimeFormat _clockIncrementTimeFormat =
      ClockIncrementTimeFormat.fiveMin;

  PickedTime _inBedTime = PickedTime(h: 0, m: 0);
  PickedTime _outBedTime = PickedTime(h: 8, m: 0);
  PickedTime _intervalBedTime = PickedTime(h: 0, m: 0);


  double _sleepGoal = 8.0;
  bool _isSleepGoal = false;

  bool? validRange = true;

  @override
  void initState() {
    super.initState();
    _isSleepGoal = (_sleepGoal >= 8.0) ? true : false;
    _intervalBedTime = formatIntervalTime(
      init: _inBedTime,
      end: _outBedTime,
      clockTimeFormat: _clockTimeFormat,
      clockIncrementTimeFormat: _clockIncrementTimeFormat,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF141925),
      body:
      Container(
        padding: const EdgeInsets.only(top: 70, left: 30,right: 30),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 35,),
                ),
                const SizedBox(width: 30,),


                Text(
                  "Sleep Calculator",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,


                  ),

                ),
                Expanded(child: Container()),

                // can add logo here


              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  "Estimate",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,


                  ),

                ),



              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15),

                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 20,
                    color: color.AppColor.gradientSecond.withOpacity(0.2),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25,right: 20,),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Routine",
                        style: TextStyle(
                          fontSize: 16,
                          color: color.AppColor.homePageContainerTextSmall,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Assess ",
                        style: TextStyle(
                            fontSize: 35,
                            color: color.AppColor.homePageContainerTextSmall
                        ),
                      ),
                      Text(
                        "your sleep  ",
                        style: TextStyle(
                            fontSize: 35,
                            color: color.AppColor.homePageContainerTextSmall
                        ),
                      ),
                      Text(
                        "time ",
                        style: TextStyle(
                            fontSize: 35,
                            color: color.AppColor.homePageContainerTextSmall
                        ),
                      ),

                      SizedBox(height: 37,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              //Icon(Icons.timer, size: 20,color: color.AppColor.homePageContainerTextSmall,),
                              SizedBox(width: 10,),



                            ],
                          ),
                          Expanded(child: Container()),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SleepPEntry()));

                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white, size: 60,
                            ),
                          ),


                        ],
                      ),



                    ]
                ),
              ),


            ),
            //Sleep stats
            SizedBox(height: 20,),
            // add today date here
            Container( //use for date
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFF1F2633),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:   Text(
                  '${getDay(now.weekday)}, ${now.day} ${getMonth(now.month)} ',
                  style: TextStyle(

                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,

                  ),
                ),
              ),


            ),
            SizedBox(height: 15,),


            Row(
              children: [
                Text(
                  "Sleep Quote",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,


                  ),

                ),



              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15),

                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 20,
                    color: color.AppColor.gradientSecond.withOpacity(0.2),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 20,right: 10,bottom: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "'I have never taken any exercise except sleeping and resting.'",
                        style: TextStyle(
                          fontSize: 15,
                          color: color.AppColor.homePageContainerTextSmall,
                        ),
                      ),
                      SizedBox(height: 12,),

                      Text(
                        "Mark Twain",
                        style: TextStyle(
                          fontSize: 12,
                          color: color.AppColor.homePageContainerTextSmall,
                        ),
                      ),




                    ]
                ),



              ),


            ),
          ],
        ),



      ),
    );

  }
}

