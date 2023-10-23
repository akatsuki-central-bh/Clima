import 'dart:convert';

import 'package:clima/data/models/weather_model.dart';
import 'package:clima/services/http_client.dart';

class HgBrasil {
  final IHttpClient httpClient;

  final token = '4d5fcf14';
  final url = 'https://api.hgbrasil.com';

  HgBrasil({required this.httpClient});

  Future<WeatherModel> getWeather(String woeid) async {
    final response = await httpClient.get(
      url: "$url/weather?woeid=$woeid&key=$token",
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return WeatherModel.fromJson(body['results']);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
