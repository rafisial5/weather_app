import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';

class ScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController());
  }

}