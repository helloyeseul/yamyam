import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';

abstract class UserLoginRepository {
  Future<void> checkEmail(String email);

  Future<void> checkName(String name);

  Future<void> join(UserJoinModel model);
}
