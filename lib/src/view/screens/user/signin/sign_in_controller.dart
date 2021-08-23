import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _emailText = ''.obs;
  final _passwordText = ''.obs;

  String get emailText => _emailText.value;

  String get passwordText => _passwordText.value;

  void onEmailChanged(String email) {
    _emailText(emailTextController.text);
  }

  void onPasswordChanged(String password) {
    _passwordText(passwordTextController.text);
  }

  void onSignInButtonClicked() {}

  bool get isAllFieldNotEmpty =>
      _emailText.value.isNotEmpty && _passwordText.value.isNotEmpty;
}
