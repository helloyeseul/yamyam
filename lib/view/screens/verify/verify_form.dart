import 'package:yamstack/data/repository/user/login/model/user_verify_model.dart';

class VerifyForm {
  VerifyForm(this.email);

  final String email;

  String? _authCode;

  String get authCode => _authCode ?? '';

  String? authCodeError;

  set authCode(String? value) {
    _authCode = value;
  }

  void validateInput() {
    assert(
      _authCode?.isNotEmpty == true && _authCode!.length == 6,
      '* 인증번호 6자리를 입력해주세요.',
    );
  }

  UserVerifyModel toModel() => UserVerifyModel(
        email: email,
        authCode: authCode,
      );
}
