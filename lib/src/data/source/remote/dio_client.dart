import 'dart:async';

import 'package:dio/dio.dart';
import 'package:yamstack/src/data/source/remote/response/response_extensions.dart';

class DioClient {
  static const String _baseUrl = 'http://yam-stack.com';
  static Dio? _dio;

  DioClient() {
    _dio ??= Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        sendTimeout: 30000,
        receiveDataWhenStatusError: true,
        headers: <String, dynamic>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      ),
    )..interceptors.add(
        LogInterceptor(
          requestHeader: false,
          requestBody: true,
          responseBody: true,
        ),
      );
  }

  Future<T> getSingleResponse<T>(
    String url, {
    Map<String, dynamic>? request,
  }) async {
    final response = await _dio!.get(url, queryParameters: request);
    return response.mapResponseOrError<T>();
  }

  Future<T> postSingleResponse<T>(
    String url,
    Map<String, dynamic> request,
  ) async {
    final response = await _dio!.post(url, data: request);
    return response.mapResponseOrError<T>();
  }
}
