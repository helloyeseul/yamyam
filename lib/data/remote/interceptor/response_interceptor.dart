import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final json = response.data;

    if (json is Map<String, dynamic>) {
      response.data = formatResponseData(json);
    }

    handler.next(response);
  }

  @visibleForTesting
  static Map<String, dynamic> formatResponseData(Map<String, dynamic> json) {
    final result = <String, dynamic>{};
    result['message'] = json.remove('message');
    result['code'] = json.remove('code');
    result['status'] = json.remove('status');
    result['data'] = json;
    return result;
  }
}
