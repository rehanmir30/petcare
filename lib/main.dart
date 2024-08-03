import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controllers/initControllers.dart';
import 'package:petcare/views/onBoarding/onBoarding.dart';
import 'package:petcare/widgets/coloredBg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitControllers(),
      title: 'Pet care',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ColoredBg(),
          Positioned(
            left: 0,
              bottom: 0,
              child: Image.asset(
                "assets/images/splashDog.png",
              )),
          Positioned(
              top: 80,
              child: Text("Logo/App Name",style: TextStyle(fontSize: 40),))
        ],
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      Get.offAll(OnBoarding(),transition: Transition.circularReveal);
    });
  }
}
