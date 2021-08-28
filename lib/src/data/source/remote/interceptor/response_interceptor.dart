import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final json = response.data;
    final newJson = <String, dynamic>{};

    if (json is Map<String, dynamic>) {
      newJson['message'] = json.remove('message');
      newJson['code'] = json.remove('code');
      newJson['status'] = json.remove('status');
      newJson['data'] = json;
      response.data = newJson;
    }

    return super.onResponse(response, handler);
  }
}
