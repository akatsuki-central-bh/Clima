import 'dart:convert';

import 'package:clima/data/http/exceptions.dart';
import 'package:clima/data/http/http_client.dart';
import 'package:clima/data/models/forecast_model.dart';

abstract class IForecastRepository {
  Future<List<Forecast>> getWeather(String woeid);
}

class ForecastRepository implements IForecastRepository {
  final IHttpClient httpClient;
  final token = '4d5fcf14';
  final url = 'https://api.hgbrasil.com';

  ForecastRepository({required this.httpClient});

  @override
  Future<List<Forecast>> getWeather(String woeid) async {
    final response = await httpClient.get(
      url: "$url/weather?woeid=$woeid&key=$token",
    );

    if (response.statusCode == 200) {
      final List<Forecast> forecasts = [];

      final body = jsonDecode(response.body);

      body['results']['forecast'].map((forecast) {
        final forecastModel = Forecast.fromJson(forecast);

        forecasts.add(forecastModel);
      }).toList();

      return forecasts;

      // return body['results']['forecast'].map((forecast) {
      //   return Forecast.fromJson(forecast);
      // }).toList();
    } else if (response.statusCode == 404) {
      throw NotFountException(message: 'Not found');
    } else {
      throw Exception('Unexpected error');
    }
  }
}
