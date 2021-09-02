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
      joinForm.isAgreeWithTerms = agree!;
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
            _showSingleMessageDialog(error.message);
          }
        },
      );
    } on AssertionError catch (e) {
      _showSingleMessageDialog(e.message.toString());
    }
  }

  void _observeNameCheck(final String name) {
    repository.checkName(name).then((message) {
      joinForm.isNameValidated = true;
      _showSingleMessageDialog(message);
    }).onError(
      (error, stackTrace) {
        joinForm.isNameValidated = false;
        if (error is DuplicatedNameException) {
          _showSingleMessageDialog(error.message);
        }
      },
    );
  }

  void _showSingleMessageDialog(final String message) {
    Get.dialog(JoinNameCheckDialog(message: message));
  }

  @override
  void onClose() {
    textControllers.forEach((key, value) => value.dispose());
    super.onClose();
  }
}
