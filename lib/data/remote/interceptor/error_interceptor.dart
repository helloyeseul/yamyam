import 'package:dio/dio.dart';
import 'package:tuple/tuple.dart';
import 'package:yamstack/data/exception/defined_exceptions.dart';

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

    handler.next(err);
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
  const ErrorTuple('IDENTIFY_FAIL', 'IDENTIFY_FAIL', 400): () =>
      const VerifyAuthCodeFailException(),
  const ErrorTuple('LOGIN_FAILED.', 'AUTH_002', 401): () =>
      const LoginFailException(),
  const ErrorTuple('Identity verification is required', 'LOGIN_SUCCESS', 200):
      () => const VerifyRequiredException(),
};
