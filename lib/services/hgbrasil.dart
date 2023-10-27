import 'dart:convert';

import 'package:clima/data/models/weather_model.dart';
import 'package:clima/services/http_client.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class HgBrasil {
  final HttpClient httpClient;

  final String username = 'admin';
  final String password = 'admin';

  final url = '192.168.1.14:3000';

  final cache = DefaultCacheManager();

  HgBrasil({required this.httpClient});

  Future<WeatherModel> getWeather({String? woeid, String? cityName}) async {
    final params = {
      'woeid': woeid,
      'city_name': cityName ?? 'São Paulo',
    };

    final uri = Uri.http(url, "/weather", params);

    try {
      final String basicAuth =
          'Basic ${base64Encode(utf8.encode('$username:$password'))}';

      final response = await httpClient.get(
        uri: uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        cache.putFile(uri.toString(), response.bodyBytes);

        return WeatherModel.fromJson(body['results']);
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (UnknownHostException) {
      return getCacheInfo(uri.toString());
    }
  }

  Future<WeatherModel> getCacheInfo(String endpoint) {
    return cache.getSingleFile(endpoint).then((file) {
      final body = jsonDecode(file.readAsStringSync());

      return WeatherModel.fromJson(body['results']);
    });
  }
}
