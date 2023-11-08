import 'package:flutter/material.dart';
import 'package:app_login_page/helpers/platform_slider.dart';

class UserSlider extends StatelessWidget {
  final ValueChanged<double> onChanged;
  final int howManyWeeks;

  UserSlider(this.onChanged, this.howManyWeeks);

  @override
  Widget build(BuildContext context) {
    return Slider(
      divisions: 32,
      min: 1,
      max: 31,
      value: howManyWeeks.toDouble(),
      activeColor: Theme.of(context).primaryColor,
      onChanged: onChanged,
    );
  }
}
