import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamstack/data/exception/defined_data_exceptions.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/view/common/exception/defined_ui_exceptions.dart';
import 'package:yamstack/view/screens/join/components/join_name_check_dialog.dart';
import 'package:yamstack/view/screens/join/join_form.dart';
import 'package:yamstack/view/screens/verify/verify_screen.dart';

enum Field { email, name, password, passwordRepeat }

class JoinController extends GetxController {
  JoinController(this.repository);

  final UserLoginRepository repository;

  final Map<Field, TextEditingController> textControllers =
      <Field, TextEditingController>{
    Field.email: TextEditingController(),
    Field.name: TextEditingController(),
    Field.password: TextEditingController(),
    Field.passwordRepeat: TextEditingController(),
  };

  final _joinForm = JoinForm().obs;

  JoinForm get joinForm => _joinForm.value;

  final _isFormCompleted = false.obs;

  bool get isFormCompleted => _isFormCompleted.isTrue;

  @override
  void onInit() {
    super.onInit();
    // joinForm 내용이 바뀔때마다 isFormCompleted 값도 바꾸도록
    ever(_joinForm, (_) => _isFormCompleted(joinForm.isFormCompleted));
  }

  void onEmailChanged(String value) {
    _joinForm.update((form) => form!.email = value);
  }

  void onNameChanged(String value) {
    _joinForm.update((form) => form!.name = value);
  }

  void onPasswordChanged(String value) {
    _joinForm.update((form) => form!.password = value);
  }

  void onPasswordRepeatChanged(String value) {
    _joinForm.update((form) => form!.passwordRepeat = value);
  }

  void onPressNameCheck() {
    final name = joinForm.name;
    if (name.isEmpty) return;
    _runNameCheck(name);
  }

  void onPressAgreeWithTerms(bool? agree) {
    _joinForm.update((form) => form!.isAgreeWithTerms = agree!);
  }

  Future<void> onPressJoin() async {
    try {
      joinForm.validateInput();
      await repository.join(joinForm.toModel());
      await Get.offNamed(
        VerifyScreen.route,
        arguments: {VerifyScreen.ARGUMENT_KEY_EMAIL: joinForm.email},
      );
    } on InvalidInputException catch (e) {
      SingleMessageDialog(e.message).show();
    } on DefinedDataException catch (e) {
      SingleMessageDialog(e.message).show();
    }
  }

  Future<void> _runNameCheck(final String name) async {
    var message = '';
    try {
      joinForm.isNameValidated = false;
      message = await repository.checkName(name);
      joinForm.isNameValidated = true;
    } on DefinedDataException catch (e) {
      message = e.message;
    } finally {
      SingleMessageDialog(message).show();
    }
  }

  @override
  void onClose() {
    textControllers.forEach((key, value) => value.dispose());
    super.onClose();
  }
}
