import 'dart:convert';

import 'package:clima/data/models/weather_model.dart';
import 'package:clima/services/http_client.dart';

class HgBrasil {
  final HttpClient httpClient;

  final String username = 'admin';
  final String password = 'admin';

  final url = 'http://192.168.1.14:3000';

  HgBrasil({required this.httpClient});

  Future<WeatherModel> getWeather(String woeid) async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await httpClient.get(
      url: "$url/weather?woeid=$woeid&test=true",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return WeatherModel.fromJson(body['results']);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
