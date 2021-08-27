// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenResponse _$UserTokenResponseFromJson(Map<String, dynamic> json) =>
    UserTokenResponse(
      message: json['message'] as String? ?? '',
      code: json['code'] as String? ?? '',
      status:
          json['status'] == null ? 0 : BaseResponse.parseStatus(json['status']),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );
