import 'package:expenzes_app/models/onboarding_model.dart';

class OnboardingData {

  //  OnboardingModel data1 = OnboardingModel(
  //   heading: "Gain Total Control of your Money", 
  //   imagePath: "assets/images/onboard_1.png", 
  //   description: "Become your own money manager."
  // );

  static final List<OnboardingModel> onBordingDatList = [
    
    OnboardingModel(
      heading: "Gain Total Control of your Money", 
      imagePath: "assets/images/onboard_1.png", 
      description: "Become your own money manager \n and make every cent count"
      ),

    OnboardingModel(
      heading: "Know where your money goes", 
      imagePath: "assets/images/onboard_2.png", 
      description: "Track your transaction easily, \n with categories and financial reports"
      ),
    
    OnboardingModel(
      heading: "Planning ahead", 
      imagePath: "assets/images/onboard_3.png", 
      description: "Setup your budget for each category \n so you in control"
    )
  ];
}