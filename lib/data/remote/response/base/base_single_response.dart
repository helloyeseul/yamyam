import 'package:json_annotation/json_annotation.dart';
import 'package:yamstack/data/remote/dio/converter/int_converter.dart';
import 'package:yamstack/data/remote/dio/converter/response_converter.dart';

part 'base_single_response.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class BaseSingleResponse<T> {
  const BaseSingleResponse({
    required this.message,
    required this.code,
    required this.status,
    required this.data,
  });

  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @JsonKey(name: 'code', defaultValue: '')
  final String code;

  @JsonKey(name: 'status', defaultValue: 200)
  @IntConverter()
  final int status;

  @ResponseConverter()
  @JsonKey(name: 'data')
  final T data;

  factory BaseSingleResponse.fromJson(Map<String, dynamic> json) {
    return _$BaseSingleResponseFromJson<T>(json);
  }
}
