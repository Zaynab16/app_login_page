import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:app_login_page/SleepCalculator/lib/time.dart';


class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.black,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(30, 95, 27, 232),
          2: Color.fromARGB(50, 95, 27, 232),
          3: Color.fromARGB(60, 95, 27, 232),
          4: Color.fromARGB(80, 95, 27, 232),
          5: Color.fromARGB(100, 95, 27, 232),
          6: Color.fromARGB(155, 95, 27, 232),
          7: Color.fromARGB(205, 95, 27, 232),
          8: Color.fromARGB(215, 95, 27, 232),
          9: Color.fromARGB(235, 95, 27, 232),
          10: Color.fromARGB(255, 95, 27, 232),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
