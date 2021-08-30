import 'package:json_annotation/json_annotation.dart';

part 'user_sign_request.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
class UserSignRequest {
  UserSignRequest({
    required this.email,
    required this.password,
  });

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  Map<String, dynamic> toJson() => _$UserSignRequestToJson(this);
}
