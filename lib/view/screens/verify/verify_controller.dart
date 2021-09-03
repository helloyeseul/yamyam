import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamstack/data/exception/defined_exceptions.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/view/screens/join/components/join_name_check_dialog.dart';
import 'package:yamstack/view/screens/verify/verify_form.dart';
import 'package:yamstack/view/screens/verify/verify_screen.dart';
import 'package:yamstack/view/screens/welcome/welcome_screen.dart';

class VerifyController extends GetxController {
  VerifyController(this._repository);

  final UserLoginRepository _repository;

  final authCodeController = TextEditingController();

  final _verifyForm = VerifyForm(
    Get.arguments[VerifyScreen.ARGUMENT_KEY_EMAIL].toString(),
  ).obs;

  VerifyForm get verifyForm => _verifyForm.value;

  final _isVerifyCompleted = false.obs;

  bool get isVerifyCompleted => _isVerifyCompleted.isTrue;

  final _inputDebounce = ''.obs;

  @override
  void onInit() {
    super.onInit();
    debounce(
      _inputDebounce,
      (value) => _processVerifyAuthCode(),
      time: const Duration(milliseconds: 200),
    );
  }

  void onAuthCodeChanged(String? text) {
    if (text != verifyForm.authCode) {
      _inputDebounce.value = text ?? '';
      _verifyForm.update((form) {
        form!.authCode = text;
      });
    }
  }

  void onPressResendAuthCode() {
    _repository
        .resendAuthCode(verifyForm.email)
        .then((message) => SingleMessageDialog(message).show())
        .onError((error, stackTrace) {
      if (error is VerifyAuthCodeFailException) {
        SingleMessageDialog(error.message).show();
      }
    });
  }

  void onPressDone() {
    Get.offNamed(WelcomeScreen.route);
  }

  void _updateFormErrorMessage(String? message) {
    _verifyForm.update((form) {
      form!.authCodeError = message;
    });
  }

  void _processVerifyAuthCode() {
    try {
      verifyForm.validateInput();
      _updateFormErrorMessage(null);
      _repository
          .verify(verifyForm.toModel())
          .then(_isVerifyCompleted)
          .onError((error, stackTrace) {
        if (error is VerifyAuthCodeFailException) {
          _updateFormErrorMessage(error.message);
        }
        throw error ?? const UnknownException();
      });
    } on AssertionError catch (e) {
      _updateFormErrorMessage(e.message.toString());
    }
  }
}
