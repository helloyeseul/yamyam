import 'package:yamstack/src/view/screens/user/signin/sign_in_user_model.dart';

abstract class UserRepository {
  Future signIn(SignInUserModel model);
}
