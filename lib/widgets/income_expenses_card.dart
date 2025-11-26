import 'package:expenzes_app/constant/colors.dart';
import 'package:flutter/material.dart';

class IncomeExpenses extends StatefulWidget {
  final Color cardColor;
  final String cardName;
  final String cardAmount;
  final String cardImage;

  const IncomeExpenses({
    super.key,
    required this.cardColor,
    required this.cardName,
    required this.cardAmount,
    required this.cardImage,
  });

  @override
  State<IncomeExpenses> createState() => _IncomeExpensesState();
}

class _IncomeExpensesState extends State<IncomeExpenses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kWhite,
                ),
                child: Center(
                  child: Image.asset(
                    widget.cardImage,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.cardName,
                    style: TextStyle(
                      fontSize: 18,
                      color: kWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "\$ ${widget.cardAmount}",
                    style: TextStyle(
                      fontSize: 20,
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
