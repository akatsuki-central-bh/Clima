import 'package:clima/components/forecast_component.dart';
import 'package:clima/data/models/forecast_model.dart';
import 'package:flutter/material.dart';

class ForecastDailiesComponents extends StatelessWidget {
  late List<ForecastModel> forecasts;

  ForecastDailiesComponents({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[300],
          border: Border.all(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: forecasts.map((forecast) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ForecastComponent(
                        date: forecast.date,
                        weekday: forecast.weekday,
                        max: forecast.max,
                        min: forecast.min,
                        cloudiness: forecast.cloudiness,
                        rain: forecast.rain,
                        rainProbability: forecast.rainProbability,
                        windSpeedy: forecast.windSpeedy,
                        description: forecast.description,
                        condition: forecast.condition,
                      ));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
