import 'package:flutter/material.dart';

class BudgetdScreen extends StatefulWidget {
  const BudgetdScreen({super.key});

  @override
  State<BudgetdScreen> createState() => _BudgetdScreenState();
}

class _BudgetdScreenState extends State<BudgetdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Screen'),
      ),
    );
  }
}