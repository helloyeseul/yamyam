import 'dart:async';

import 'package:yamstack/src/data/source/remote/api/user/request/user_sign_in_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/response/user_sign_response.dart';
import 'package:yamstack/src/data/source/remote/api/user/user_api.dart';
import 'package:yamstack/src/data/source/remote/api_client.dart';

class UserApiImpl implements UserApi {
  const UserApiImpl(this._client);

  final ApiClient _client;

  @override
  Future<UserSignResponse> signIn(UserSignInRequest request) => _client
      .getSingleResponse<UserSignResponse>('/login/sign', request.toJson());
}
