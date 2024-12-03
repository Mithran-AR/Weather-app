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

  final wetherCntrl=Get.put(Weathercontroler());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wetherCntrl.getdata(wetherCntrl.selectdistrict.value);
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: Text("Select District",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        centerTitle: true,
      ),
      body: Column(
        children: [

          Container(
              decoration: BoxDecoration(
                color: Color(0xffD5E1DD),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  onChanged: (value) {
                    wetherCntrl.selectdistrict.value=value;
                    wetherCntrl.getdata(wetherCntrl.selectdistrict.value);
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15), // ScreenUtil applied here
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontFamily: "Sen",
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 14), // ScreenUtil applied here
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xff8A8A8A),
                        size: 30, // ScreenUtil applied here
                      ),
                ),
                ),
              )),

          Lottie.asset('assets/weather.json'),

          Obx(()=> Text(wetherCntrl.name.toString())),
          Obx(()=> Text("the wind speed is : ${wetherCntrl.windSpeed.toString()}")),
          Obx(()=> Text("The SunSet : ${wetherCntrl.sunSet.toString()}")),
          Obx(()=> Text("the SunRise : ${wetherCntrl.sunRise.toString()}")),
        ],
      ),
    );
  }
}
