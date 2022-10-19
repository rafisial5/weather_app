

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/weather_model.dart';
import '../services/weather_services.dart';

class WeatherController extends GetxController{
  RxString imageUrl = 'http://openweathermap.org/img/w/01d.png'.obs;
  RxBool isLoading = false.obs;
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

  TextEditingController cityName = TextEditingController();
  WeatherService weatherService = WeatherService();
  Map<dynamic, dynamic> responseBody = {};

  List<String> suggestions = [
    "Karachi",
    "Lahore",
    "Islamabad",
    "Multan",
    "Okara",
    "Burewala",
    "Chiniot",
    "Hyderabad",
    "Jamshoro",
    "Kotri",
    "Gambat",
    "Saeedabad",
    "Tando Adam",
    "Dadu",
    "Moro",
    "Ranipur",
    "Sukkur",
    "Larkana",
    "Sewan",
  ];

  Future getData() async {
    responseBody = await weatherService.getWeatherInfo(city.value);
    WeatherModel weatherModel = WeatherModel.fromServices(responseBody);

    weather.value =  weatherModel.weather.value;
    weatherDescription.value =  weatherModel.weatherDescription.value;
    iconData.value = weatherModel.iconData.value;
    imageUrl.value = 'http://openweathermap.org/img/w/$iconData.png';
    temp.value = weatherModel.temp.value;
    minTemp.value = weatherModel.minTemp.value;
    maxTemp.value = weatherModel.maxTemp.value;
    feelsLike.value = weatherModel.feelsLike.value;
    pressure.value = weatherModel.pressure.value;
    pressure.value = pressure.value.round();
    humidity.value = weatherModel.humidity.value;
    humidity.value = humidity.value.round();
    windSpeed.value = weatherModel.windSpeed.value;
    cityName.text ="";
  }
  Future<void> refreshData() async {
    city.value = "Jamshoro";
    responseBody = await weatherService.getWeatherInfo(city.value);
    WeatherModel weatherModel = WeatherModel.fromServices(responseBody);

    weather.value =  weatherModel.weather.value;
    weatherDescription.value =  weatherModel.weatherDescription.value;
    iconData.value = weatherModel.iconData.value;
    imageUrl.value = 'http://openweathermap.org/img/w/$iconData.png';
    temp.value = weatherModel.temp.value;
    minTemp.value = weatherModel.minTemp.value;
    maxTemp.value = weatherModel.maxTemp.value;
    feelsLike.value = weatherModel.feelsLike.value;
    pressure.value = weatherModel.pressure.value;
    pressure.value = pressure.value.round();
    humidity.value = weatherModel.humidity.value;
    humidity.value = humidity.value.round();
    windSpeed.value = weatherModel.windSpeed.value;
    cityName.clear();
  }


  @override
  void onInit(){
    getData();
    weatherService.getWeatherInfo(city.value);
    super.onInit();
  }

  void getCity() {
    if (cityName.text.isNotEmpty) {
      city.value = cityName.text;
      cityName.text = "";
      getData();
    } else {}
  }
}