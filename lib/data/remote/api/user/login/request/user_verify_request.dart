import 'package:json_annotation/json_annotation.dart';

part 'user_verify_request.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
class UserVerifyRequest {
  UserVerifyRequest({
    required this.email,
    required this.authCode,
  });

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'authCode')
  final String authCode;

  Map<String, dynamic> toJson() => _$UserVerifyRequestToJson(this);
}
