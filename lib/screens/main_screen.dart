import 'package:expenzes_app/constant/colors.dart';
import 'package:expenzes_app/screens/add_new_screen.dart';
import 'package:expenzes_app/screens/budget_screen.dart';
import 'package:expenzes_app/screens/home_screen.dart';
import 'package:expenzes_app/screens/profile_screen.dart';
import 'package:expenzes_app/screens/transaction_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  final List<Widget> page = [
    HomeScreen(),
    TransactionScreen(),
    AddNewScreen(),
    BudgetdScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),

          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Transaction',
          ),

          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, size: 30, color: kWhite),
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_rounded),
            label: 'Budget',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      body: page[_currentIndex],
    );
  }
}
