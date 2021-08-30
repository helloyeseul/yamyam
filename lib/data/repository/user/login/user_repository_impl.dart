import 'package:yamstack/data/remote/api/user/login/user_api.dart';
import 'package:yamstack/data/repository/user/login/user_mapper.dart';
import 'package:yamstack/data/repository/user/login/user_repository.dart';
import 'package:yamstack/view/screens/signin/sign_in_user_model.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._api);

  final UserApi _api;

  @override
  Future signIn(SignInUserModel model) {
    return _api.signIn(model.toRequest());
  }
}
