import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamstack/data/exception/defined_exceptions.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
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
    ever(_joinForm, (_) {
      _isFormCompleted.value = joinForm.isFormCompleted;
    });
  }

  void onEmailChanged(String value) {
    _joinForm.update((form) {
      form!.email = value;
    });
  }

  void onNameChanged(String value) {
    _joinForm.update((form) {
      form!.name = value;
    });
  }

  void onPasswordChanged(String value) {
    _joinForm.update((form) {
      form!.password = value;
    });
  }

  void onPasswordRepeatChanged(String value) {
    _joinForm.update((form) {
      form!.passwordRepeat = value;
    });
  }

  void onPressNameCheck() {
    final name = joinForm.name;
    if (name == null || name.isEmpty) return;
    _observeNameCheck(name);
  }

  void onPressAgreeWithTerms(bool? agree) {
    _joinForm.update((form) {
      form!.isAgreeWithTerms = agree!;
    });
  }

  void onPressJoin() {
    try {
      joinForm.validateInput();
      repository.join(joinForm.toModel()).then((_) {
        Get.offNamed(
          VerifyScreen.route,
          arguments: {VerifyScreen.ARGUMENT_KEY_EMAIL: joinForm.email},
        );
      }).onError(
        (error, stackTrace) {
          if (error is FormatException) {
            SingleMessageDialog(error.message).show();
          }
        },
      );
    } on AssertionError catch (e) {
      SingleMessageDialog(e.message.toString()).show();
    }
  }

  void _observeNameCheck(final String name) {
    repository.checkName(name).then((message) {
      joinForm.isNameValidated = true;
      SingleMessageDialog(message).show();
    }).onError(
      (error, stackTrace) {
        joinForm.isNameValidated = false;
        if (error is DuplicatedNameException) {
          SingleMessageDialog(error.message).show();
        }
      },
    );
  }

  @override
  void onClose() {
    textControllers.forEach((key, value) => value.dispose());
    super.onClose();
  }
}
