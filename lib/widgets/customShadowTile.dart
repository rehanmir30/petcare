import 'package:flutter/material.dart';
import 'package:petcare/constants/colors.dart';

class CustomShadowTile extends StatelessWidget {
  final child;
  const CustomShadowTile(this.child,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 8,left: 8,right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: rGreyShade.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],

        ),
        child: child
    );
  }
}