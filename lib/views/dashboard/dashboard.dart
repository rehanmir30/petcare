import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_rembg/local_rembg.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/constants/colors.dart';
import 'package:petcare/controllers/profileCreateController.dart';
import 'package:petcare/views/navScreens/about.dart';

import '../navScreens/home.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  File? _image;
  LocalRembgResultModel? localRembgResultModel;

  Home _home=Home();
  About _about=About();
  late var _selectedScreen;
  String titleTxt="Home";

  @override
  void initState() {
    Get.find<ProfileCreateController>().setAllCategories();
    setState(() {
      _selectedScreen=_home;
    });
  } // Future<void> _pickImage() async {
  //   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

  // Future<void> removeBackground() async {
  //    localRembgResultModel = await LocalRembg.removeBackground(
  //       imagePath:_image!.path,
  //       // Your Image Path ,
  //       // imageUint8List: // Your image Uint8List (only supported on iOS) ,
  //       cropTheImage: false// Crop the segmented image (Default true) ,
  //   );
  //    setState(() {
  //      localRembgResultModel;
  //    });
  // }
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primary, primary.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 1.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/splashDog.png',
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _selectedScreen=_home;
                      titleTxt="Home";
                      _advancedDrawerController.hideDrawer();
                    });
                  },
                  // leading: Lottie.asset("assets/animations/home.json",width: 30,height: 30),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex:1,
                        child:Lottie.asset("assets/animations/home.json",width: 30,height: 30),),
                      Expanded(
                          flex:3,
                          child: Text('Home')),

                    ],
                  ),
                ),
                ListTile(
                  onTap: () {},
                  // leading: Icon(Icons.account_circle_rounded),
                  title: Row(
                    children: [
                      Expanded(flex: 1,child: Icon(Icons.account_circle_rounded),),
                      Expanded(
                          flex:3,
                          child: Text('Profile')),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _selectedScreen=_about;
                      titleTxt="About us";
                      _advancedDrawerController.hideDrawer();
                    });
                  },
                  title: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: Lottie.asset("assets/animations/about.json",width: 30,height: 30),),
                      Expanded(
                          flex: 3,
                          child: Text('About')),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {},
                  // leading: Lottie.asset("assets/animations/settings.json",width: 30,height: 30),
                  title: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: Lottie.asset("assets/animations/settings.json",width: 30,height: 30),),
                      Expanded(
                          flex:3,
                          child: Text('Settings')),
                    ],
                  ),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("$titleTxt"),
          centerTitle: true,
          backgroundColor: rBg,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: _selectedScreen,
      ),
    );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
