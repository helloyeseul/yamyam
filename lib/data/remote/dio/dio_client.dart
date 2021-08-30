import 'dart:async';

import 'package:dio/dio.dart';
import 'package:yamstack/data/remote/response/base/base_single_response.dart';
import 'package:yamstack/data/remote/response/exception/defined_exceptions.dart';
import 'package:yamstack/extensions/future_helper.dart';

class DioClient {
  DioClient(this._dio);

  final Dio _dio;

  Future<BaseSingleResponse<T>> getSingleResponse<T>(
    String url, {
    Map<String, dynamic>? request,
  }) async {
    final response = await _dio.get(url, queryParameters: request);
    return BaseSingleResponse<T>.fromJson(response.data as Map<String, dynamic>)
        .toFuture();
  }

  Future<BaseSingleResponse<T>> postSingleResponse<T>(
    String url,
    Map<String, dynamic> request,
  ) async {
    try {
      final response = await _dio.post(url, data: request);
      return BaseSingleResponse<T>.fromJson(
        response.data as Map<String, dynamic>,
      ).toFuture();
    } on DioError catch (e) {
      if (e.error is DefinedException) {
        return Future.error(e.error as DefinedException);
      } else {
        return Future.error(e);
      }
    }
  }
}
