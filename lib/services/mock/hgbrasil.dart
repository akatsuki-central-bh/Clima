class HgBrasilMock {
  Future<Map<String, dynamic>> getWeather(String woeid) async {
    return await {
      "by": "woeid",
      "valid_key": true,
      "results": {
        "temp": 16,
        "date": "20/10/2023",
        "time": "22:07",
        "condition_code": "28",
        "description": "Tempo nublado",
        "currently": "noite",
        "cid": "",
        "city": "São Paulo, SP",
        "img_id": "28n",
        "humidity": 96,
        "cloudiness": 75,
        "rain": 0,
        "wind_speedy": "4.12 km/h",
        "wind_direction": 140,
        "wind_cardinal": "SE",
        "sunrise": "05:29 am",
        "sunset": "06:13 pm",
        "moon_phase": "waxing_crescent",
        "condition_slug": "cloudly_night",
        "city_name": "São Paulo",
        "timezone": "-03:00",
        "forecast": [
          {
            "date": "20/10",
            "weekday": "Sex",
            "max": 21,
            "min": 15,
            "cloudiness": 100,
            "rain": 0,
            "rain_probability": 24,
            "wind_speedy": "4.47 km/h",
            "description": "Tempo nublado",
            "condition": "cloudly_day"
          },
          {
            "date": "21/10",
            "weekday": "Sáb",
            "max": 23,
            "min": 16,
            "cloudiness": 61,
            "rain": 0,
            "rain_probability": 31,
            "wind_speedy": "4.93 km/h",
            "description": "Tempo nublado",
            "condition": "cloudly_day"
          },
          {
            "date": "22/10",
            "weekday": "Dom",
            "max": 28,
            "min": 16,
            "cloudiness": 1,
            "rain": 0,
            "rain_probability": 15,
            "wind_speedy": "4.05 km/h",
            "description": "Tempo limpo",
            "condition": "clear_day"
          },
          {
            "date": "23/10",
            "weekday": "Seg",
            "max": 32,
            "min": 17,
            "cloudiness": 42,
            "rain": 0,
            "rain_probability": 0,
            "wind_speedy": "4.54 km/h",
            "description": "Parcialmente nublado",
            "condition": "cloud"
          },
          {
            "date": "24/10",
            "weekday": "Ter",
            "max": 31,
            "min": 19,
            "cloudiness": 100,
            "rain": 0.96,
            "rain_probability": 73,
            "wind_speedy": "3.76 km/h",
            "description": "Chuvas esparsas",
            "condition": "rain"
          },
          {
            "date": "25/10",
            "weekday": "Qua",
            "max": 30,
            "min": 20,
            "cloudiness": 1,
            "rain": 0.42,
            "rain_probability": 49,
            "wind_speedy": "3.98 km/h",
            "description": "Chuvas esparsas",
            "condition": "rain"
          },
          {
            "date": "26/10",
            "weekday": "Qui",
            "max": 30,
            "min": 19,
            "cloudiness": 27,
            "rain": 17.03,
            "rain_probability": 100,
            "wind_speedy": "4.23 km/h",
            "description": "Chuva",
            "condition": "rain"
          },
          {
            "date": "27/10",
            "weekday": "Sex",
            "max": 21,
            "min": 17,
            "cloudiness": 100,
            "rain": 55.85,
            "rain_probability": 100,
            "wind_speedy": "3.45 km/h",
            "description": "Chuva",
            "condition": "rain"
          },
          {
            "date": "28/10",
            "weekday": "Sáb",
            "max": 25,
            "min": 17,
            "cloudiness": 99,
            "rain": 23.45,
            "rain_probability": 100,
            "wind_speedy": "6.6 km/h",
            "description": "Chuva",
            "condition": "rain"
          },
          {
            "date": "29/10",
            "weekday": "Dom",
            "max": 22,
            "min": 18,
            "cloudiness": 100,
            "rain": 16.36,
            "rain_probability": 100,
            "wind_speedy": "8.37 km/h",
            "description": "Chuva",
            "condition": "rain"
          }
        ],
        "cref": "235ca2",
        "latitude": -23.5329,
        "longitude": -46.6395
      },
      "execution_time": 0,
      "from_cache": true
    };
  }
}
