import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:yamstack/data/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/data/remote/api/user/login/request/user_sign_in_request.dart';
import 'package:yamstack/data/remote/api/user/login/request/user_verify_request.dart';
import 'package:yamstack/data/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/data/remote/response/base_single_response.dart';
import 'package:yamstack/data/remote/response/empty_response.dart';

part 'user_login_api.g.dart';

@RestApi()
abstract class UserLoginApi {
  factory UserLoginApi(Dio dio) = _UserLoginApi;

  /// 아이디 중복 체크
  @GET('/login/emailCheck/{email}')
  Future<BaseSingleResponse<EmptyResponse>> emailCheck(@Path() String email);

  /// 닉네임 중복 체크
  @GET('/login/nameCheck/{name}')
  Future<BaseSingleResponse<EmptyResponse>> nameCheck(@Path() String name);

  /// 회원가입
  @POST('/login/join')
  Future<BaseSingleResponse<EmptyResponse>> join(
    @Body() UserJoinRequest request,
  );

  /// 본인 인증
  @POST('/login/identify')
  Future<BaseSingleResponse<UserTokenResponse>> verify(
    @Body() UserVerifyRequest request,
  );

  /// 로그인
  @POST('/login/sign')
  Future<BaseSingleResponse<UserTokenResponse>> signIn(
    @Body() UserSignInRequest request,
  );

  /// 인증번호 재전송
  @POST('/login/authCode')
  Future<BaseSingleResponse<EmptyResponse>> resendAuthCode(
    @Field('email') String email,
  );
}
