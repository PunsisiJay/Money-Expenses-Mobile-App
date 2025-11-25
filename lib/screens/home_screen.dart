import 'package:expenzes_app/constant/colors.dart';
import 'package:expenzes_app/services/user_service.dart';
import 'package:expenzes_app/widgets/income_expenses_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Create a variable for store the username.
  String userName = '';

  @override
  void initState() {
    super.initState();
    UserService.getUserNameandEmail().then((value) {
      if (value['username'] != null) {
        if (mounted) {
          setState(() {
            userName = value['username']!;
          });
        } else {
          userName = 'Guest';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 176, 158, 213),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Top Container
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 176, 158, 213),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  //User Image Container
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: kMainColor,
                                      border: Border.all(
                                        color: kMainColor,
                                        width: 4,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        'assets/images/user.jpg',
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),

                                //Welcome Text
                                Text(
                                  'Welcome ${userName}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: kMainColor,
                                  ),
                                ),
                                //Notification Icon Button
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications,
                                      color: kMainColor,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 30),

                            //Income and expenses card containers.
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IncomeExpenses(
                                    cardColor: kGreen,
                                    cardName: "Income",
                                    cardAmount: '2000',
                                    cardImage: 'assets/images/income.png',
                                  ),
                                  IncomeExpenses(
                                    cardColor: kRed,
                                    cardName: 'Expenses',
                                    cardAmount: '1000',
                                    cardImage: 'assets/images/expense.png',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            //Text: Spend Frequency
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Spend Frequency",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
