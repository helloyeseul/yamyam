import 'package:yamstack/src/data/source/remote/api/user/login/response/user_sign_response.dart';

typedef FromJson<T> = T Function(Map<String, dynamic>);

T mapResponse<T>(Map<String, dynamic> json) =>
    ArgumentError.checkNotNull(responseMapper[T])(json) as T;

final Map<Type, FromJson> responseMapper = <Type, FromJson>{
  UserSignResponse: (json) => UserSignResponse.fromJson(json),
};
