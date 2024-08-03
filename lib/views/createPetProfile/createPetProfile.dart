import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:petcare/constants/colors.dart";
import "package:petcare/controllers/petController.dart";
import "package:petcare/controllers/profileCreateController.dart";
import "package:petcare/models/petModel.dart";
import "package:petcare/views/createPetProfile/formSections/ImportantDatesSection.dart";
import "package:petcare/views/createPetProfile/formSections/categorySelection.dart";
import "package:petcare/views/createPetProfile/formSections/petSnap.dart";
import "package:petcare/views/createPetProfile/formSections/petWeightSection.dart";
import "package:petcare/views/createPetProfile/formSections/subCategorySelection.dart";
import "package:petcare/views/createPetProfile/formSections/vaccinationSelection.dart";

class CreatePetProfile extends StatefulWidget {
  const CreatePetProfile({super.key});

  @override
  State<CreatePetProfile> createState() => _CreatePetProfileState();
}

class _CreatePetProfileState extends State<CreatePetProfile> {
  final PageController _pageController = PageController();
  ProfileCreateController _profileCreateController = Get.find<ProfileCreateController>();
  PetController _petController=Get.find<PetController>();
  int _currentIndex = 0;
  String pageTitle = "Category";

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });

    setState(() {
      if (_currentIndex == 0) {
        pageTitle = "Category";
      } else if (_currentIndex == 1) {
        pageTitle = "Breed";
      } else if (_currentIndex == 2) {
        pageTitle = "Pet Snap";
      } else if (_currentIndex == 3) {
        pageTitle = "Weight";
      }
      else if (_currentIndex == 4) {
        pageTitle = "Important Dates";
      } else if (_currentIndex == 5) {
        pageTitle = "Vaccinations";
      }
    });
  }

  void _nextPage() {
    if (_currentIndex < 5) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      PetModel _petModel = PetModel(
          name: _profileCreateController.petNameController.text,
          category: _profileCreateController.selectedCategory,
          subCategory: _profileCreateController.selectedSubCategory,
          weight: _profileCreateController.petWeight,
          weightUnit: _profileCreateController.weightType,
          dob: _profileCreateController.selectedDOB!,
          adoptionDate: _profileCreateController.selectedAD,
          vaccinations: _profileCreateController.selectedVaccinations);
      _petController.addPetToList(_petModel);

      Get.find<ProfileCreateController>().setSelectedCategoryIndex(-1);
      Get.find<ProfileCreateController>().setSelectedSubCategoryIndex(-1);

      Get.back();
    }
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return Future.value(false); // Prevent default back button behavior
    } else {
      Get.find<ProfileCreateController>().setSelectedCategoryIndex(-1);
      Get.find<ProfileCreateController>().setSelectedSubCategoryIndex(-1);
      return Future.value(true);
    }
  }

  Widget _buildPageIndicator() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: 4.0,
      child: Stack(
        children: [
          Container(
            height: 4.0,
            color: Colors.grey.shade300,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: MediaQuery
                .of(context)
                .size
                .width / 6 * (_currentIndex + 1),
            height: 4.0,
            color: primary,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: rBg,
        appBar: AppBar(
          backgroundColor: rBg,
          title: Column(
            children: [
              Text(
                'Add Pet Profile',
                style:
                TextStyle(fontWeight: FontWeight.w600, color: rTextBlack),
              ),
              Text(
                "$pageTitle",
                style: TextStyle(color: rGreyShade, fontSize: 14),
              )
            ],
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Step",
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      "${_currentIndex + 1}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "/6",
                      style: TextStyle(fontSize: 16, color: rGreyShade),
                    ),
                  ],
                )
              ],
            ).marginSymmetric(horizontal: 12, vertical: 8)
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 16),
            _buildPageIndicator(),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CategorySelection(_nextPage),
                  SubCategorySelection(_nextPage),
                  PetSnap(_nextPage),
                  PetWeightSection(_nextPage),
                  ImportantDatesSection(_nextPage),
                  VaccinationSelection(_nextPage)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
