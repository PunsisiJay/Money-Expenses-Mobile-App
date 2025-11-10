import 'package:expenzes_app/constant/colors.dart';
import 'package:expenzes_app/data/onboarding_data.dart';
import 'package:expenzes_app/screens/onboarding/front_screen.dart';
import 'package:expenzes_app/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenzes_app/widgets/shared_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  PageController _controller = PageController();
  bool showDetailsPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            //Inside the Stack use Page View Widget.
            child: Stack(
              children: [
                //Page View
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3;
                      //print(showDetailsPage);
                    });                   
                  },                 
                  children: [
                    FrontScreen(),

                    SharedOnboardingScreen(
                      title: OnboardingData.onBordingDatList[0].heading, 
                      imageURL: OnboardingData.onBordingDatList[0].imagePath, 
                      description: OnboardingData.onBordingDatList[0].description
                    ),

                    SharedOnboardingScreen(
                      title: OnboardingData.onBordingDatList[1].heading, 
                      imageURL: OnboardingData.onBordingDatList[1].imagePath, 
                      description: OnboardingData.onBordingDatList[1].description,
                    ),

                    SharedOnboardingScreen(
                      title: OnboardingData.onBordingDatList[2].heading, 
                      imageURL: OnboardingData.onBordingDatList[2].imagePath, 
                      description: OnboardingData.onBordingDatList[2].description,
                    ),
                  ],
                ),

                //Page Indicator.
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller, 
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey
                    ),
                    ),
                ),

                //Button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          _controller.animateToPage(
                            _controller.page!.toInt() + 1, 
                            duration: Duration(milliseconds: 400), 
                            curve: Curves.easeInOut);
                        },
                        child: CustomButton(
                          buttonName: showDetailsPage ? "Get Started" : "Next", 
                          buttonColor: kWhite
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}