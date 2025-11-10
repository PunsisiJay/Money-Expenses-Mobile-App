import 'package:expenzes_app/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonName;
  final Color buttonColor;

  const CustomButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: kMainColor,
      ),
      child: Center(
        child: Text(
          widget.buttonName,
          style: TextStyle(fontSize: 20, color: widget.buttonColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
