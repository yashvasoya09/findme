import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(context, "splash2");
      },
    );

    return Scaffold(
      backgroundColor: Color(0xff132227),
      body: Center(child: Image.asset("assets/images/logo.png")),
    );
  }
}

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
     Future.delayed(
      Duration(seconds: 3),
          () {
            Navigator.pushReplacementNamed(context, "location");
          },
    );
       return Scaffold(
         backgroundColor: Color(0xff121F23),
         body: Center(child: LoadingIndicator(
             indicatorType: Indicator.pacman, /// Required, The loading type of the widget
             colors: const [Color(0xff525753),Color(0xffEEECEA),Color(0xffA59990)],       /// Optional, The color collections
             strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
             backgroundColor: Color(0xff121F23),      /// Optional, Background of the widget
             pathBackgroundColor: Color(0xff525B56)   /// Optional, the stroke backgroundColor
         )),
       );
  }
}
