import 'package:yamstack/src/data/source/remote/api/user/request/user_sign_in_request.dart';
import 'package:yamstack/src/view/screens/user/signin/sign_in_user_model.dart';

extension SignInUserModelMapper on SignInUserModel {
  UserSignInRequest toRequest() => UserSignInRequest(
        email: ArgumentError.checkNotNull(email),
        password: ArgumentError.checkNotNull(password),
      );
}
