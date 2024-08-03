import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/controllers/profileCreateController.dart';
import 'package:petcare/widgets/customShadowTile.dart';

import '../../../constants/colors.dart';

class ImportantDatesSection extends StatefulWidget {
  var _nextPage;

  ImportantDatesSection(this._nextPage, {super.key});

  @override
  State<ImportantDatesSection> createState() => _ImportantDatesSectionState();
}

class _ImportantDatesSectionState extends State<ImportantDatesSection> {

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
              "Time to celebrate",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            CustomShadowTile(InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                controller.setDOB(await showRoundedDatePicker(
                  context: context,
                  theme: ThemeData.dark(),
                  imageHeader: AssetImage("assets/images/calenderBg.png"),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year-50),
                  lastDate: DateTime.now(),
                  description:
                  "Did you know? Pets age faster than humans. Choose their birth date to track their age properly\n",
                  styleDatePicker: MaterialRoundedDatePickerStyle(
                      sizeArrow: 20,
                      colorArrowNext: primary,
                      colorArrowPrevious: primary,
                      paddingDateYearHeader: EdgeInsets.all(12),
                      textStyleButtonAction:
                      TextStyle(fontSize: 14, color: primary),
                      textStyleButtonPositive:
                      TextStyle(fontSize: 14, color: primary),
                      textStyleButtonNegative:
                      TextStyle(fontSize: 14, color: primary),
                      textStyleDayButton: TextStyle(fontSize: 14, color: rWhite),
                      textStyleYearButton: TextStyle(fontSize: 14, color: rWhite),
                      textStyleDayHeader: TextStyle(color: rTextBlack),
                      decorationDateSelected:
                      BoxDecoration(color: primary, shape: BoxShape.circle)),
                  styleYearPicker: MaterialRoundedYearPickerStyle(
                    textStyleYear: TextStyle(fontSize: 14, color: rWhite),
                    textStyleYearSelected: TextStyle(
                        fontSize: 14,
                        color: primary,
                        fontWeight: FontWeight.bold),
                    heightYearRow: 40,
                  ),
                  borderRadius: 16,
                  height: 300,
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: rGrey),
                    color: rWhite),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: primary.withOpacity(0.2)),
                          child: Lottie.asset("assets/animations/birthday.json")
                              .marginAll(4),
                        ).marginAll(8)),
                    Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Birthday",
                              style: TextStyle(color: rGreyShade),
                            ),
                            controller.selectedDOB != null
                                ? Text(
                              formatDate(controller.selectedDOB!),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: rTextBlack),
                            )
                                : Container()
                          ],
                        ).marginSymmetric(horizontal: 12)),
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                              width: 2,
                              height: 40,
                              color: rGrey,
                              alignment: Alignment.center,
                            ),
                            controller.selectedDOB != null
                                ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("${calculateAge(controller.selectedDOB!)}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: rTextBlack)),
                                Text(" y.o",style: TextStyle(color: rGreyShade),)
                              ],
                            ).marginOnly(left: 5)
                                : Container()
                          ],
                        ))
                  ],
                ),
              ),
            )),
            CustomShadowTile(InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                 controller.setAD(await showRoundedDatePicker(
                   context: context,
                   theme: ThemeData.dark(),
                   imageHeader: AssetImage("assets/images/calenderBg.png"),
                   initialDate: DateTime.now(),
                   firstDate: DateTime(DateTime.now().year-50),
                   lastDate: DateTime.now(),
                   description:
                   "Choose the date your beloved pet was born or adopted to keep their records complete.\n",
                   styleDatePicker: MaterialRoundedDatePickerStyle(
                       sizeArrow: 20,
                       colorArrowNext: primary,
                       colorArrowPrevious: primary,
                       paddingDateYearHeader: EdgeInsets.all(12),
                       textStyleButtonAction:
                       TextStyle(fontSize: 14, color: primary),
                       textStyleButtonPositive:
                       TextStyle(fontSize: 14, color: primary),
                       textStyleButtonNegative:
                       TextStyle(fontSize: 14, color: primary),
                       textStyleDayButton: TextStyle(fontSize: 14, color: rWhite),
                       textStyleYearButton: TextStyle(fontSize: 14, color: rWhite),
                       textStyleDayHeader: TextStyle(color: rTextBlack),
                       decorationDateSelected:
                       BoxDecoration(color: primary, shape: BoxShape.circle)),
                   styleYearPicker: MaterialRoundedYearPickerStyle(
                     textStyleYear: TextStyle(fontSize: 14, color: rWhite),
                     textStyleYearSelected: TextStyle(
                         fontSize: 14,
                         color: primary,
                         fontWeight: FontWeight.bold),
                     heightYearRow: 40,
                   ),
                   borderRadius: 16,
                   height: 300,
                 ));

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: rGrey),
                    color: rWhite),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: primary.withOpacity(0.2)),
                          child: Lottie.asset("assets/animations/adoption.json")
                              .marginAll(4),
                        ).marginAll(8)),
                    Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Adoption Day",
                              style: TextStyle(color: rGreyShade),
                            ),
                            controller.selectedAD != null
                                ? Text(
                              formatDate(controller.selectedAD!),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: rTextBlack),
                            )
                                : Container()
                          ],
                        ).marginSymmetric(horizontal: 12)),

                  ],
                ),
              ),
            )),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: controller.selectedDOB==null?() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Date of birth is mandatory"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }:widget._nextPage,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14), color: controller.selectedDOB==null?primary.withOpacity(0.3):primary),
                    child: Text(
                      "Continue",
                      style: TextStyle(color: rWhite),
                    ),
                  ),
                ),
              ).marginOnly(bottom: 50, left: 20, right: 20),
            )
          ],
        ).marginSymmetric(horizontal: 10);
      },),
    );
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('d MMM, yyyy');
    return formatter.format(date);
  }

  double calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();

    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    // Adjust months and days if current month/day is before birth month/day
    if (days < 0) {
      months--;
      days += DateTime(birthDate.year, birthDate.month + 1, 0).day;
    }
    if (months < 0) {
      years--;
      months += 12;
    }

    // Calculate age in decimal
    double age = years + (months / 12) + (days / 365.25);

    // Round to 1 digit after decimal
    return double.parse(age.toStringAsFixed(1));
  }
}
