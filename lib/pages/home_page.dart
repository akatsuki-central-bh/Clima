import 'package:clima/components/forecast_dailies_components.dart';
import 'package:clima/models/forecast_model.dart';
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
  final forecasts = HgBrasil(httpClient: HttpClient()).getWeather('455827');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: SafeArea(
        child: Column(
          children: [
            Informations(),
            ButtonsNav(),
            FutureBuilder<List<ForecastModel>>(
              future: forecasts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ForecastDailiesComponents(forecasts: snapshot.data!);
                } else {
                  return Text("Erro");
                }
              },
            ),
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
