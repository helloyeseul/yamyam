import 'dart:async';

import 'package:dio/dio.dart';
import 'package:yamstack/src/data/source/remote/interceptor/response_interceptor.dart';
import 'package:yamstack/src/data/source/remote/response/base_single_response.dart';
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
    )..interceptors.addAll([
        LogInterceptor(
          requestHeader: false,
          requestBody: true,
          responseBody: true,
        ),
        ResponseInterceptor(),
      ]);
  }

  /// request method : [GET]
  /// response data type : [BaseSingleResponse<T>]
  /// T 타입은 ResponseConverter<T> 에서 해당 타입의 데이터로 매핑
  Future<BaseSingleResponse<T>> getSingleResponse<T>(
    String url, {
    Map<String, dynamic>? request,
  }) async {
    final response = await _dio!.get(url, queryParameters: request);
    return response.mapSingleResponseOrError<T>();
  }

  /// request method : [POST]
  /// response data type : [BaseSingleResponse<T>]
  /// T 타입은 ResponseConverter<T> 에서 해당 타입의 데이터로 매핑
  Future<BaseSingleResponse<T>> postSingleResponse<T>(
    String url,
    Map<String, dynamic> request,
  ) async {
    final response = await _dio!.post(url, data: request);
    return response.mapSingleResponseOrError<T>();
  }
}
