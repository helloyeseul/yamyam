import 'package:yamstack/data/repository/user/login/model/user_verify_model.dart';
import 'package:yamstack/view/common/exception/defined_ui_exceptions.dart';

class VerifyForm {
  VerifyForm(this.email);

  final String email;

  String authCode = '';

  String? authCodeError;

  bool isAuthCodeVerified = false;

  void validateInput() {
    if (authCode.length != 6) {
      throw const InvalidInputException('* 인증번호 6자리를 입력해주세요.');
    }
  }

  UserVerifyModel toModel() =>
      UserVerifyModel(email: email, authCode: authCode);
}
