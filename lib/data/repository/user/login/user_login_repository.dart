import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';
import 'package:yamstack/data/repository/user/login/model/user_verify_model.dart';

abstract class UserLoginRepository {
  Future<void> checkEmail(String email);

  Future<String> checkName(String name);

  Future<void> join(UserJoinModel model);

  Future<String> verify(UserVerifyModel model);

  Future<void> resendAuthCode(String email);
}
