import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practic/adistionalinfo.dart';
import 'package:practic/api_key.dart';
import 'werther.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  void initState() {
    super.initState();
    // weatherapi();
  }

  Future weatherapi() async {
    try {
      String cityName = 'london';

      final ref = await http.get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/weather?q=$cityName,uk&APPID=$apikey'),
      );
      final data = jsonDecode(ref.body);
      if (data['cod' != '200']) {
        throw data['massage'];
      }
      return data;
    } catch (e) {
      // throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: weatherapi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                'rt °F',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Icon(
                                Icons.cloud,
                                size: 64,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Rain',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Weather Forcast',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Werther(
                        date1: '21:23',
                        icon: Icons.cloud,
                        label: '45',
                      ),
                      Werther(
                        date1: '5:23',
                        icon: Icons.sunny,
                        label: '40',
                      ),
                      Werther(
                        date1: '21:23',
                        icon: Icons.cloud,
                        label: '45',
                      ),
                      Werther(
                        date1: '17:08',
                        icon: Icons.sunny,
                        label: '40',
                      ),
                      Werther(
                        date1: '21:23',
                        icon: Icons.cloud,
                        label: '45',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Aditional Information',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Adistionalinfo(
                      icon: Icons.water_drop,
                      lable: 'Humility',
                      value: '90',
                    ),
                    Adistionalinfo(
                      icon: Icons.air_outlined,
                      lable: 'Air',
                      value: '76',
                    ),
                    Adistionalinfo(
                      icon: Icons.cabin,
                      lable: 'Umbrela',
                      value: '90',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
