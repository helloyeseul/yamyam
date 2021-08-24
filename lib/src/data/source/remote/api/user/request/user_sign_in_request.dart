import 'package:json_annotation/json_annotation.dart';

part 'user_sign_in_request.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
class UserSignInRequest {
  UserSignInRequest(this.email, this.password, this.name);

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'name')
  final String name;

  Map<String, dynamic> toJson() => _$UserSignInRequestToJson(this);
}
