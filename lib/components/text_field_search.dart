import 'package:clima/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            onSubmitted: (String value) async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('cityName', value);

              // cache.putFile('api_response', http.Response('{"message": "Hello, World!"}', 200));

              return Future<void>(
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(
                      title: 'Weather App',
                      cityName: value,
                    ),
                  ),
                ),
              );
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cidade',
              hintText: 'Digite o nome da cidade',
              icon: Icon(Icons.location_city),
            ),
          ),
        ),
      ),
    );
  }
}
