import 'dart:async';

import 'package:yamstack/data/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/data/remote/api/user/login/request/user_sign_in_request.dart';
import 'package:yamstack/data/remote/response/base/base_single_response.dart';
import 'package:yamstack/data/remote/response/base/empty_response.dart';

abstract class UserApi {
  Future<BaseSingleResponse<EmptyResponse>> signIn(UserSignInRequest request);

  Future<BaseSingleResponse<EmptyResponse>> join(UserJoinRequest request);
}
