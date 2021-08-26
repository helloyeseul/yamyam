import 'dart:async';

import 'package:yamstack/src/data/source/remote/api/user/login/request/user_sign_in_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_sign_response.dart';

abstract class UserApi {
  Future<UserSignResponse> signIn(UserSignInRequest request);
}
