import 'package:dio/dio.dart';
import 'package:tuple/tuple.dart';
import 'package:yamstack/data/remote/response/exception/defined_exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final json = err.response?.data;

    if (json != null && json is Map<String, dynamic>) {
      err.error = mapException(
        json['message']?.toString(),
        json['code']?.toString(),
        err.response?.statusCode,
      );
    }

    super.onError(err, handler);
  }
}

typedef ErrorTuple = Tuple3<String?, String?, int?>;
typedef Mapper = DefinedException Function();

DefinedException? mapException(String? message, String? code, int? status) {
  final mapper = exceptionMapper[ErrorTuple(message, code, status)];
  return mapper == null ? null : mapper();
}

final Map<ErrorTuple, Mapper> exceptionMapper = <ErrorTuple, Mapper>{
  const ErrorTuple('DUPLICATED_ACCOUNT', 'DUPLICATED_ACCOUNT', 400): () =>
      const DuplicatedAccountException(),
};
