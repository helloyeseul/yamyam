import 'dart:core';

import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';
import 'package:yamstack/extensions/assert_helper.dart';

class UserJoinForm {
  String? email;
  String? _name;
  String? password;
  String? passwordRepeat;
  bool isAgreeWithTerms = false;
  bool _passNameCheck = false;

  bool get isNameBlank => name?.isEmpty ?? true;

  bool get isEmailBlank => email?.isEmpty ?? true;

  set name(String? value) {
    _passNameCheck = false;
    _name = value;
  }

  String? get name => _name;

  void toggleAgreeWithTerms() {
    isAgreeWithTerms = !isAgreeWithTerms;
  }

  UserJoinModel toModel() {
    assert(email?.isNotEmpty == true, '이메일을 입력하세요');
    assert(_name?.isNotEmpty == true, '닉네임을 입력하세요');
    assert(password?.isNotEmpty == true, '비밀번호를 입력하세요');
    assert(passwordRepeat == password, '비밀번호가 다릅니다');
    assert(_passNameCheck == true, '닉네임 중복체크를 해주세요');
    assert(isAgreeWithTerms == true, '약관에 동의해주세요');

    return UserJoinModel(
      email: assertNotEmpty(email, '이메일을 입력하세요'),
      name: assertNotEmpty(_name, '닉네임을 입력하세요'),
      password: assertNotEmpty(password, '비밀번호를 입력하세요'),
    );
  }
}
