import 'package:animated_button/animated_button.dart';
import 'package:findme/screen/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Location_Screen extends StatefulWidget {
  const Location_Screen({super.key});

  @override
  State<Location_Screen> createState() => _Location_ScreenState();
}

class _Location_ScreenState extends State<Location_Screen> {
  LocationPermission? locationPermission;

  LocationC? locationC;
  LocationC control = Get.put(LocationC());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff585D60),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff040C0E),
          title: Text(
            "FindMe",
            style: GoogleFonts.play(color: Color(0xffA4978E)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Spacer(),
              Center(
                child: AnimatedButton(
                  child: Text("FindMe",
                      style: GoogleFonts.play(color: Color(0xffC08F65),fontSize: 40)),
                  onPressed: () async {
                    locationPermission = await Geolocator.requestPermission();
                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);

                    control.lat.value = position.latitude;
                    control.long.value = position.longitude;

                    //***************address find**************\\

                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        control.lat.value, control.long.value);

                    control.place.value = placemarks[0];
                    control.placeLists.value = placemarks;
                  },
                  duration: 100,
                  height: 100,
                  width: 200,
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                  color: Color(0xff525B56),
                ),
              ),
              Spacer(),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "${control.place}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xffA4978E)),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
