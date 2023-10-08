import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: const SafeArea(
        child: Column(
          children: [
            Informations(),
            ButtonsNav(),
            DayList(),
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
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Franco da Rocha',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Segunda-feira, 20 de setembro de 2021',
            style: TextStyle(fontSize: 16),
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
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud,
              size: 100,
              color: Colors.white,
            ),
            Text(
              '22°',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
        Text('27/20° sensação de 24°', style: TextStyle(fontSize: 16)),
        Text('predominante nublado', style: TextStyle(fontSize: 16)),
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
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}

class DayList extends StatelessWidget {
  const DayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
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
              height: 250,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Hourly(
                    time: '12 p.m.',
                    icon: Icons.cloud,
                    humidity: '30%',
                    temperature: '22°',
                  ),
                  Hourly(
                    time: '12 p.m.',
                    icon: Icons.cloud,
                    humidity: '30%',
                    temperature: '22°',
                  ),
                  Hourly(
                    time: '12 p.m.',
                    icon: Icons.cloud,
                    humidity: '30%',
                    temperature: '22°',
                  ),
                  Hourly(
                    time: '12 p.m.',
                    icon: Icons.cloud,
                    humidity: '30%',
                    temperature: '22°',
                  ),
                  Hourly(
                    time: '12 p.m.',
                    icon: Icons.cloud,
                    humidity: '30%',
                    temperature: '22°',
                  ),
                  Hourly(
                    time: '12 p.m.',
                    icon: Icons.cloud,
                    humidity: '30%',
                    temperature: '22°',
                  ),
                  Hourly(
                    time: '12 p.m.',
                    icon: Icons.cloud,
                    humidity: '30%',
                    temperature: '22°',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Hourly extends StatelessWidget {
  const Hourly({
    super.key,
    required this.time,
    required this.icon,
    required this.humidity,
    required this.temperature,
  });

  final String time;
  final IconData icon;
  final String humidity;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 500,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(color: Colors.white)),
          Column(children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.water_drop,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  humidity,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ]),
          Text(temperature, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
