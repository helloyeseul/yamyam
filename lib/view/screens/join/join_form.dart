import 'dart:core';

import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';
import 'package:yamstack/extensions/string_helper.dart';
import 'package:yamstack/view/common/exception/defined_ui_exceptions.dart';

class JoinForm {
  String _email = '';
  String _name = '';
  String _password = '';
  String _passwordRepeat = '';

  bool isAgreeWithTerms = false;
  bool isNameValidated = false;

  String? emailFormatError;
  String? nameFormatError;
  String? passwordFormatError;
  String? passwordRepeatError;

  String get name => _name;

  String get email => _email;

  bool get isFormCompleted =>
      _email.isNotEmpty == true &&
      _name.isNotEmpty == true &&
      _password.isNotEmpty == true &&
      _passwordRepeat.isNotEmpty == true;

  set email(String value) {
    if (value.isNotEmpty && value.isNotEmail) {
      emailFormatError = _emailFormatErrorMessage;
    } else {
      emailFormatError = null;
    }
    _email = value;
  }

  set name(String value) {
    if (_name != value) isNameValidated = false;
    if (value.isNotEmpty && value.isNotNickname) {
      nameFormatError = _nameFormatError;
    } else {
      nameFormatError = null;
    }
    _name = value;
  }

  set password(String value) {
    if (value.isNotEmpty && value.isNotPassword) {
      passwordFormatError = _passwordFormatError;
    } else {
      passwordFormatError = null;
    }
    _password = value;
  }

  set passwordRepeat(String value) {
    if (value.isNotEmpty && value != _password) {
      passwordRepeatError = _passwordRepeatError;
    } else {
      passwordRepeatError = null;
    }
    _passwordRepeat = value;
  }

  void validateInput() {
    if (_email.isEmpty) {
      throw const InvalidInputException('이메일을 입력해주세요');
    }
    if (_name.isEmpty) {
      throw const InvalidInputException('닉네임을 입력해주세요');
    }
    if (isNameValidated != true) {
      throw const InvalidInputException('닉네임 중복확인을 진행해주세요');
    }
    if (_password.isEmpty) {
      throw const InvalidInputException('비밀번호를 입력해주세요');
    }
    if (_passwordRepeat != _password) {
      throw const InvalidInputException('비밀번호가 일치하지 않습니다');
    }
    if (isAgreeWithTerms != true) {
      throw const InvalidInputException('약관에 동의해주세요.');
    }
  }

  UserJoinModel toModel() =>
      UserJoinModel(email: _email, name: _name, password: _password);

  static const String _emailFormatErrorMessage = '* 이메일 형식이 올바르지 않습니다.';
  static const String _nameFormatError = '* 닉네임은 한글, 영어, 숫자만 가능합니다.';
  static const String _passwordFormatError =
      '* 영문,숫자,특수문자를 포함하여 8~16자리로 설정해주세요.';
  static const String _passwordRepeatError = '* 비밀번호가 일치하지 않습니다';
}
