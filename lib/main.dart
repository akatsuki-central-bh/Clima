import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: (const Column(
            children: [
              Weather(),
              LocalTime(),
            ],
          ))),
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
        Text('22 graus', style: TextStyle(fontSize: 40)),
        Text('27/20 graus sensação de 24 graus',
            style: TextStyle(fontSize: 12)),
        Text('predominante nublado', style: TextStyle(fontSize: 12)),
      ],
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
          Text('Franco da Rocha',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          Text('Segunda-feira, 20 de setembro de 2021',
              style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
