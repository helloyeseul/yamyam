import 'package:dio/dio.dart';
import 'package:yamstack/data/exception/defined_exceptions.dart';
import 'package:yamstack/data/remote/api/user/login/user_login_api.dart';
import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';
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
  Future<void> checkName(String name) => api.nameCheck(name).then(
        (value) => value.message == 'true'
            ? Future.value()
            : Future.error(const DuplicatedNameException()),
      );

  @override
  Future<void> join(UserJoinModel model) {
    try {
      return api.join(model.toRequest()).then((value) => Future.value());
    } on DioError catch (e) {
      if (e.error is DefinedException) {
        return Future.error(e.error as DefinedException);
      }
      return Future.error(e);
    }
  }
}
