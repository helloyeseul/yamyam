import 'package:json_annotation/json_annotation.dart';

abstract class BaseResponse {
  BaseResponse(this.message, this.code, this.status);

  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @JsonKey(name: 'code', defaultValue: '')
  final String code;

  @JsonKey(name: 'status', defaultValue: 0, fromJson: parseStatus)
  final int status;

  static int parseStatus(dynamic src) {
    if (src is int?) {
      return src ?? 0;
    } else if (src is String?) {
      return int.parse(src ?? '0');
    } else {
      return 0;
    }
  }
}
