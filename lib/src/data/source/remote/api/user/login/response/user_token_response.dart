import 'package:json_annotation/json_annotation.dart';

part 'user_token_response.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class UserTokenResponse {
  UserTokenResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  factory UserTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$UserTokenResponseFromJson(json);
}
