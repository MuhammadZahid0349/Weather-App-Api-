import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataModel {
  String? location;
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  DataModel({this.location}) {
    location = this.location;
  }

  Future<void> getData() async {
    try {
      var url =
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=d97301195592ccd6f3fdb0a985b3bf05";

      http.Response response = await http.get(Uri.parse(url));
      print(response.body);
      Map data = jsonDecode(response.body);

      Map temp_data = data['main'];
      double gettemp = temp_data['temp'] - 273.15;
      String gethumidity = temp_data['humidity'].toString();

      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];

      String getmain_des = weather_main_data['main'];
      String getdesc = weather_main_data['description'];

      Map wind = data['wind'];
      String get_air_speed = wind['speed'].toString();

      // Assigning values
      temp = gettemp.toString();
      humidity = gethumidity;
      air_speed = get_air_speed.toString();
      description = getdesc.toString();
      main = getmain_des.toString();
      icon = weather_main_data["icon"].toString();
    } catch (e) {
      print(e);
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "09d";
      Get.snackbar("API Fetch Error", "$e");
    }
  }
}
