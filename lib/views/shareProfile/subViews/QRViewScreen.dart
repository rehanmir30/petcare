import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/models/petModel.dart';
import 'package:petcare/widgets/customShadowTile.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../constants/colors.dart';

class QRViewScreen extends StatefulWidget {
  final PetModel _petModel;

  const QRViewScreen(this._petModel, {super.key});

  @override
  State<QRViewScreen> createState() => _QRViewScreenState();
}

class _QRViewScreenState extends State<QRViewScreen> {
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            color: rBg,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomShadowTile(
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        color: rWhite, borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: rBg,
                        shape: BoxShape.circle,
                        border: Border.all(color: rWhite, width: 8)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: rWhite,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/placeholder.png"))),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${widget._petModel.name}",
                      style: TextStyle(
                          color: rTextBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    QrImageView(
                      data: "${widget._petModel.name}",
                      version: QrVersions.auto,
                      size: 200,
                      gapless: false,
                      // embeddedImage: AssetImage('assets/images/placeholder.png'), // Optional logo in the center
                      // embeddedImageStyle: QrEmbeddedImageStyle(
                      //   size: Size(40, 40),
                      // ),
                      eyeStyle: QrEyeStyle(
                        eyeShape: QrEyeShape.circle,
                        color: Colors.black,
                      ),
                      dataModuleStyle: QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ).marginSymmetric(horizontal: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: rGrey.withOpacity(0.5),
          ).marginSymmetric(horizontal: 20),
          SizedBox(
            height: 20,
          ),

          CustomShadowTile(Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              color: rWhite,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Text("Share QR code",style: TextStyle(color: rTextBlack,fontWeight: FontWeight.w600),),
                Expanded(child: Align(
                  alignment: Alignment.centerRight,
                  child: Lottie.asset("assets/animations/share.json",width: 40,height: 40),
                ))
              ],
            ).marginSymmetric(horizontal: 12),
          )).marginSymmetric(horizontal: 20),
        ],
      ),
    );
  }
}
