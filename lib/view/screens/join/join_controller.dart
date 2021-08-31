import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/view/screens/join/user_join_form.dart';

enum Controllers { email, name, password, passwordRepeat }

class JoinController extends GetxController {
  JoinController(this.repository);

  final UserLoginRepository repository;

  final Map<Controllers, TextEditingController> controllers =
      HashMap<Controllers, TextEditingController>();

  final _joinForm = UserJoinForm().obs;

  UserJoinForm get joinForm => _joinForm.value;

  void onPressNameCheck() {
    final name = joinForm.name;

    if (name.isBlank ?? true) {
      // 닉네임을 입력해주세요
      return;
    }

    _observeNameCheck(name!);
  }

  void _observeNameCheck(final String name) {
    repository.checkName(name).then((value) {
      // 사용 가능한 닉네임 입니다
      print('사용 가능한 닉네임 입니다');
    }).onError((error, stackTrace) {
      // 중복된 닉네임이 존재합니다.
      print('중복된 닉네임이 존재합니다');
    });
  }

  void onPressAgreeWithTerms() {
    joinForm.toggleAgreeWithTerms();
  }

  void onPressJoin() {
    try {
      repository.join(joinForm.toModel());
    } on AssertionError catch (e) {
      // 화면에 에러 메시지 표시
      print(e.message);
    }
  }

  @override
  void onClose() {
    controllers.forEach((key, value) => value.dispose());
    super.onClose();
  }
}
