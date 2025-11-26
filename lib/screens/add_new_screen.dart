import 'package:expenzes_app/constant/colors.dart';
import 'package:expenzes_app/constant/constant.dart';
import 'package:expenzes_app/models/expense_model.dart';
import 'package:expenzes_app/models/income_model.dart';
import 'package:flutter/material.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  //create state variable as : 0 for expense and 1 for income.
  int _selectedTab = 0;

  //create state variable for expense and income.
  IncomeCategory _selectedIncomecategory = IncomeCategory.salary;
  expensesCategory _selectedExpenseCategory = expensesCategory.food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedTab == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kWhite,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: _selectedTab == 0 ? kRed : kWhite,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 12,
                            ),
                            child: Text(
                              "Expense",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: _selectedTab == 0 ? kWhite : kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: _selectedTab == 1 ? kGreen : kWhite,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 12,
                            ),
                            child: Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: _selectedTab == 1 ? kWhite : kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Amount Field Container.
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How Much? ",
                        style: TextStyle(
                          fontSize: 22,
                          color: kLightGrey.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      TextField(
                        style: TextStyle(
                          fontSize: 60,
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "0",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: kWhite,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //User Data Form.
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.26,
                ),
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: kWhite,
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        //Dropdown Button : Category.
                        DropdownButtonFormField(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          decoration: InputDecoration(
                            hintText: "Category",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: kLightGrey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(color: kLightGrey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: kDefaultPadding,
                              horizontal: 20,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kLightGrey),
                            ),
                          ),

                          items: _selectedTab == 0
                              ? expensesCategory.values.map((types) {
                                  return DropdownMenuItem(
                                    value: types,
                                    child: Text(types.name),
                                  );
                                }).toList()
                              : IncomeCategory.values.map((types) {
                                  return DropdownMenuItem(
                                    value: types,
                                    child: Text(types.name),
                                  );
                                }).toList(),
                          value: _selectedTab == 0
                              ? _selectedExpenseCategory
                              : _selectedIncomecategory,
                          onChanged: (value) {
                            setState(() {
                              _selectedTab == 0
                                  ? _selectedExpenseCategory =
                                        value as expensesCategory
                                  : _selectedIncomecategory =
                                        value as IncomeCategory;

                              print(
                                _selectedTab == 0
                                    ? _selectedExpenseCategory.name
                                    : _selectedIncomecategory.name,
                              );
                            });
                          },
                        ),

                        SizedBox(height: 20),

                        //Text Form Field : Title
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Title",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: kLightGrey,
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: 20,
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        //Text Form field :  Description
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Description",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: kLightGrey,
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: 20,
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        //Text Form field : Amount
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Amount",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: kLightGrey,
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
