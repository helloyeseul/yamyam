import 'package:dio/dio.dart';
import 'package:yamstack/data/exception/defined_exceptions.dart';
import 'package:yamstack/data/remote/api/user/login/user_login_api.dart';
import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';
import 'package:yamstack/data/repository/user/login/model/user_verify_model.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';

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
  Future<void> verify(UserVerifyModel model) {
    return api
        .verify(model.toRequest())
        .then((value) => Future.value())
        .onError(
          (error, stackTrace) => null,
        );
  }
}
