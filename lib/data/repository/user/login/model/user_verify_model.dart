import 'package:yamstack/data/remote/api/user/login/request/user_verify_request.dart';

class UserVerifyModel {
  UserVerifyModel({
    required this.email,
    required this.authCode,
  });

  final String email;
  final String authCode;

  UserVerifyRequest toRequest() =>
      UserVerifyRequest(email: email, authCode: authCode);
}
