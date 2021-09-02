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

  final _inputDebounce = ''.obs;

  final _verifyForm = VerifyForm(
    Get.arguments[VerifyScreen.ARGUMENT_KEY_EMAIL].toString(),
  ).obs;

  VerifyForm get verifyForm => _verifyForm.value;

  @override
  void onInit() {
    super.onInit();
    debounce(
      _inputDebounce,
      (callback) {
        print(callback);
        _verifyCode();
      },
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
        .then((value) => null)
        .onError((error, stackTrace) {
      if (error is VerifyFailException) {
        SingleMessageDialog(error.message).show();
      }
    });
  }

  void onPressDone() {
    Get.offNamed(WelcomeScreen.route);
  }

  void _verifyCode() {
    try {
      verifyForm.validateInput();
      _repository.verify(verifyForm.toModel()).then(
        (value) {
          _verifyForm.update((form) {
            form!.authCodeError = value;
          });
        },
      ).onError((error, stackTrace) {
        if (error is VerifyFailException) {
          _verifyForm.update((form) {
            form!.authCodeError = error.message;
          });
        }
      });
    } on AssertionError catch (e) {
      _verifyForm.update((form) {
        form!.authCodeError = e.message.toString();
      });
    }
  }
}
