import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:yamstack/src/data/source/remote/interceptor/response_interceptor.dart';

class MockResponse extends Response {
  MockResponse({
    int statusCode = 200,
    String dataString = '{}',
  }) : super(
          statusCode: statusCode,
          data: ResponseInterceptor.formatResponseData(
            json.decode(dataString) as Map<String, dynamic>,
          ),
          requestOptions: RequestOptions(path: ''),
        );
}
