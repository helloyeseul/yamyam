import 'package:yamstack/data/remote/api/user/login/request/user_sign_in_request.dart';
import 'package:yamstack/view/screens/signin/sign_in_user_model.dart';

extension SignInUserModelMapper on SignInUserModel {
  UserSignInRequest toRequest() => UserSignInRequest(
        email: ArgumentError.checkNotNull(email),
        password: ArgumentError.checkNotNull(password),
      );
}
