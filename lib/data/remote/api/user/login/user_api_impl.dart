import 'dart:async';

import 'package:yamstack/data/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/data/remote/api/user/login/user_api.dart';
import 'package:yamstack/data/remote/dio/dio_client.dart';
import 'package:yamstack/data/remote/response/base/base_single_response.dart';
import 'package:yamstack/data/remote/response/base/empty_response.dart';

class UserApiImpl implements UserApi {
  const UserApiImpl(this._client);

  final DioClient _client;

  @override
  Future<BaseSingleResponse<EmptyResponse>> join(UserJoinRequest request) =>
      _client.postSingleResponse('/login/join', request.toJson());
}
