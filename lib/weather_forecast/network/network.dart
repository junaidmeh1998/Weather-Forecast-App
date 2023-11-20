import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast(
      {required String cityName}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&cnt=7&appid=${Util.appId}&units=imperial";

    final response = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.parse(finalUrl)}");

    if (response.statusCode == 200) {
      print("Weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
