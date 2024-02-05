import 'package:flutter/material.dart';
import 'package:hassan_s_application/core/app_export.dart';
import 'package:hassan_s_application/presentation/sign_up_screen/models/sign_up_model.dart';

/// A provider class for the SignUpScreen.
///
/// This provider manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpProvider extends ChangeNotifier {
  TextEditingController firstNameRowController = TextEditingController();

  TextEditingController lastNameRowController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  SignUpModel signUpModelObj = SignUpModel();

  String genderRadioGroup = "";

  @override
  void dispose() {
    super.dispose();
    firstNameRowController.dispose();
    lastNameRowController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
  }

  void changeRadioButton1(String value) {
    genderRadioGroup = value;
    notifyListeners();
  }
}
