import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/bindings.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/route_management.dart';

void main() {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: kWeatherScreen,
        initialBinding: ScreenBindings(),
        getPages: RouteManagement.getPages(),
      ));
}
