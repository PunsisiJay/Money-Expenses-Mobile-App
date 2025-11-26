import 'package:flutter/material.dart';

enum expensesCategory { food, transport, health, shopping, subscription }

//Create Map for Expenses Categories with Images
final Map<expensesCategory, String> expensesCategoryImage = {
  expensesCategory.food: "assets/images/resaurant.png",
  expensesCategory.transport: "assets/images/car.png",
  expensesCategory.health: "assets/images/health.png",
  expensesCategory.shopping: "assets/images/bag.png",
  expensesCategory.subscription: "assets/images/bill.png",
};

//Create Map for Expenses Categories with Colors
final Map<expensesCategory, Color> expensesCategoryColor = {
  expensesCategory.food: Color(0XFFE57373),
  expensesCategory.transport: Color(0XFF81C784),
  expensesCategory.health: Color(0XFF64B5F6),
  expensesCategory.shopping: Color(0XFFFFD54F),
  expensesCategory.subscription: Color(0XFF95875CD),
};

class ExpenseModel {
  final String id;
  final String titel;
  final double amount;
  final String category;
  final DateTime time;
  final DateTime date;
  final String description;

  ExpenseModel({
    required this.id,
    required this.titel,
    required this.amount,
    required this.category,
    required this.time,
    required this.date,
    required this.description,
  });
}
