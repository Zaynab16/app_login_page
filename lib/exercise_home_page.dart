import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:app_login_page/Exercise/exercise_video_info.dart';
import 'package:app_login_page/Exercise/exercise_colors.dart' as color;


class ExerciseHomePage extends StatefulWidget {
  const ExerciseHomePage({Key? key}) : super(key: key);

  @override
  _ExerciseHomePageState createState() => _ExerciseHomePageState();
}

class _ExerciseHomePageState extends State<ExerciseHomePage> {
  List<Info> info = [];
  _initData() async {
    var res = await DefaultAssetBundle.of(context).loadString("json/info.json");
    var resInfo = json.decode(res);
    setState(() {
      info = List<Info>.from(resInfo.map((x) => Info.fromJson(x)));
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: color.ExerciseColor.homePageBackground,
      body: CustomScrollView(slivers: [
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.h,
              horizontal: 30.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.only(top: 30.h),
              child: Row(

                children: [

                  Text(
                    "Workout Plan",
                    style: TextStyle(
                        fontSize: 30,
                        color: color.ExerciseColor.homePageTitle,
                        fontWeight: FontWeight.w700),
                  ),





                ],
              ),
            ))),
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
              horizontal: 30.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Row(
              children: [
                Text(
                  "Start your workout",
                  style: TextStyle(
                      fontSize: 20,
                      color: color.ExerciseColor.homePageSubtitle,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                InkWell(
                    onTap: () {
                      Get.to(() => ExerciseVideoInfo());
                    },
                    child: Row(
                      children: [
                        Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 20,
                            color: color.ExerciseColor.homePageDetail,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.arrow_forward,
                            size: 20, color: color.ExerciseColor.homePageIcons)
                      ],
                    ))
              ],
            ))),
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.w,
              horizontal: 30.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    color.ExerciseColor.gradientFirst.withOpacity(0.8),
                    color.ExerciseColor.gradientSecond.withOpacity(0.9),
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: color.ExerciseColor.gradientSecond.withOpacity(0.2))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start with",
                      style: TextStyle(
                          fontSize: 16,
                          color: color.ExerciseColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Cardio",
                      style: TextStyle(
                          fontSize: 25,
                          color: color.ExerciseColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "and Whole Body Workout",
                      style: TextStyle(
                          fontSize: 25,
                          color: color.ExerciseColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer,
                                size: 20,
                                color:
                                    color.ExerciseColor.homePageContainerTextSmall),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: color
                                      .ExerciseColor.homePageContainerTextSmall),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.ExerciseColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))),
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.w,
              horizontal: 30.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/bg4.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: Offset(8, 10),
                              color: color.ExerciseColor.gradientSecond
                                  .withOpacity(0.3)),
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(-1, -5),
                              color: color.ExerciseColor.gradientSecond
                                  .withOpacity(0.3))
                        ]),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 200, bottom: 30),
                    decoration: BoxDecoration(
                      // color:Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/runn2.png"),
                        //fit:BoxFit.fill
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's actions are tomorrow's results",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: color.ExerciseColor.gradientFirst),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "A workout is all the therapy you need",
                                style: TextStyle(
                                  color: color.ExerciseColor.homePageSubtitle,
                                  fontSize: 15,
                                )
                              ))
                      ],
                    ),
                  )
                ],
              ),
            ))),
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.w,
              horizontal: 30.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              child: Text(
                "Body Parts To Work On :",
                //textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.ExerciseColor.homePageTitle),
              ),
            ))),
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
              horizontal: 30.w,
            ),
            sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.6,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      height: 170.h,
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(info.elementAt(index).img ?? ""),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: color.ExerciseColor.gradientSecond
                                    .withOpacity(0.1)),
                            BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: color.ExerciseColor.gradientSecond
                                    .withOpacity(0.1))
                          ]),
                      child: Center(
                        child: Align(
                          child: Text(info.elementAt(index).title ?? "",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: color.ExerciseColor.homePageDetail)),
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    );
                  },
                  childCount: info.length,
                ))),
      ]),
    ));
  }
}

class Info {
  String? title;
  String? img;

  Info({
    this.title,
    this.img,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        title: json["title"],
        img: json["img"],
      );
}
