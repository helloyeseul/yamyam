// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenResponse _$UserTokenResponseFromJson(Map<String, dynamic> json) =>
    UserTokenResponse(
      json['message'] as String? ?? '',
      json['code'] as String? ?? '',
      json['status'] == null ? 0 : BaseResponse.parseStatus(json['status']),
      json['accessToken'] as String?,
      json['refreshToken'] as String?,
    );
