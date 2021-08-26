import 'dart:async';

import 'package:yamstack/src/data/source/remote/api/user/login/request/user_sign_in_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api.dart';
import 'package:yamstack/src/data/source/remote/api_client.dart';

class UserApiImpl implements UserApi {
  const UserApiImpl(this._client);

  final ApiClient _client;

  @override
  Future<UserTokenResponse> signIn(UserSignInRequest request) =>
      _client.postSingleResponse('/login/sign', request.toJson());
}
