import 'package:get/get.dart';

import '../models/petModel.dart';

class PetController extends GetxController{
  List<PetModel> _allPets=[];
  List<PetModel> get allPets=>_allPets;

  addPetToList(PetModel value){
    _allPets.add(value);
    update();
  }
  clearPetList(){
    _allPets.clear();
    update();
  }
}