import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamstack/data/exception/defined_data_exceptions.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/view/common/exception/defined_ui_exceptions.dart';
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

  final _isVerifyCompleted = false.obs;

  bool get isVerifyCompleted => _isVerifyCompleted.isTrue;

  @override
  void onInit() {
    super.onInit();
    debounce(
      _inputDebounce,
      (value) => _processVerifyAuthCode(),
      time: const Duration(milliseconds: 200),
    );
  }

  void onAuthCodeChanged(final String text) {
    if (text != verifyForm.authCode) {
      _inputDebounce.value = text;
      _verifyForm.update((form) {
        form!.authCode = text;
      });
    }
  }

  Future<void> onPressResendAuthCode() async {
    var message = '';
    try {
      message = await _repository.resendAuthCode(verifyForm.email);
    } on DefinedDataException catch (e) {
      message = e.message;
    } finally {
      SingleMessageDialog(message).show();
    }
  }

  void onPressDone() {
    Get.offNamed(WelcomeScreen.route);
  }

  void _updateFormErrorMessage(String? message) {
    _verifyForm.update((form) => form!.authCodeError = message);
  }

  Future<void> _processVerifyAuthCode() async {
    String? message;

    try {
      verifyForm.validateInput();
      await _repository.verify(verifyForm.toModel());
      _isVerifyCompleted(true);
    } on InvalidInputException catch (e) {
      message = e.message;
    } on DefinedDataException catch (e) {
      message = e.message;
    } finally {
      _updateFormErrorMessage(message);
    }
  }
}
