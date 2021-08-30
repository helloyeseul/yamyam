import 'package:yamstack/view/screens/signin/sign_in_user_model.dart';

abstract class UserRepository {
  Future signIn(SignInUserModel model);
}
