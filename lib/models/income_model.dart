import 'package:flutter/material.dart';

enum IncomeCategory { salary, freelance, pasive, sales }

//Create Map for Income Category with Images
final Map<IncomeCategory, String> incomeCategoryImage = {
  IncomeCategory.salary: "assets/images/salary.png",
  IncomeCategory.freelance: "assets/images/freelance.png",
  IncomeCategory.pasive: "assets/images/passive.png",
  IncomeCategory.sales: "assets/images/bag.png",
};

//Create Map for Income Category with Colors
final Map<IncomeCategory, Color> incomeCategoryColor = {
  IncomeCategory.salary: Color(0XFFE57373),
  IncomeCategory.freelance: Color(0XFF81C784),
  IncomeCategory.pasive: Color(0XFF64B5F6),
  IncomeCategory.sales: Color(0XFFFFD54F),
};

class IncomeModel {
  final String id;
  final String title;
  final double amount;
  final String category;
  final DateTime time;
  final DateTime date;
  final String description;

  IncomeModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.time,
    required this.date,
    required this.description,
  });
}
