import 'package:json_annotation/json_annotation.dart';

part 'user_join_request.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
class UserJoinRequest {
  UserJoinRequest({
    required this.email,
    required this.password,
    required this.name,
  });

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'name')
  final String? name;

  Map<String, dynamic> toJson() => _$UserJoinRequestToJson(this);
}
