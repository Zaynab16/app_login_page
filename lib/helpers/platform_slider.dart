import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PlatformSlider extends StatelessWidget {
  final int min, max, divisions, value;
  final ValueChanged<double> handler;
  final Color color;

  PlatformSlider({
    required this.value,
    required this.handler,
    required this.color,
    required this.max,
    required this.min,
    required this.divisions,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSlider(
            onChanged: (value) => handler(value),
            max: max.toDouble(),
            min: min.toDouble(),
            divisions: divisions,
            activeColor: CupertinoTheme.of(context).primaryColor,
            value: value.toDouble(),
          )
        : Slider(
            value: value.toDouble(),
            onChanged: handler,
            max: max.toDouble(),
            min: min.toDouble(),
            divisions: divisions,
            activeColor: color,
          );
  }
}
