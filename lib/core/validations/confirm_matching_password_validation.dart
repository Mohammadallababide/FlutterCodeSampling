import 'package:flutter/material.dart';

String? confirmPasswordValidation(
    String confirmPassword, TextEditingController confirmPass) {
  if (confirmPassword.isEmpty) {
    return "Please Re-Enter New Password";
  } else if (confirmPassword.length < 8) {
    return "Password must be atleast 8 characters long";
  } else if (confirmPassword != confirmPass.text) {
    return "Password must be same as above";
  } else {
    return null;
  }
}
