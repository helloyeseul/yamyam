import 'package:yamstack/src/data/repository/user/login/user_mapper.dart';
import 'package:yamstack/src/data/repository/user/login/user_repository.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_user_model.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._api);

  final UserApi _api;

  @override
  Future signIn(SignInUserModel model) {
    return _api.signIn(model.toRequest());
  }
}