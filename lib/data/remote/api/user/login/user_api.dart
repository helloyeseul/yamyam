import 'dart:async';

import 'package:retrofit/http.dart';
import 'package:yamstack/data/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/data/remote/response/base/base_single_response.dart';
import 'package:yamstack/data/remote/response/base/empty_response.dart';

@RestApi()
abstract class UserApi {
  @POST('/login/join')
  Future<BaseSingleResponse<EmptyResponse>> join(UserJoinRequest request);
}
