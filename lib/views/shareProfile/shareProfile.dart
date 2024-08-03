import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/constants/colors.dart';
import 'package:petcare/views/shareProfile/subViews/QRScanner.dart';
import 'package:petcare/views/shareProfile/subViews/generateQR.dart';

class ShareProfile extends StatefulWidget {
  const ShareProfile({super.key});

  @override
  State<ShareProfile> createState() => _ShareProfileState();
}

class _ShareProfileState extends State<ShareProfile> {
  int _selectedIndex = 0;

  var selectedScreen;


  @override
  void initState() {
    setState(() {
      selectedScreen=GenerateQR();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rBg,
      appBar: AppBar(
        title: Text(
          "Sharing profiles",
          style: TextStyle(color: rTextBlack, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: rGrey.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: rGreyShade.withOpacity(0.5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                          selectedScreen=GenerateQR();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? rYellow
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Generate Code',
                          style: TextStyle(
                            color: _selectedIndex == 0 ? Colors.white : rGreyShade,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ).marginOnly(left: 2,top: 2,bottom: 2),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                          selectedScreen=QRScanner();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1
                              ? rYellow
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Scan Code',
                          style: TextStyle(
                            color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ).marginOnly(right: 2,top: 2,bottom: 2),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: selectedScreen)
          ],
        ),
      ),
    );
  }
}
