import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/constants/colors.dart';
import 'package:petcare/globals/functions.dart';
import 'package:petcare/views/auth/login.dart';
import 'package:petcare/widgets/coloredBg.dart';
import 'package:petcare/widgets/customButton.dart';

import '../../constants/sizes.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ColoredBg(),
          Positioned(
              top: -150, child: Image.asset("assets/images/splashDog.png")),
          Positioned(
              bottom: 0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                          color: rBg,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(26),
                              topLeft: Radius.circular(26))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Personalized Pet Profiles",
                            style: TextStyle(
                                fontSize: heading, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create personalized profiles for each of your beloved pets on APP NAME. Share their name, breed, and age while connecting with a vibrant community.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: rGreyShade,
                                fontSize: normal,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          CustomButton("Get started", nextScreenAndRemoveAll(LoginScreen())
                          )
                        ],
                      ).marginSymmetric(horizontal: 20),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: rBg,
                          shape: BoxShape.circle,
                          border: Border.all(color: rBg, width: 8)),
                      child: Container(
                          decoration: BoxDecoration(
                            color: rBg,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: primary.withOpacity(0.5))),
                          child: Lottie.asset(
                              'assets/animations/onboarding.json')),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
