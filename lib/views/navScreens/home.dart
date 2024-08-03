import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/constants/colors.dart';
import 'package:petcare/constants/sizes.dart';
import 'package:petcare/controllers/petController.dart';
import 'package:petcare/views/createPetProfile/createPetProfile.dart';
import 'package:petcare/widgets/customShadowTile.dart';

import '../../models/petModel.dart';
import '../shareProfile/shareProfile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // final List<Map<String, String>> pets = [
  //   {
  //     'name': 'Maxi',
  //     'type': 'Dog',
  //     'breed': 'Border Collie',
  //     'imageUrl': 'https://via.placeholder.com/150'
  //   },
  //   {
  //     'name': 'Bella',
  //     'type': 'Cat',
  //     'breed': 'Persian',
  //     'imageUrl': 'https://via.placeholder.com/150'
  //   },
  //   {
  //     'name': 'Charlie',
  //     'type': 'Dog',
  //     'breed': 'Labrador',
  //     'imageUrl': 'https://via.placeholder.com/150'
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBg,
      body: GetBuilder<PetController>(
        builder: (controller) {
          return controller.allPets.isEmpty
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: rWhite),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/noPets.svg',
                            ),
                            Text(
                              "Uh Oh!",
                              style: TextStyle(
                                  fontSize: heading,
                                  fontWeight: FontWeight.bold,
                                  color: rTextBlack),
                            ),
                            Text(
                              "Looks like you have no profiles set up at this moment, add your pet now",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: normal,
                                  fontWeight: FontWeight.normal,
                                  color: rGreyShade),
                            ),
                          ],
                        ),
                      ),
                      SwipeButton.expand(
                        thumbPadding: EdgeInsets.all(4),
                        borderRadius: BorderRadius.circular(12),
                        thumb: Icon(
                          Icons.double_arrow_rounded,
                          color: Colors.white,
                        ),
                        child: Text(
                          "Swipe to add pet",
                          style: TextStyle(
                            color: primary,
                          ),
                        ),
                        activeThumbColor: primary,
                        activeTrackColor: primary.withOpacity(0.2),
                        onSwipe: () {
                          Get.to(CreatePetProfile(),
                              transition: Transition.leftToRight);
                        },
                      ).marginOnly(bottom: 20)
                    ],
                  ).marginSymmetric(horizontal: 25),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Active pet profiles",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: rTextBlack),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: rGrey),
                          child: Text(
                            "${controller.allPets.length}",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                    onTap: () {
                                      Get.to(CreatePetProfile(),
                                          transition:
                                              Transition.circularReveal);
                                    },
                                    child: Text(
                                      "Create more",
                                      style: TextStyle(
                                          color: primary,
                                          decoration: TextDecoration.underline,
                                          decorationColor: primary),
                                    ))))
                      ],
                    ).marginSymmetric(horizontal: 20),
                    Container(
                      height: 170,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: controller.allPets.length,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemBuilder: (context, index) {
                          final pet = controller.allPets[index];
                          return Center(
                            child: PetProfileCard(
                              petModel: pet,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.allPets.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomShadowTile(InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.to(ShareProfile(),transition: Transition.fadeIn);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 170,
                            decoration: BoxDecoration(
                                color: rWhite,
                                borderRadius: BorderRadius.circular(14)),
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Share profile",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: rTextBlack,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Easily share your pet's profile with others",
                                          style: TextStyle(color: rGreyShade),
                                        )
                                      ],
                                    ).marginAll(8)),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Lottie.asset(
                                              "assets/animations/share.json",
                                              width: 40,
                                              height: 40)
                                          .marginOnly(right: 12),
                                    )),
                              ],
                            ),
                          ),
                        )),
                        CustomShadowTile(Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Positioned(
                                      top: -30,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: rGrey.withOpacity(0.6)),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.orange.withOpacity(0.4),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 30,
                                                child: Lottie.asset(
                                                    "assets/animations/nutrition.json",
                                                    width: 60,
                                                    height: 60),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Nutrition',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: rTextBlack,
                                    ),
                                  ).marginOnly(left: 12),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ).marginSymmetric(horizontal: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomShadowTile(Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Positioned(
                                      top: -30,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: rGrey.withOpacity(0.6)),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEDC494)
                                                .withOpacity(0.4),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 30,
                                                child: Lottie.asset(
                                                    "assets/animations/health.json",
                                                    width: 80,
                                                    height: 80),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Health Care',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: rTextBlack,
                                    ),
                                  ).marginOnly(left: 12),
                                ),
                              ),
                            ],
                          ),
                        )),
                        CustomShadowTile(Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Positioned(
                                      top: -30,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: rGrey.withOpacity(0.6)),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          decoration: BoxDecoration(
                                            color: Color(0xff007179)
                                                .withOpacity(0.4),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 30,
                                                child: Lottie.asset(
                                                    "assets/animations/activity.json",
                                                    width: 60,
                                                    height: 60),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Activities',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: rTextBlack,
                                    ),
                                  ).marginOnly(left: 12),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ).marginSymmetric(horizontal: 20).marginOnly(top: 10)
                  ],
                );
        },
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: _currentPage == index ? 8.0 : 6.0,
      height: _currentPage == index ? 8.0 : 6.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class PetProfileCard extends StatelessWidget {
  final PetModel petModel;

  PetProfileCard({required this.petModel});

  @override
  Widget build(BuildContext context) {
    String category = '${petModel.category} | ${petModel.subCategory}';
    if (category.length > 20) {
      category = category.substring(0, 20) + "...";
    }
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 30,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xffCCE1F7),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: rWhite)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      petModel.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      category,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 130,
                      decoration: BoxDecoration(
                        color: rWhite.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 100,
                      decoration: BoxDecoration(
                        color: rWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage("assets/images/placeholder.png"),
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
          ).marginSymmetric(horizontal: 20),
        ],
      ),
    );
  }
}
