import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformFlatButton extends StatelessWidget {
  final Function? handler;
  final Widget buttonChild;
  final Color color;

  PlatformFlatButton({
    required this.buttonChild,
    required this.color,
    required this.handler,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
      child: buttonChild,
      color: color,
      onPressed: handler as void Function()?,
      borderRadius: BorderRadius.circular(15.0),
    )
        : ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: handler as void Function()?,
      child: buttonChild,
    );
  }
}
