import 'package:dio/dio.dart';
import 'package:yamstack/src/data/exception/defined_exception.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/exception/user_login_exception_mapper.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/src/data/source/remote/response/base_response.dart';
import 'package:yamstack/src/data/source/remote/response/response_mapper.dart';

extension ResponseExtensions on Response {
  Future<T> mapResponseOrError<T>() {
    // 정상
    if (statusCode == 200) {
      // json -> T 타입으로 매핑
      final response = mapResponse<T>(data as Map<String, dynamic>);

      // BaseResponse - message, code, status 필드가 있는 경우
      if (response is BaseResponse) {
        // 정상 - response 반환
        if (response.status == 200) {
          return Future.value(response);
        }
      }
    }
    return _handleException(this);
  }
}

// 오류 - 상황에 맞는 예외 던지기
Future<T> _handleException<T>(Response response) {
  if (response is UserTokenResponse) {
    final resp = response as UserTokenResponse;
    return Future.error(mapException(resp.message, resp.code));
  }

  return Future.error(const UnknownException());
}
