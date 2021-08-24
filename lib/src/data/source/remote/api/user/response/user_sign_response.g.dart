// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignResponse _$UserSignResponseFromJson(Map<String, dynamic> json) =>
    UserSignResponse(
      json['message'] as String? ?? '',
      json['code'] as String? ?? '',
      json['status'] as int? ?? 0,
      json['accessToken'] as String?,
      json['refreshToken'] as String?,
    );
