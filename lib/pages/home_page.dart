import 'package:clima/components/forecast_dailies_components.dart';
import 'package:clima/data/models/weather_model.dart';
import 'package:clima/services/hgbrasil.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/http_client.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<WeatherModel> weather =
      HgBrasil(httpClient: HttpClient()).getWeather('455827');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: SafeArea(
        child: FutureBuilder<WeatherModel>(
          future: weather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return ForecastDailiesComponents(forecasts: snapshot.data!);
              return Column(
                children: [
                  Informations(weather: snapshot.data!),
                  ButtonsNav(),
                  ForecastDailiesComponents(
                      forecasts: snapshot.data!.forecasts),
                ],
              );
            } else {
              return Text("Erro");
            }
          },
        ),
      ),
    );
  }
}

class Informations extends StatelessWidget {
  final WeatherModel weather;

  const Informations({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LocalTime(
            city: weather.city,
            date: weather.date,
          ),
          Weather(
            temp: weather.temp,
            description: weather.description,
          ),
        ],
      ),
    );
  }
}

class LocalTime extends StatelessWidget {
  final String city;
  final String date;

  const LocalTime({
    super.key,
    required this.city,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            city,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue[50],
            ),
          ),
          Text(
            date,
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
  final int temp;
  final String description;

  const Weather({
    super.key,
    required this.temp,
    required this.description,
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
              '$temp°',
              style: TextStyle(
                fontSize: 75,
                color: Colors.blue[50],
              ),
            ),
          ],
        ),
        Text(description,
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
