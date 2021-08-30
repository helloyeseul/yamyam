import 'dart:async';

import 'package:yamstack/src/data/source/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/request/user_sign_in_request.dart';
import 'package:yamstack/src/data/source/remote/response/base/base_single_response.dart';
import 'package:yamstack/src/data/source/remote/response/base/empty_response.dart';

abstract class UserApi {
  Future<BaseSingleResponse<EmptyResponse>> signIn(UserSignInRequest request);

  Future<BaseSingleResponse<EmptyResponse>> join(UserJoinRequest request);
}
