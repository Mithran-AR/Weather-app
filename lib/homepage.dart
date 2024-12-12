import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myweatherapp/weathercontroler.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final weatherCtrl = Get.put(Weathercontroler());

  @override
  void initState() {
    super.initState();
    weatherCtrl.getdata(weatherCtrl.selectdistrict.value);
  }

  Widget buildWeatherInfo(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Weather Scope",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffD5E1DD),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (value) {
                      weatherCtrl.selectdistrict.value = value;
                      weatherCtrl.getdata(weatherCtrl.selectdistrict.value);
                    },
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontFamily: "Sen",
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xff8A8A8A),
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Lottie.asset('assets/newani.json.json'),
              ),
              const SizedBox(height: 20),
              Obx(() => buildWeatherInfo("City:", weatherCtrl.name.toString(), Icons.location_city)),
              Obx(() => buildWeatherInfo("Wind Speed:", weatherCtrl.windSpeed.toString(), Icons.air)),
              Obx(() => buildWeatherInfo("Sunset:", weatherCtrl.sunSet.toString(), Icons.wb_sunny_sharp)),
              Obx(() => buildWeatherInfo("Sunrise:", weatherCtrl.sunRise.toString(), Icons.wb_sunny)),
            ],
          ),
        ),
      ),
    );
  }
}
