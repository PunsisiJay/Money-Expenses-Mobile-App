import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //Create a method as Future method for saving user data (username , email) to local storage
  static Future<void> saveUserData({
    required String userName,
    required String userEmail,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      //check if password and confirm password are the same
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password and confirm password do not match."),
          ),
        );
      } else {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("username", userName);
        await pref.setString("email", userEmail);

        //Show a snackbar message to indicate that user data is saved successfully.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User data saved successfully!")),
        );
      }
    } catch (err) {
      err.toString();
    }
  }

  //Check if the username already exists in the local storage
  static Future<bool> checkUserAvailable() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString('username');
    return userName != null;
  }

  //Create a method as Future method for getting username and email
  static Future<Map<String, String>> getUserNameandEmail() async {
    //Create instance from SharedPreferences.
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString('username');
    String? userEmail = pref.getString('email');
    return {'username': userName ?? '', 'email': userEmail ?? ''};
  }
}
