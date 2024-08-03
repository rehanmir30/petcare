import 'package:flutter/material.dart';
import 'package:petcare/constants/colors.dart';

class CustomButton extends StatefulWidget {
  final btnText;
  final onTap;
  const CustomButton(this.btnText,this.onTap,{super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: primary
        ),
        child: Text("${widget.btnText}",style: TextStyle(color: rWhite),),
      ),
    );
  }
}
