import 'package:tuple/tuple.dart';
import 'package:yamstack/src/data/source/remote/response/exception/defined_exception.dart';

typedef ErrorTuple = Tuple3<String, String, int>;
typedef Mapper = DefinedException Function();

DefinedException? getExceptionIfError(
    String? message, String? code, int? status) {
  final mapper = exceptionMapper[ErrorTuple(
    message ?? '',
    code ?? '',
    status ?? 200,
  )];
  return mapper == null ? null : mapper();
}

final Map<ErrorTuple, Mapper> exceptionMapper = <ErrorTuple, Mapper>{
  const ErrorTuple('DUPLICATED_ACCOUNT', 'DUPLICATED_ACCOUNT', 400): () =>
      const DuplicatedAccountException(),
};
