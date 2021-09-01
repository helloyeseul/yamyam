import 'package:get/get.dart';

/// 한글, 영어, 숫자
RegExp nonSpecialCharRegex = RegExp(r'^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9a-z]{1,10}$');

/// 숫자, 소문자/대문자, 특수문자 포함
RegExp passwordRegex = RegExp(
    r'(?=.*[0-9])(?=.*[A-Za-z])(?=.*[~!?@#$%^&*_-])[A-Za-z0-9~!?@#$%^&*_-]{8,16}$');

extension StringHelper on String {
  bool get isNotEmail => !isEmail;

  bool get isNickname => nonSpecialCharRegex.hasMatch(this);

  bool get isNotNickname => !isNickname;

  bool get isPassword => passwordRegex.hasMatch(this);

  bool get isNotPassword => !isPassword;
}

extension NullableStringHelper on String? {
  bool validateNotNull(bool Function(String? value) prediction) {
    return this != null && (this?.isNotEmpty ?? false) && prediction(this);
  }
}
