import 'package:flutter/material.dart';
import 'package:petcare/constants/colors.dart';

class CustomDialogShadow extends StatelessWidget {
  final child;
  const CustomDialogShadow(this.child,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26.0),
          boxShadow: [
            BoxShadow(
              color: rGreyShade.withOpacity(0.6),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, -2), // changes position of shadow
            ),
          ],

        ),
        child: child
    );
  }
}