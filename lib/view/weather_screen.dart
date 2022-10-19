
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/weather_controller.dart';


class WeatherScreen extends GetView<WeatherController> {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Weather"),
        ),
              body: RefreshIndicator(
                onRefresh: () => controller.refreshData(),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://tse4.mm.bing.net/th?id=OIP.4UaMrVqOjG6aKmmFZmH6PgHaNL&pid=Api&P=0",
                          ),
                          fit: BoxFit.cover,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Autocomplete(

                            optionsBuilder: (TextEditingValue textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              } else {
                                List<String> matches = <String>[];
                                matches.addAll(controller.suggestions);
                                matches.retainWhere((s) {
                                  return s.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase());
                                });
                                return matches;
                              }
                            },
                            onSelected: (String selection) {
                              controller.cityName.text = selection;
                            },
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController cityName,
                                FocusNode focusNode,
                                VoidCallback onFieldSubmitted) {
                              controller.cityName = cityName;
                              return
                                TextField(
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  controller: controller.cityName,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintText: "Enter city name",
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                  ),
                                  focusNode: focusNode,
                                  onSubmitted: (String value) {
                                    //city = cityName.text;
                                  },
                                );

                            },
                          ),
                          const SizedBox(height: 15),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize:  const Size.fromHeight(55),
                              ),
                              onPressed: (){
                                controller.getCity();
                              } ,
                              child: const Text(
                                'search',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              )),
                          const SizedBox(height: 30),
                          Obx(
                                () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'min ${controller.minTemp}°',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'max ${controller.maxTemp}°',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${controller.temp.toString().substring(0, 2)}°',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 80,
                                  ),
                                ),
                                Image.network(controller.imageUrl.value),
                              ],
                            ),
                          ),
                          Obx(
                                () => Text(
                              controller.city.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF82B1FF)
                                        .withOpacity(0.3), //color of shadow
                                    spreadRadius: 5, //spread radius
                                    blurRadius: 7, // blur radius
                                    offset: const Offset(0, 2),
                                  )
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Weather Info",
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children:  [
                                          weatherText("Weather:"),
                                          weatherText("Description:"),
                                          weatherText("Temperature:"),
                                          weatherText("Feels Like:"),
                                          weatherText("Pressure:"),
                                          weatherText("Humidity:"),
                                          weatherText("Weather:"),
                                          weatherText("Wind Speed:"),
                                        ],
                                      ),
                                      Obx(
                                            () => Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            weatherValuesText(controller.weather.value),
                                            weatherValuesText(controller.weatherDescription.value),
                                            weatherValuesText('${controller.temp.toString().substring(0, 2)}°'),
                                            weatherValuesText(controller.feelsLike.toString()),
                                            weatherValuesText(controller.pressure.toString()),
                                            weatherValuesText(controller.humidity.toString()),
                                            weatherValuesText("${controller.windSpeed} Km/h"),


                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        );

  }

  Widget weatherValuesText(String value){
    return
      Text(
        value,
        style: const TextStyle(
          color: Colors.indigo,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
  }
  Widget weatherText(String value){
    return
      Text(
        value,
        style: const TextStyle(
          color: Colors.blueGrey,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
  }
}
