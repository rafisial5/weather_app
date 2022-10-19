import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/weather_screen.dart';
import 'bindings.dart';
import 'constants.dart';

class RouteManagement{
  static List<GetPage> getPages(){
    return [
      GetPage(
          name: kWeatherScreen,
          page: () =>  const WeatherScreen(),
          binding: ScreenBindings()),
    ];
  }
}