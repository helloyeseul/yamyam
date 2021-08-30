import 'package:json_annotation/json_annotation.dart';

part 'empty_response.g.dart';

@JsonSerializable(explicitToJson: true)
class EmptyResponse {
  const EmptyResponse();

  factory EmptyResponse.fromJson(Map<String, dynamic> json) =>
      _$EmptyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmptyResponseToJson(this);
}
