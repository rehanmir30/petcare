import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/constants/colors.dart';

import '../../../controllers/profileCreateController.dart';

class VaccinationSelection extends StatefulWidget {
  var _nextScreen;

  VaccinationSelection(this._nextScreen, {super.key});

  @override
  State<VaccinationSelection> createState() => _VaccinationSelectionState();
}

class _VaccinationSelectionState extends State<VaccinationSelection> {
  List<String> allVaccinations = [];
  ProfileCreateController _pcc = Get.find<ProfileCreateController>();


  @override
  void initState() {
    allVaccinations.add("Not Vaccinated");
    allVaccinations
        .addAll(_pcc.allCategories[_pcc.selectedCategoryIndex].vaccinations!);
    allVaccinations.add("Other");
    setState(() {
      allVaccinations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBg,
      resizeToAvoidBottomInset: true,
      body: GetBuilder<ProfileCreateController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: rWhiteShade.withOpacity(0.5)),
                            shape: BoxShape.circle,
                            color: rBg),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: rWhiteShade.withOpacity(0.5)),
                            shape: BoxShape.circle,
                            color: rBg),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(color: rWhiteShade),
                            shape: BoxShape.circle,
                            color: rBg,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/placeholder.png"),
                                fit: BoxFit.contain)),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Is your pet vaccinated?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: allVaccinations.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(allVaccinations[index]),
                        Checkbox(
                          value: controller.selectedVaccinations
                              .contains(allVaccinations[index]),
                          onChanged: (bool? value) {
                            setState(() {
                              if (allVaccinations[index] == "Not Vaccinated" &&
                                  value == true) {
                                // Clear all other selections if "Not Vaccinated" is checked
                                controller.clearVaccinationsList();
                                controller.addVaccinationToList(allVaccinations[index]);

                              } else if (allVaccinations[index] ==
                                      "Not Vaccinated" &&
                                  value == false) {
                                controller.removeVaccinationFromList(allVaccinations[index]);
                              } else {
                                // Handle other selections
                                if (value == true) {
                                  controller.addVaccinationToList(allVaccinations[index]);
                                  controller.removeVaccinationFromList("Not Vaccinated");
                                } else {
                                  controller.removeVaccinationFromList(allVaccinations[index]);
                                }
                              }
                            });
                          },
                        ),
                      ],
                    );
                  },
                ).marginSymmetric(horizontal: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: widget._nextScreen,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: primary),
                      child: Text(
                        "Finish",
                        style: TextStyle(color: rWhite),
                      ),
                    ),
                  ),
                ).marginOnly(bottom: 50, left: 20, right: 20,top: 20)
              ],
            ),
          );
        },
      ),
    );
  }
}
