import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:lottie/lottie.dart";
import "package:petcare/controllers/profileCreateController.dart";
import "package:petcare/widgets/customButton.dart";
import "package:petcare/widgets/customShadowTile.dart";

import "../../../constants/colors.dart";

class PetSnap extends StatefulWidget {
  var _nextPage;

  PetSnap(this._nextPage, {super.key});

  @override
  State<PetSnap> createState() => _PetSnapState();
}

class _PetSnapState extends State<PetSnap> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBg,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: GetBuilder<ProfileCreateController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.42,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.39,
                      decoration: BoxDecoration(
                          border: Border.all(color: rWhiteShade.withOpacity(0.5)),
                          shape: BoxShape.circle,
                          color: rBg),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      decoration: BoxDecoration(
                          border: Border.all(color: rWhiteShade.withOpacity(0.5)),
                          shape: BoxShape.circle,
                          color: rBg),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.26,
                      decoration: BoxDecoration(
                          border: Border.all(color: rWhiteShade),
                          shape: BoxShape.circle,
                          color: rBg,
                          image: DecorationImage(
                              image: AssetImage("assets/images/placeholder.png"),
                              fit: BoxFit.contain)),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.04,
                      child: CustomShadowTile(Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14), color: rWhite),
                        child: Lottie.asset("assets/animations/gallery.json",
                            width: 40, height: 40),
                      )),
                    )
                  ],
                ),
              ),
              Text(
                "What's your pet's name?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),

              SizedBox(
                height: 20,
              ),
              //pet name
              Container(
                height: 50,
                child: TextFormField(
                  controller: controller.petNameController,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    fillColor: rWhite,
                    filled: true,
                    hintText: "Your pet's name",
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
              ).marginSymmetric(horizontal: 20),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: controller.petNameController.text.isEmpty?() {
                    if(controller.petNameController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Pet name is mandatory"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  }:widget._nextPage,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14), color: controller.petNameController.text.isEmpty?primary.withOpacity(0.3):primary),
                    child: Text(
                      "Continue",
                      style: TextStyle(color: rWhite),
                    ),
                  ),
                ),
              ).marginOnly(bottom: 50, left: 20, right: 20)
            ],
          );
        },),
      ),
    );
  }
}
