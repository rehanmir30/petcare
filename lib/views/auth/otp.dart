import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/controllers/authController.dart';
import 'package:petcare/services/authService.dart';
import 'package:petcare/views/auth/signup.dart';
import 'package:petcare/widgets/customLoading.dart';
import 'package:pinput/pinput.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../globals/functions.dart';
import '../../widgets/coloredBg.dart';
import '../../widgets/customButton.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (controller) {
        return Stack(
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
                              "Validation Code",
                              style: TextStyle(
                                  fontSize: heading, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Enter the 6 digit code sent to your email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: rGreyShade,
                                  fontSize: normal,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //OTP
                            Pinput(
                              length: 6,
                              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              pinAnimationType: PinAnimationType.slide,
                              focusedPinTheme: PinTheme(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: primary),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            CustomButton("Confirm", (){AuthService().validateOTP();}),

                            SizedBox(
                              height: 20,
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
                                'assets/animations/otp.json')),
                      ),
                    )
                  ],
                )),
            Visibility(
                visible: controller.isLoading,
                child: CustomLoading())
          ],
        );
      },),
    );
  }
}
