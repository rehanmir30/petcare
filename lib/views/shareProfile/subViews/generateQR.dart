import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/constants/colors.dart';
import 'package:petcare/controllers/petController.dart';
import 'package:petcare/models/petModel.dart';
import 'package:petcare/widgets/customShadowTile.dart';

import 'QRViewScreen.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PetController>(
        builder: (controller) {
          return Column(
            children: [
              ListView.builder(
                itemCount: controller.allPets.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return PetTile(controller.allPets[index]);
                }),
              SizedBox(height: 20,),
              Text("Generate a QR code and invite link for each pet and easily share profile with other users",textAlign: TextAlign.center,style: TextStyle(color: rGreyShade.withOpacity(0.6)),).marginSymmetric(horizontal: 20)
            ],
          );
        },
      ),
    );
  }
}

class PetTile extends StatefulWidget {
  final PetModel _petModel;
  const PetTile(this._petModel,{super.key});

  @override
  State<PetTile> createState() => _PetTileState();
}

class _PetTileState extends State<PetTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        Get.to(QRViewScreen(widget._petModel),transition: Transition.downToUp);
      },
      child: CustomShadowTile(Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
          color: rWhite,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/placeholder.png"),
                  fit: BoxFit.contain
                )
              ),
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget._petModel.name}",style: TextStyle(color: rTextBlack,fontWeight: FontWeight.w600,fontSize: 16),),
                Text("${widget._petModel.category} | ${widget._petModel.subCategory}",style: TextStyle(color: rGreyShade,fontWeight: FontWeight.normal,fontSize: 16),),

              ],
            ).marginSymmetric(horizontal: 12))
          ],
        ).marginSymmetric(horizontal: 12),
      )).marginSymmetric(horizontal: 8,vertical: 4),
    );
  }
}

