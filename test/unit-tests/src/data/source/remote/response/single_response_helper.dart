import 'dart:convert';

import 'package:yamstack/src/data/source/remote/interceptor/response_interceptor.dart';
import 'package:yamstack/src/data/source/remote/response/base/base_single_response.dart';

BaseSingleResponse<T> buildBaseSingleResponse<T>(String jsonString) {
  final body = json.decode(jsonString) as Map<String, dynamic>;
  final responseBody = ResponseInterceptor.formatResponseData(body);
  return BaseSingleResponse<T>.fromJson(responseBody);
}
