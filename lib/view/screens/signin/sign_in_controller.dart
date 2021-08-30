import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/view/screens/signin/sign_in_user_model.dart';

class SignInController extends GetxController {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _signInUser = SignInUserModel().obs;

  SignInUserModel get signInUser => _signInUser.value;

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

  void onSignInButtonClicked() {}

  bool get isAllFieldNotEmpty =>
      _signInUser.value.email.isNotEmpty &&
      _signInUser.value.password.isNotEmpty;
}
