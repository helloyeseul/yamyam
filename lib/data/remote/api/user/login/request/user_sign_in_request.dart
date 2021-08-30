import 'package:json_annotation/json_annotation.dart';

part 'user_sign_in_request.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
class UserSignInRequest {
  UserSignInRequest({
    required this.email,
    required this.password,
  });

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  Map<String, dynamic> toJson() => _$UserSignInRequestToJson(this);
}
