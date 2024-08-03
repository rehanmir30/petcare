import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/views/auth/otp.dart';
import 'package:petcare/views/auth/signup.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../globals/functions.dart';
import '../../widgets/coloredBg.dart';
import '../../widgets/customButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    height: MediaQuery.of(context).size.height * 0.55,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          color: rBg,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(26),
                              topLeft: Radius.circular(26))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: heading, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Welcome! Please enter your login details ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: rGreyShade,
                                fontSize: normal,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //email
                          Container(
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                fillColor: rWhite,
                                filled: true,
                                hintText: 'Your email',
                                hintStyle: TextStyle(color: rGrey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: primary,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: rGrey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //password
                          Container(
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                fillColor: rWhite,
                                filled: true,
                                hintText: 'Password',
                                hintStyle: TextStyle(color: rGrey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: primary,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: rGrey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("Forgot password?",style: TextStyle(color: rGreyShade),),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          CustomButton("Login", nextScreen(OTPScreen())),

                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(color: rGreyShade, fontSize: 14),
                                ),
                                TextSpan(
                                  text: 'Signup here!',
                                  style: TextStyle(color: primary, fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(SignupScreen(),transition: Transition.leftToRight);
                                    },
                                ),

                              ],
                            ),
                          ),
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
                              'assets/animations/auth.json')),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
