import 'package:flutter/material.dart';

AppBar buildAppBar({
  required String appBarTitle,
  bool? centerTitle,
  List<Widget>? actionWidgets,
}) =>
    AppBar(
      title: const Text(
        'Focused Menu',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.green,
      elevation: 0.5,
    );
