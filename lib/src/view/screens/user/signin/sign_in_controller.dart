import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_user_model.dart';

class SignInController extends GetxController {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _signInUser = SignInUserModel().obs;

  SignInUserModel get signInUser => _signInUser.value;

  String get emailText => _signInUser.value.email;

  String get passwordText => _signInUser.value.password;

  void onEmailChanged(String email) {
    _signInUser.update((user) {
      (user ??= SignInUserModel()).email = email;
    });
  }

  void onPasswordChanged(String password) {
    _signInUser.update((user) {
      (user ??= SignInUserModel()).password = password;
    });
  }

  void onSignInButtonClicked() {
    print(signInUser);
  }

  bool get isAllFieldNotEmpty =>
      emailText.isNotEmpty && passwordText.isNotEmpty;
}
