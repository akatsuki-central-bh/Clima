import 'package:clima/data/http/exceptions.dart';
import 'package:clima/data/models/forecast_model.dart';
import 'package:clima/data/repositories/forecast_respository.dart';
import 'package:flutter/material.dart';

class ForecastStore {
  final IForecastRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<List<Forecast>> state = ValueNotifier<List<Forecast>>([]);

  final ValueNotifier<String> error = ValueNotifier('');

  ForecastStore({required this.repository});

  Future<void> getWeather(String woeid) async {
    isLoading.value = true;

    try {
      final result = await repository.getWeather(woeid);

      state.value = result;
    } on NotFountException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
