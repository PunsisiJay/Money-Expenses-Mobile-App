import 'package:expenzes_app/screens/main_screen.dart';
import 'package:expenzes_app/screens/onboarding_screen.dart';
import 'package:expenzes_app/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter"
      ),
      home: MainScreen()
      //OnboardingScreen()
      //UserScreen()
    );
  }
}