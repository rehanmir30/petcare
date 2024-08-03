import 'package:flutter/material.dart';
import 'package:petcare/constants/colors.dart';

class ColoredBg extends StatefulWidget {
  const ColoredBg({super.key});

  @override
  State<ColoredBg> createState() => _ColoredBgState();
}

class _ColoredBgState extends State<ColoredBg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: rWhiteShade,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.5,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [rWhite, rWhiteShade],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
        ),
      ),
    );
  }
}
