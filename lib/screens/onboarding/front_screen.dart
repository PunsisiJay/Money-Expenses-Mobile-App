import 'package:expenzes_app/constant/colors.dart';
import 'package:flutter/material.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", width: 100, fit: BoxFit.cover,),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text("Expenze", style: TextStyle(
            fontSize: 40,
            color: kMainColor,
            fontWeight: FontWeight.bold
          ),),
        )
      ],
    );
  }
}