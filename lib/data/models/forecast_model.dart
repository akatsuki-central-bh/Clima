class ForecastModel {
  final String date;
  final String weekday;
  final int max;
  final int min;
  final double cloudiness;
  final double rain;
  final int rainProbability;
  final String windSpeedy;
  final String description;
  final String condition;

  ForecastModel({
    required this.date,
    required this.weekday,
    required this.max,
    required this.min,
    required this.cloudiness,
    required this.rain,
    required this.rainProbability,
    required this.windSpeedy,
    required this.description,
    required this.condition,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json['date'],
      weekday: json['weekday'],
      max: json['max'],
      min: json['min'],
      cloudiness: json['cloudiness'],
      rain: json['rain'],
      rainProbability: json['rain_probability'],
      windSpeedy: json['wind_speedy'],
      description: json['description'],
      condition: json['condition'],
    );
  }
}
