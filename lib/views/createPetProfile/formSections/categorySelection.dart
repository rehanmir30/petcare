import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcare/constants/colors.dart';
import 'package:petcare/controllers/profileCreateController.dart';
import 'package:petcare/widgets/customButton.dart';
import 'package:petcare/widgets/customDialogShadow.dart';
import 'package:petcare/widgets/customShadowTile.dart';

import '../../../constants/sizes.dart';
import '../../../models/categoryModel.dart';

class CategorySelection extends StatefulWidget {
  var _nextFunction;

  CategorySelection(this._nextFunction, {super.key});

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBg,
      body: GetBuilder<ProfileCreateController>(builder: (controller) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0, // Horizontal spacing between items
                      mainAxisSpacing: 5.0, // Vertical spacing between items
                    ),
                    itemCount: controller.allCategories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          controller.setSelectedCategoryIndex(index);
                        },
                        child: CustomShadowTile(
                          Container(
                            decoration: BoxDecoration(
                                color: rWhite,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                    color: controller.selectedCategoryIndex == index
                                        ? primary
                                        : Colors.transparent,
                                    width: 2)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                    top: 20,
                                    child: Text(
                                      controller.allCategories[index].name!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: controller.selectedCategoryIndex == index
                                              ? primary
                                              : rTextBlack),
                                    )),
                                Positioned(
                                  bottom: -5,
                                  child: SvgPicture.asset(
                                    'assets/svgs/cardBg.svg',
                                  ),
                                ),
                                Positioned(
                                    bottom: -5,
                                    child: Image.asset(
                                      "assets/images/splashDog.png",
                                      height: 150,
                                      width: 150,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).marginSymmetric(horizontal: 12),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            if (controller.selectedCategoryIndex >=0)
              Positioned(
                bottom: 0,
                child: CustomDialogShadow(
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.19,
                    decoration: BoxDecoration(
                        color: rWhite,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(26),
                            topLeft: Radius.circular(26))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton("Continue", widget._nextFunction),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: (){
                            controller.setSelectedCategoryIndex(-1);
                            controller.setSelectedSubCategoryIndex(-1);
                            Get.back();
                          },
                          child: Text(
                            "Quit Creating Profile",
                            style: TextStyle(color: rGreyShade),
                          ),
                        )
                      ],
                    ).marginSymmetric(horizontal: 20),
                  ),
                ),
              ),
          ],
        );
      },),
    );
  }
}
