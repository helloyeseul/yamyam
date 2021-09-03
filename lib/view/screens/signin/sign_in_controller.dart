import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/data/exception/defined_data_exceptions.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/view/screens/join/components/join_name_check_dialog.dart';
import 'package:yamstack/view/screens/main/main_screen.dart';
import 'package:yamstack/view/screens/signin/sign_in_form.dart';
import 'package:yamstack/view/screens/verify/verify_screen.dart';

class SignInController extends GetxController {
  SignInController(this.repository);

  final UserLoginRepository repository;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _signInForm = SignInForm().obs;

  SignInForm get signInForm => _signInForm.value;

  final _isFormCompleted = false.obs;

  bool get isFormCompleted => _isFormCompleted.isTrue;

  @override
  void onInit() {
    super.onInit();
    ever(_signInForm, (_) => _isFormCompleted(signInForm.isFormCompleted));
  }

  void onEmailChanged(String email) {
    _signInForm.update((form) => form!.email = email);
  }

  void onPasswordChanged(String password) {
    _signInForm.update((form) => form!.password = password);
  }

  Future<void> onSignInButtonClicked() async {
    try {
      await repository.signIn(signInForm.toModel());
      await Get.offAllNamed(MainScreen.route);
    } on VerifyRequiredException catch (_) {
      await Get.toNamed(
        VerifyScreen.route,
        arguments: {VerifyScreen.ARGUMENT_KEY_EMAIL: signInForm.email},
      );
    } on DefinedDataException catch (e) {
      SingleMessageDialog(e.message).show();
    }
  }
}
