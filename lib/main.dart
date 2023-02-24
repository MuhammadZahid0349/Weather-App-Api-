import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/Pages/Home_Page.dart';
import 'package:weather_app/Pages/Loading_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            builder: EasyLoading.init(),
            // home: HomePage(),
            routes: {
              "/": (context) => LoadingPage(),
              "/home": (context) => HomePage(),
              "/loading": (context) => LoadingPage(),
            },
          );
        });
  }
}
