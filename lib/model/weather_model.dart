import 'dart:core';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

class WeatherModel{
  RxString imageUrl = 'http://openweathermap.org/img/w/01d.png'.obs;
  RxString city = 'Jamshoro'.obs;
  RxString weather = ''.obs;
  RxString weatherDescription = ''.obs;
  RxString iconData = ''.obs;
  RxDouble temp = 0.0.obs;
  RxDouble maxTemp = 0.0.obs;
  RxDouble minTemp = 0.0.obs;
  RxDouble feelsLike = 0.0.obs;
  RxInt pressure = 0.obs;
  RxInt humidity = 0.obs;
  RxDouble windSpeed = 0.0.obs;
  WeatherModel.empty();

  WeatherModel(
      this.imageUrl,
      this.city,
      this.weather,
      this.weatherDescription,
      this.iconData,
      this.temp,
      this.maxTemp,
      this.minTemp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.windSpeed);

  WeatherModel.fromServices(Map<dynamic, dynamic> responseBody) {

    weather.value = responseBody['weather'][0]['main'];
    weatherDescription.value = responseBody['weather'][0]['description'];
    iconData.value = (responseBody['weather'][0]['icon']) as String;
    imageUrl.value = 'http://openweathermap.org/img/w/$iconData.png';
    temp.value = responseBody['main']['temp'];
    minTemp.value = responseBody['main']['temp_min'];
    maxTemp.value = responseBody['main']['temp_max'];
    feelsLike.value = responseBody['main']['feels_like'];
    pressure.value = responseBody['main']['pressure'];
    pressure.value = pressure.value.round();
    humidity.value = responseBody['main']['humidity'];
    humidity.value = humidity.value.round();
    windSpeed.value = responseBody['wind']['speed'];
  }
}