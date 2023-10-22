import 'dart:async';

import 'package:clima/data/http/http_client.dart';
import 'package:clima/data/models/forecast_model.dart';
import 'package:clima/data/repositories/forecast_respository.dart';
import 'package:clima/pages/stores/forecast_store.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ForecastStore store = ForecastStore(
    repository: ForecastRepository(
      httpClient: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();

    store.getWeather('455861');
  }

  @override
  Widget build(BuildContext context) {
    // FutureOr<List<Forecast>> forecasts = Forecast.fetchForecast();

    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: SafeArea(
        child: Column(
          children: [
            Informations(),
            ButtonsNav(),
            DayList(forecasts: forecasts),
          ],
        ),
      ),
    );
  }
}

class Informations extends StatelessWidget {
  const Informations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LocalTime(),
          Weather(),
        ],
      ),
    );
  }
}

class LocalTime extends StatelessWidget {
  const LocalTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Franco da Rocha',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue[50],
            ),
          ),
          Text(
            'Segunda-feira, 20 de setembro de 2021',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[50],
            ),
          ),
        ],
      ),
    );
  }
}

class Weather extends StatelessWidget {
  const Weather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud,
              size: 50,
              color: Colors.blue[50],
            ),
            Text(
              '22°',
              style: TextStyle(
                fontSize: 75,
                color: Colors.blue[50],
              ),
            ),
          ],
        ),
        Text('27/20° sensação de 24°',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[50],
            )),
        Text('predominante nublado',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[50],
            )),
      ],
    );
  }
}

class ButtonsNav extends StatelessWidget {
  const ButtonsNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.menu,
              color: Colors.blue[50],
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.add,
              color: Colors.blue[50],
            ),
          ),
        ],
      ),
    );
  }
}

class DayList extends StatelessWidget {
  final FutureOr<List<Forecast>> forecasts;

  const DayList({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Dias',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[50],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue[300],
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // children: forecasts
                    //     .map(
                    //       (forecast) => Hourly(
                    //         date: forecast.date,
                    //         weekday: forecast.weekday,
                    //         max: forecast.max,
                    //         min: forecast.min,
                    //         cloudiness: forecast.cloudiness,
                    //         rain: forecast.rain,
                    //         rainProbability: forecast.rainProbability,
                    //         windSpeedy: forecast.windSpeedy,
                    //         description: forecast.description,
                    //         condition: forecast.condition,
                    //       ),
                    //     )
                    //     .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Hourly extends StatelessWidget {
  const Hourly({
    super.key,
    // required this.time,
    // required this.icon,
    // required this.humidity,
    // required this.temperature,

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

  // final String time;
  // final IconData icon;
  // final String humidity;
  // final String temperature;

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

  @override
  Widget build(BuildContext context) {
    // final String icon =
    //     HgBrasil().getIconSVG(condition).then((value) => value) as String;

    return Container(
      width: 100,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(date, style: TextStyle(color: Colors.blue[50])),
          Column(children: [
            // icon svg

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.water_drop,
                  size: 20,
                  color: Colors.blue[50],
                ),
              ],
            ),
          ]),
          Text(
            min.toString(),
            style: TextStyle(color: Colors.blue[50]),
          ),
          Text(
            max.toString(),
            style: TextStyle(color: Colors.blue[50]),
          ),
        ],
      ),
    );
  }
}
