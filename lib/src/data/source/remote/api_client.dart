import 'dart:async';

import 'package:get/get.dart';
import 'package:yamstack/src/data/source/remote/response/response_extensions.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'http://yam-stack.com';
    httpClient.addRequestModifier<void>((request) {
      request.headers['Content-Type'] = 'application/json;charset=UTF-8';
      request.headers['Charset'] = 'utf-8';
      return request;
    });
  }

  Future<T> getSingleResponse<T>(String url,
      {Map<String, dynamic>? request}) async {
    final response = await get(url, query: request);
    return response.mapResponseOrError<T>();
  }

  Future<T> postSingleResponse<T>(
      String url, Map<String, dynamic> request) async {
    final response = await post(url, request);
    return response.mapResponseOrError<T>();
  }
}
