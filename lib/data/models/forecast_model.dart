import 'dart:async';
import 'dart:convert';

import 'package:clima/services/hgbrasil.dart';
import 'package:clima/services/mock/hgbrasil.dart';

class Forecast {
  final String date;
  final String weekday;
  final int max;
  final int min;
  final int cloudiness;
  final int rain;
  final int rainProbability;
  final String windSpeedy;
  final String description;
  final String condition;

  Forecast({
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

  static List<Forecast> fetchForecast() {
    List<Forecast> forecasts = [];
    // response['results']['forecast'].map((forecast) {
    //   return Forecast.fromJson(forecast);
    // }).toList();

    return forecasts;
  }

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: json['date'],
      weekday: json['weekday'],
      max: json['max'],
      min: json['min'],
      cloudiness: json['cloudiness'],
      rain: json['rain'],
      rainProbability: json['rain_probability'],
      windSpeedy: json['wind_speedy'],
      description: json['description'],
      condition: json['condition'],
    );
  }
}
