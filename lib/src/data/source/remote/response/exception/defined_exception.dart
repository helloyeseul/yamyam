abstract class DefinedException extends FormatException {
  const DefinedException(String message) : super(message);
}

class UnknownException extends DefinedException {
  const UnknownException() : super('unknown exception');
}

class VerifyRequiredException extends DefinedException {
  const VerifyRequiredException() : super('이메일로 발송된 인증번호를 확인해주세요');
}

class WrongIdOrPasswordException extends DefinedException {
  const WrongIdOrPasswordException() : super('잘못된 아이디 또는 비밀번호입니다.');
}

class DuplicatedAccountException extends DefinedException {
  const DuplicatedAccountException() : super('중복된 아이디 또는 이름입니다.');
}
