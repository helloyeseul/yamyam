import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yamstack/data/exception/defined_data_exceptions.dart';
import 'package:yamstack/data/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/data/remote/api/user/login/user_login_api.dart';
import 'package:yamstack/data/remote/interceptor/error_interceptor.dart';
import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';
import 'package:yamstack/data/repository/user/login/model/user_sign_in_model.dart';
import 'package:yamstack/data/repository/user/login/model/user_verify_model.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/data/shared/preference_constants.dart';

class UserLoginRepositoryImpl implements UserLoginRepository {
  UserLoginRepositoryImpl(this.api);

  final UserLoginApi api;

  @override
  Future<void> checkEmail(String email) async {
    try {
      final response = await api.emailCheck(email);
      if (response.message != 'true') throw const DuplicatedEmailException();
    } on DioError catch (e) {
      throw e.error as DefinedDataException;
    }
  }

  @override
  Future<String> checkName(String name) async {
    try {
      final response = await api.nameCheck(name);
      if (response.message != 'true') throw const DuplicatedNameException();
    } on DioError catch (e) {
      throw e.error as DefinedDataException;
    }

    return '사용하실 수 있는 닉네임입니다.';
  }

  @override
  Future<void> join(UserJoinModel model) async {
    try {
      await api.join(model.toRequest());
    } on DioError catch (e) {
      throw e.error as DefinedDataException;
    }
  }

  @override
  Future<void> verify(UserVerifyModel model) async {
    try {
      final response = await api.verify(model.toRequest());
      await saveTokens(response.data);
    } on DioError catch (e) {
      throw e.error as DefinedDataException;
    }
  }

  @override
  Future<String> resendAuthCode(String email) async {
    try {
      await api.resendAuthCode(email);
    } on DioError catch (e) {
      throw e.error as DefinedDataException;
    }

    return '등록된 이메일로 인증번호가 재전송되었습니다.';
  }

  @override
  Future<void> signIn(UserSignInModel model) async {
    DefinedDataException? error;

    try {
      final response = await api.signIn(model.toRequest());
      error = mapException(
        response.message,
        response.code,
        response.status,
      );
    } on DioError catch (e) {
      throw e.error as DefinedDataException;
    }

    if (error != null) throw error;
  }

  @visibleForTesting
  Future<void> saveTokens(UserTokenResponse response) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(PREF_KEY_REFRESH_TOKEN, response.refreshToken!);
    await pref.setString(PREF_KEY_ACCESS_TOKEN, response.accessToken!);
  }
}
