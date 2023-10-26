import 'dart:convert';

import 'package:clima/data/models/weather_model.dart';
import 'package:clima/services/http_client.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class HgBrasil {
  final HttpClient httpClient;

  final String username = 'admin';
  final String password = 'admin';

  final url = 'http://192.168.1.14:3000';

  final cache = DefaultCacheManager();

  HgBrasil({required this.httpClient});

  Future<WeatherModel> getWeather(String woeid) async {
    final String urlEndpoint = "$url/weather?woeid=$woeid";

    try {
      final String basicAuth =
          'Basic ${base64Encode(utf8.encode('$username:$password'))}';

      final response = await httpClient.get(
        url: urlEndpoint,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        cache.putFile(urlEndpoint, response.bodyBytes);

        return WeatherModel.fromJson(body['results']);
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (UnknownHostException) {
      return getCacheInfo(urlEndpoint);
    }
  }

  Future<WeatherModel> getCacheInfo(String endpoint) {
    return cache.getSingleFile(endpoint).then((file) {
      final body = jsonDecode(file.readAsStringSync());

      return WeatherModel.fromJson(body['results']);
    });
  }
}
