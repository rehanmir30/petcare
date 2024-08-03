import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/categoryModel.dart';

class ProfileCreateController extends GetxController {
  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;

  TextEditingController petNameController=TextEditingController();

  double _petWeight=10.2;
  double get petWeight=>_petWeight;
  String _weightType="kg";
  String get weightType=>_weightType;

  int _selectedCategoryIndex=-1;
  String _selectedCategory="";
  String get selectedCategory=>_selectedCategory;
  String _selectedSubCategory="";
  String get selectedSubCategory=>_selectedSubCategory;
  int _selectedSubCategoryIndex=-1;
  int get selectedCategoryIndex=>_selectedCategoryIndex;
  int get selectedSubCategoryIndex=>_selectedSubCategoryIndex;

  DateTime? _selectedDOB;
  DateTime? get selectedDOB=>_selectedDOB;
  DateTime? _selectedAD;
  DateTime? get selectedAD=>_selectedAD;

  List<String> _selectedVaccinations=[];
  List<String> get selectedVaccinations=>_selectedVaccinations;


  addVaccinationToList(String value){
    _selectedVaccinations.add(value);
    update();
  }

  removeVaccinationFromList(String value){
    _selectedVaccinations.remove(value);
    update();
  }

  clearVaccinationsList(){
    _selectedVaccinations.clear();
    update();
  }

  setDOB(DateTime? value){
    _selectedDOB=value;
    update();
  }

  setAD(DateTime? value){
    _selectedAD=value;
    update();
  }

  setPetWeight(double value){
    _petWeight=value;
    update();
  }

  setWeightType(String value){
    _weightType=value;
    update();
  }

  setSelectedCategoryIndex(int value){
    _selectedCategoryIndex=value;
    if(value!=-1){
      _selectedCategory=_allCategories[value].name;
    }

    update();
  }
  setSelectedSubCategoryIndex(int value){
    _selectedSubCategoryIndex=value;
    if(value!=-1){
      _selectedSubCategory=_allCategories[_selectedCategoryIndex].subCategories[value];
    }
    update();
  }
  setAllCategories() {
    _allCategories.add(CategoryModel(
        name: "Cat Family",
        subCategories: ["Domestic Cat", "Lion", "Tiger", "Leopard", "Cheetah"],
        vaccinations: ["Rabies", "Feline Distemper", "Feline Herpesvirus", "Feline Calicivirus", "Feline Leukemia Virus"]
    ));

    _allCategories.add(CategoryModel(
        name: "Dog Family",
        subCategories: ["Domestic Dog", "Wolf", "Fox", "Coyote"],
        vaccinations: ["Rabies", "Distemper", "Parvovirus", "Adenovirus", "Parainfluenza"]
    ));

    _allCategories.add(CategoryModel(
        name: "Bird Family",
        subCategories: ["Parrot", "Canary", "Finch", "Eagle", "Owl"],
        vaccinations: ["Avian Influenza", "Newcastle Disease", "Pacheco's Disease", "Polyomavirus", "Psittacosis"]
    ));

    _allCategories.add(CategoryModel(
        name: "Reptile Family",
        subCategories: ["Snake", "Lizard", "Turtle", "Crocodile"],
        vaccinations: ["Reptile mite treatment", "Reptile worming", "Calcium and Vitamin D3 supplements"]
    ));

    _allCategories.add(CategoryModel(
        name: "Small Mammal Family",
        subCategories: ["Rabbit", "Hamster", "Guinea Pig", "Mouse", "Rat", "Ferret", "Hedgehog", "Chinchilla"],
        vaccinations: ["Rabies (for ferrets)", "Distemper (for ferrets)", "Myxomatosis (for rabbits)", "Viral Hemorrhagic Disease (for rabbits)"]
    ));

    _allCategories.add(CategoryModel(
        name: "Fish Family",
        subCategories: ["Goldfish", "Betta Fish", "Guppy", "Cichlid"],
        vaccinations: ["Aquarium salt treatment", "Antiparasitic treatments", "Antibiotic treatments"]
    ));

    _allCategories.add(CategoryModel(
        name: "Amphibian Family",
        subCategories: ["Frog", "Toad", "Salamander"],
        vaccinations: ["Antifungal treatments", "Antiparasitic treatments", "Vitamin A supplements"]
    ));

    _allCategories.add(CategoryModel(
        name: "Invertebrate Family",
        subCategories: ["Hermit Crab", "Tarantula", "Scorpion", "Snail"],
        vaccinations: ["Calcium supplements", "Antiparasitic treatments"]
    ));

    _allCategories.add(CategoryModel(
        name: "Exotic Pet Family",
        subCategories: ["Sugar Glider", "Iguana", "Chameleon"],
        vaccinations: ["Calcium and Vitamin D3 supplements", "Parasite prevention"]
    ));


  }
}
