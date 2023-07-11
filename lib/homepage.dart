import 'dart:convert';
import 'dart:developer';

import 'package:codey_weather/colors.dart';
import 'package:codey_weather/model/weather_model.dart';
import 'package:codey_weather/widgets/dailycontainer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePgae extends StatefulWidget {
  const HomePgae({super.key});

  @override
  State<HomePgae> createState() => _HomePgaeState();
}

class _HomePgaeState extends State<HomePgae> {
  WeatherModel? weatherData;
  LocationModel? locationData;

  Future<void> fetchApiData() async {
    const apiKey = '13c0af8543d14497a25143839230707';
    const cityName = 'Kathmandu';
    const url =
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName';

    try {
      var response = await http.get(Uri.parse(url));

      final jsondata = jsonDecode(response.body);

      setState(() {
        weatherData = WeatherModel.fromJson(jsondata['current']);
        locationData = LocationModel.fromJson(jsondata["location"]);
      });

      log(jsondata.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    fetchApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Codeyy Weather',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 255, 255),
                fontSize: 32,
                fontFamily: 'Monomaniac One',
                fontWeight: FontWeight.w700,
              ),
            ),
            Center(
                child: Text(
              // 'San Diego',
              "${locationData!.name.toString()},${locationData!.country.toString()}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Circular Std',
                fontWeight: FontWeight.w400,
              ),
            )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Current Location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Circular Std',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 135,
                  height: 130,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/1163/1163661.png?w=826&t=st=1688715544~exp=1688716144~hmac=dbee39204b8f1b984eb5c95f3aefd66e95f7ec50163802bb70551da115957a29"),
                      // "https${weatherData!.condition.icon.toString()}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  '${weatherData!.temperatureCelsius}\u1d52',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 100.71,
                    fontFamily: 'Circular Std',
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
            Text(
              '${weatherData!.condition.text}  -  ${weatherData!.feelsLikeCelsius}\u1d52',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Circular Std',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Last Updated  -  ${weatherData!.lastUpdated}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 206, 206, 206),
                fontSize: 14,
                fontFamily: 'Circular Std',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 97,
                    height: 42,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.10000000149011612),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      'Daily',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Circular Std',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 111,
                    height: 42,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    decoration: ShapeDecoration(
                      color: Colors.black.withOpacity(0.10000000149011612),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      'Weekly',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Circular Std',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  daily(context, "Now", "13"),
                  daily(context, "Now", "13"),
                  daily(context, "Now", "13"),
                  daily(context, "Now", "13"),
                  daily(context, "Now", "13"),
                  daily(context, "Now", "13"),
                  daily(context, "Now", "13"),
                ],
              ),
            ),
            Container(
              width: 318,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              margin: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.26, -0.97),
                  end: const Alignment(-0.26, 0.97),
                  colors: [
                    const Color.fromARGB(255, 180, 180, 180),
                    Colors.white.withOpacity(0)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 5,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Color.fromARGB(127, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn-icons-png.flaticon.com/512/1163/1163661.png?w=826&t=st=1688715544~exp=1688716144~hmac=dbee39204b8f1b984eb5c95f3aefd66e95f7ec50163802bb70551da115957a29"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: const Stack(children: []),
                  ),
                  const SizedBox(width: 24),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sunset',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '5:51',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Circular Std',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'PM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Circular Std',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 32),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Sunrise',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '7:00',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Circular Std',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'AM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Circular Std',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.50,
              child: Container(
                width: 320,
                height: 90,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                margin: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(bottom: 16),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.26, -0.97),
                    end: const Alignment(-0.26, 0.97),
                    colors: [Colors.white, Colors.white.withOpacity(0)],
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 5,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color.fromARGB(207, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/1163/1163661.png?w=826&t=st=1688715544~exp=1688716144~hmac=dbee39204b8f1b984eb5c95f3aefd66e95f7ec50163802bb70551da115957a29"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Stack(children: []),
                    ),
                    const SizedBox(width: 32),
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UV Index',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '1 Low',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
