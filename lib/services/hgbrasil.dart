import 'dart:convert';

import 'package:clima/models/forecast_model.dart';
import 'package:clima/services/http_client.dart';

class HgBrasil {
  final IHttpClient httpClient;

  final token = '4d5fcf14';
  final url = 'https://api.hgbrasil.com';

  HgBrasil({required this.httpClient});

  Future<List<ForecastModel>> getWeather(String woeid) async {
    final response = await httpClient.get(
      url: "$url/weather?woeid=$woeid&key=$token",
    );

    if (response.statusCode == 200) {
      final List<ForecastModel> forecasts = [];

      final body = jsonDecode(response.body);

      body['results']['forecast'].map((forecast) {
        final forecastModel = ForecastModel.fromJson(forecast);

        forecasts.add(forecastModel);
      }).toList();

      return forecasts;

      // return body['results']['forecast'].map((forecast) {
      //   return ForecastModel.fromJson(forecast);
      // }).toList();
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
