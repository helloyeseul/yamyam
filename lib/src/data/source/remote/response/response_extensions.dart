import 'package:dio/dio.dart';
import 'package:yamstack/src/data/exception/defined_exception.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/exception/user_login_exception_mapper.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/src/data/source/remote/response/response_mapper.dart';

extension ResponseExtensions on Response {
  Future<T> mapResponseOrError<T>() {
    // 정상
    if (statusCode == 200) {
      // json -> T 타입으로 매핑
      return Future.value(mapResponse<T>(data as Map<String, dynamic>));
    }
    return _handleException(this);
  }
}

// 상황에 맞는 예외 던지기
Future<T> _handleException<T>(Response response) {
  final responseData = mapResponse<T>(response.data as Map<String, dynamic>);

  if (responseData is UserTokenResponse) {
    return Future.error(mapException(responseData.message, responseData.code));
  }

  return Future.error(const UnknownException());
}
