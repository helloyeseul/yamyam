import 'package:dio/dio.dart';
import 'package:yamstack/src/data/source/remote/response/base/base_single_response.dart';
import 'package:yamstack/src/data/source/remote/response/exception/exception_mapper.dart';

extension ResponseExtensions on Response {
  Future<BaseSingleResponse<T>> mapSingleResponse<T>() {
    final response =
        BaseSingleResponse<T>.fromJson(data as Map<String, dynamic>);

    final error = getExceptionIfError(
      response.message,
      response.code,
      response.status,
    );

    if (error != null) {
      return Future.error(error);
    } else {
      return Future.value(response);
    }
  }
}
