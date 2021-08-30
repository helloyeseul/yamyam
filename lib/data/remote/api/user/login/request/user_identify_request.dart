import 'package:json_annotation/json_annotation.dart';

part 'user_identify_request.g.dart';

@JsonSerializable(createFactory: false)
class UserIdentifyRequest {
  UserIdentifyRequest({
    required this.email,
    required this.authCode,
  });

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'authCode')
  final String authCode;

  Map<String, dynamic> toJson() => _$UserIdentifyRequestToJson(this);
}
