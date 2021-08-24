import 'dart:async';

import 'package:yamstack/src/data/source/remote/api/user/request/user_sign_in_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/response/user_sign_response.dart';
import 'package:yamstack/src/data/source/remote/api/user/user_api.dart';
import 'package:yamstack/src/data/source/remote/api_connect.dart';

class UserApiImpl implements UserApi {
  const UserApiImpl(this._connect);

  final ApiConnect _connect;

  @override
  Future<UserSignResponse> signIn(UserSignInRequest request) =>
      _connect.getSingle<UserSignResponse>('/login/join', request.toJson());
}
