import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/controllers/profileCreateController.dart';

import '../../../constants/colors.dart';
import '../../../widgets/customShadowTile.dart';

class PetWeightSection extends StatefulWidget {
  var _nextPage;

  PetWeightSection(this._nextPage, {super.key});

  @override
  State<PetWeightSection> createState() => _PetWeightSectionState();
}

class _PetWeightSectionState extends State<PetWeightSection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBg,
      resizeToAvoidBottomInset: true,
      body: GetBuilder<ProfileCreateController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        border: Border.all(color: rWhiteShade.withOpacity(0.5)),
                        shape: BoxShape.circle,
                        color: rBg),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        border: Border.all(color: rWhiteShade.withOpacity(0.5)),
                        shape: BoxShape.circle,
                        color: rBg),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                        border: Border.all(color: rWhiteShade),
                        shape: BoxShape.circle,
                        color: rBg,
                        image: DecorationImage(
                            image: AssetImage("assets/images/placeholder.png"),
                            fit: BoxFit.contain)),
                  ),
                ],
              ),
            ),
            Text(
              "What's your pet's weight?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "${controller.petWeight}",
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: primary),
            ),
            FlutterSlider(
              values: [controller.petWeight],
              max: 100,
              min: 0,
              step: FlutterSliderStep(step: 0.1),
              handler: FlutterSliderHandler(
                decoration: BoxDecoration(),
                child: Material(
                  type: MaterialType.circle,
                  color: Colors.blue,
                  elevation: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.drag_handle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                ),
                inactiveTrackBar: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
              onDragging: (handlerIndex, lowerValue, upperValue) {
                controller.setPetWeight(lowerValue);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    controller.setWeightType("kg");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: controller.weightType == 'kg' ? primary : rGreyShade,
                      ),
                      color: rWhite,
                    ),
                    child: Row(
                      children: [
                        Radio(
                          value: 'kg',
                          groupValue: controller.weightType,
                          activeColor: primary,
                          onChanged: (value) {
                            controller.setWeightType(value!);
                          },
                        ),
                        Text(
                          'kg',
                          style: TextStyle(
                            color: controller.weightType == 'kg' ? primary : rGreyShade,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.setWeightType("lb");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: controller.weightType == 'lb' ? primary : rGreyShade,
                      ),
                      color: rWhite,
                    ),
                    child: Row(
                      children: [
                        Radio(
                          value: 'lb',
                          groupValue: controller.weightType,
                          activeColor: primary,
                          onChanged: (value) {
                            controller.setWeightType(value!);
                          },
                        ),
                        Text(
                          'lb',
                          style: TextStyle(
                            color: controller.weightType == 'lb' ? primary : rGreyShade,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: widget._nextPage,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14), color: primary),
                    child: Text(
                      "Continue",
                      style: TextStyle(color: rWhite),
                    ),
                  ),
                ),
              ).marginOnly(bottom: 50, left: 20, right: 20),
            )
          ],
        );
      },),
    );
  }
}
