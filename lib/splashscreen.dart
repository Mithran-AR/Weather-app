import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myweatherapp/homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _initialdata();
  }

  Future<void> _initialdata() async {
    await Future.delayed(Duration(seconds: 2));
    getdata();
    await Future.delayed(Duration(seconds: 2));
    getimages();
    await Future.delayed(Duration(seconds: 1));
    Get.to(Homepage());
  }

  Future<void> getdata() async {
    print("Fetching district weather data...");
  }

  Future<void> getimages() async {
    print("Loading district visuals...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/newani.json.json'),
            SizedBox(height: 20),
            Text(
              "WeatherScope",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Stay Ahead with accurate weather updates!\nfor your selected district.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
