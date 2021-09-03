import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';
import 'package:yamstack/data/repository/user/login/model/user_sign_in_model.dart';
import 'package:yamstack/data/repository/user/login/model/user_verify_model.dart';

abstract class UserLoginRepository {
  Future<void> checkEmail(String email);

  Future<String> checkName(String name);

  Future<void> join(UserJoinModel model);

  Future<bool> verify(UserVerifyModel model);

  Future<String> resendAuthCode(String email);

  Future<void> signIn(UserSignInModel model);
}
