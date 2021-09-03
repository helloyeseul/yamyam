import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yamstack/data/exception/defined_exceptions.dart';
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
  Future<void> checkEmail(String email) => api.emailCheck(email).then(
        (value) => value.message == 'true'
            ? Future.value()
            : Future.error(const DuplicatedEmailException()),
      );

  @override
  Future<String> checkName(String name) => api.nameCheck(name).then(
        (value) => value.message == 'true'
            ? Future.value('사용하실 수 있는 닉네임입니다.')
            : Future.error(const DuplicatedNameException()),
      );

  @override
  Future<void> join(UserJoinModel model) async {
    return api.join(model.toRequest()).then((value) => Future.value()).onError(
      (error, stackTrace) {
        if (error is DioError) {
          return Future.error(error.error as DefinedException);
        }
        return Future.error(const UnknownException());
      },
    );
  }

  @override
  Future<bool> verify(UserVerifyModel model) => api
          .verify(model.toRequest())
          .then(
            (response) =>
                saveTokens(response.data).then((_) => Future.value(true)),
          )
          .onError((error, stackTrace) {
        if (error is DioError) {
          return Future.error(error.error as DefinedException);
        }
        return Future.error(error ?? const UnknownException());
      });

  @override
  Future<String> resendAuthCode(String email) => api
          .resendAuthCode(email)
          .then((_) => Future.value('등록된 이메일로 인증번호가 재전송되었습니다.'))
          .onError((error, stackTrace) {
        if (error is DioError) {
          return Future.error(error.error as DefinedException);
        }
        return Future.error(error ?? const UnknownException());
      });

  @override
  Future<void> signIn(UserSignInModel model) =>
      api.signIn(model.toRequest()).then((value) {
        final error = mapException(value.message, value.code, value.status);
        return error == null ? Future.value() : Future.error(error);
      }).onError(
        (error, stackTrace) {
          if (error is DioError) {
            return Future.error(error.error as DefinedException);
          }
          return Future.error(error ?? const UnknownException());
        },
      );

  @visibleForTesting
  Future<void> saveTokens(UserTokenResponse response) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(PREF_KEY_REFRESH_TOKEN, response.refreshToken!);
    await pref.setString(PREF_KEY_ACCESS_TOKEN, response.accessToken!);
    return Future.value();
  }
}
