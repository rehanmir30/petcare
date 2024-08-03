import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


final removeBgAPIKey="451gteZpG2hwtaLt3Pmo3Ph1";
nextScreen(var Screen){
  return ()=> Get.to(Screen,transition: Transition.leftToRight);
}
nextScreenAndRemoveAll(var nextScreen){
  return ()=> Get.offAll(nextScreen,transition: Transition.leftToRight);
}