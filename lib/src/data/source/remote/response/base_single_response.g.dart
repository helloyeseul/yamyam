// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_single_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseSingleResponse<T> _$BaseSingleResponseFromJson<T>(
        Map<String, dynamic> json) =>
    BaseSingleResponse<T>(
      message: json['message'] as String? ?? '',
      code: json['code'] as String? ?? '',
      status: json['status'] == null
          ? 200
          : const IntConverter().fromJson(json['status']),
      data: ResponseConverter<T>().fromJson(json['data']),
    );
