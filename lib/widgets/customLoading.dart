import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare/constants/colors.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({super.key});

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: rGreyShade.withOpacity(0.5)),
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            child: Lottie.asset("assets/animations/loading.json", fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
