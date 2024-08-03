import 'package:get/get.dart';
import 'package:petcare/controllers/authController.dart';
import 'package:petcare/globals/functions.dart';
import 'package:petcare/views/auth/login.dart';
import 'package:petcare/views/dashboard/dashboard.dart';

class AuthService {
  AuthController _authController = Get.find<AuthController>();

  Future<void> validateOTP() async {
    _authController.setLoading(true);
   await Future.delayed(Duration(seconds: 2), ()async {
      _authController.setLoading(false);
       Get.offAll(DashboardScreen(),transition: Transition.circularReveal);
    });
  }
}
