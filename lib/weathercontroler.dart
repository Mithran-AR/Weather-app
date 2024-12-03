import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:myweatherapp/model.dart';

class Weathercontroler extends GetxController{
  var selectdistrict = "palakkad".obs;
   var data = {}.obs;
  WethereModel? wethereModel;
  RxString name="".obs;
  RxDouble windSpeed=0.0.obs;
  RxString sunRise="".obs;
  RxString sunSet="".obs;

  @override
  void onInit(){
    super.onInit();
    // getdata(selectdistrict.value);
  }
  Future<void> getdata(String district)async{
     final res =await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$district&appid=2d581b9d24debda3df0699f3c768825b"));
     print(res.body.toString());
    var datas = jsonDecode(res.body);
     var model=WethereModel.fromJson(datas);
     wethereModel=model;
     name.value=wethereModel?.name??"Name";
     windSpeed.value=wethereModel?.wind?.speed??0.0;
     sunRise.value=getTheSunSet(wethereModel?.sys?.sunrise??0);
     sunSet.value=getTheSunSet(wethereModel?.sys?.sunset??0);
  }

  String getTheSunSet(int timestamp){
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);

    // Format the DateTime
    String formattedDate = DateFormat('dd-MM-yyyy hh:mm a').format(date.toLocal());

    print('Sunset time: $formattedDate (UTC)');
    return formattedDate;
  }

}