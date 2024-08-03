import 'package:get/get.dart';
import 'package:petcare/controllers/authController.dart';
import 'package:petcare/controllers/petController.dart';
import 'package:petcare/controllers/profileCreateController.dart';

class InitControllers extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController(),permanent: true);
    Get.put(PetController(),permanent: true);
    Get.put(ProfileCreateController(),permanent: true);
  }

}