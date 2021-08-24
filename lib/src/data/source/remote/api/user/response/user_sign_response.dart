import 'package:json_annotation/json_annotation.dart';

part 'user_sign_response.g.dart';

@JsonSerializable(createToJson: false)
class UserSignResponse {
  UserSignResponse(
    this.message,
    this.code,
    this.status,
    this.accessToken,
    this.refreshToken,
  );

  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @JsonKey(name: 'code', defaultValue: '')
  final String code;

  @JsonKey(name: 'status', defaultValue: 0)
  final int status;

  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  @override
  String toString() {
    return 'UserSignResponse{message: $message, code: $code, status: $status, '
        'accessToken: $accessToken, refreshToken: $refreshToken}';
  }

  factory UserSignResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSignResponseFromJson(json);
}
