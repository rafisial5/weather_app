import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherService{
  RxString url = ''.obs;
  WeatherModel weatherModel = WeatherModel.empty();
  Map<dynamic, dynamic> responseBody = {};

  Future<Map> getWeatherInfo(String city) async {
    url.value =
    'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=732ad1f765066610bc14b00578ef46dd&units=metric';
    http.Response response = await http.get(Uri.parse(url.value));
    responseBody = jsonDecode(response.body);
    return responseBody;

  }
}