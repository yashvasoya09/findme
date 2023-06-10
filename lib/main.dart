import 'package:findme/screen/view/home.dart';
import 'package:findme/screen/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => SplashScreen(),
        'splash2':(p0) => SplashScreen2(),
        'location':(p0) => Location_Screen(),
      },
    ),
  );
}
