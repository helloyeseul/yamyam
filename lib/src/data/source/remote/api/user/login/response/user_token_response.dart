import 'package:json_annotation/json_annotation.dart';
import 'package:yamstack/src/data/source/remote/response/base_response.dart';

part 'user_token_response.g.dart';

@JsonSerializable(createToJson: false)
class UserTokenResponse extends BaseResponse {
  UserTokenResponse(
    String message,
    String code,
    int status,
    this.accessToken,
    this.refreshToken,
  ) : super(message, code, status);

  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  factory UserTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$UserTokenResponseFromJson(json);
}
