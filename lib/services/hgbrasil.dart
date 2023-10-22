import 'dart:async';
import 'dart:convert';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HgBrasil {
  final token = '4d5fcf14';
  final url = 'https://api.hgbrasil.com';

  Future<Map<String, dynamic>> getWeather(String woeid) async {
    final response =
        await http.get(Uri.parse('$url/weather?woeid=$woeid&key=$token'));

    return json.decode(response.body);
  }

  Future<String> getIconSVG(String condition) async {
    final response =
        await http.get(Uri.parse('$url/weather/conditions/$condition.svg'));

    return response.body;
  }
}
