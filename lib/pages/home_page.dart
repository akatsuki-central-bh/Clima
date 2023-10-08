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
              height: 200,
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
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(time, style: TextStyle(color: Colors.blue[50])),
          Column(children: [
            Icon(
              icon,
              size: 50,
              color: Colors.blue[50],
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
                  humidity,
                  style: TextStyle(color: Colors.blue[50]),
                ),
              ],
            ),
          ]),
          Text(temperature, style: TextStyle(color: Colors.blue[50])),
        ],
      ),
    );
  }
}
