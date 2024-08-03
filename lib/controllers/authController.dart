import 'package:get/get.dart';

class AuthController extends GetxController{
  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  setLoading(bool value){
    _isLoading=value;
    update();
  }

}