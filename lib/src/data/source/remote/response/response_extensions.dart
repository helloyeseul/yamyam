import 'dart:io';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/exception/user_login_exception_mapper.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/src/data/source/remote/response/base_response.dart';
import 'package:yamstack/src/data/source/remote/response/response_mapper.dart';

extension ResponseExtensions on Response {
  Future<T> mapResponseOrError<T>() {
    // http 통신 에러
    if (status.hasError || body == null) {
      print(status.hasError);
      print(status.isServerError);
      print(body);
      print(statusCode);
      return Future.error(const HttpException(''));
    }

    // json -> T 타입으로 매핑
    final response = mapResponse<T>(body as Map<String, dynamic>);

    // BaseResponse - message, code, status 필드가 있는 경우
    if (response is BaseResponse) {
      // 정상 - response 반환
      if (response.status == 200) {
        return Future.value(response);
      }

      // 오류 - 상황에 맞는 예외 터트림
      if (response is UserTokenResponse) {
        return Future.error(mapException(response.message, response.code));
      }
    }

    return Future.value(response);
  }
}
