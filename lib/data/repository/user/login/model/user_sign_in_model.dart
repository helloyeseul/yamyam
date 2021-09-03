import 'package:yamstack/data/remote/api/user/login/request/user_sign_in_request.dart';

class UserSignInModel {
  UserSignInModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  UserSignInRequest toRequest() =>
      UserSignInRequest(email: email, password: password);
}
