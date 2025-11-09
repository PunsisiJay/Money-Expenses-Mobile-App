import 'package:flutter/material.dart';

void main(){
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
      home: Scaffold(
        body: Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}