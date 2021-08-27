import 'package:yamstack/src/data/exception/defined_exception.dart';
import 'package:yamstack/src/data/repository/user/login/exception/user_login_exceptions.dart';
import 'package:yamstack/util/pair.dart';

typedef Mapper = DefinedException Function();

DefinedException mapException(String message, String code) {
  final mapper = exceptionMapper[Pair(message, code)];
  return mapper != null ? mapper() : const UnknownException();
}

final Map<Pair<String, String>, Mapper> exceptionMapper =
    <Pair<String, String>, Mapper>{
  const Pair('LOGIN_FAILED', 'AUTH_002'): () =>
      const WrongIdOrPasswordException(),
  const Pair('DUPLICATED_ACCOUNT', 'DUPLICATED_ACCOUNT'): () =>
      const DuplicateAccountException(),
};
