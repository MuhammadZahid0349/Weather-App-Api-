import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/Pages/Data_Model.dart';
import 'package:weather_app/Pages/Home_Page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String city = "Karachi";
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? icon;

  void getApiData(String? city) async {
    DataModel instance = DataModel(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    city = instance.location;
    print(instance.air_speed);
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getApiData(city);
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? search =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    if (search?.isNotEmpty == false) {
      // do something with the info Map here
    }
    city = search?['searchText'] ?? 'Karachi';

    getApiData(city);
    return Scaffold(
      bottomNavigationBar: Container(
        child: Image.asset(
          "assets/g.gif",
          fit: BoxFit.fitWidth,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                40.h.heightBox,
                Image.asset(
                  "assets/bg.png",
                  height: 200.h,
                  width: 200.w,
                ),
                20.h.heightBox,
                Text(
                  "Weather App",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                25.h.heightBox,
                Text(
                  "Made By Muhammad Zahid",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                35.h.heightBox,
                SpinKitWave(
                  color: Colors.white,
                  size: 35.sp,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
