import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForecastComponent extends StatelessWidget {
  final String date;
  final String weekday;
  final int max;
  final int min;
  final num cloudiness;
  final num rain;
  final int rainProbability;
  final String windSpeedy;
  final String description;
  final String condition;

  const ForecastComponent({
    super.key,
    required this.date,
    required this.weekday,
    required this.max,
    required this.min,
    required this.cloudiness,
    required this.rain,
    required this.rainProbability,
    required this.windSpeedy,
    required this.description,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$date - $weekday", style: TextStyle(color: Colors.blue[50])),
          Column(children: [
            SvgPicture.asset(
              'lib/assets/images/$condition.svg',
              height: 50,
              width: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.water_drop,
                  size: 20,
                  color: Colors.blue[50],
                ),
                Text(
                  "$rainProbability%",
                  style: TextStyle(color: Colors.blue[50]),
                ),
              ],
            ),
          ]),
          Text("max: $max°\nmin: $min°",
              style: TextStyle(color: Colors.blue[50])),
        ],
      ),
    );
  }
}
