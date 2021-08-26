import 'dart:async';

import 'package:yamstack/src/data/source/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/request/user_sign_in_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';

abstract class UserApi {
  Future<UserTokenResponse> signIn(UserSignInRequest request);

  Future<UserTokenResponse> join(UserJoinRequest request);
}
