import 'package:json_annotation/json_annotation.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/src/data/source/remote/response/base/empty_response.dart';

typedef Mapper<T> = T Function(Map<String, dynamic>);

class ResponseConverter<T> implements JsonConverter<T, Object?> {
  const ResponseConverter();

  @override
  T fromJson(Object? json) {
    if (json == null) {
      return EmptyResponse.fromJson({}) as T;
    }

    if (json is Map<String, dynamic>) {
      return ArgumentError.checkNotNull(responseMapper[T])(json) as T;
    }

    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }

  @override
  Object? toJson(T object) => object;
}

final Map<Type, Mapper> responseMapper = <Type, Mapper>{
  EmptyResponse: (json) => EmptyResponse.fromJson(json),
  UserTokenResponse: (json) => UserTokenResponse.fromJson(json),
};
