abstract class DefinedException extends FormatException {
  const DefinedException(String message) : super(message);
}

class UnknownException extends DefinedException {
  const UnknownException() : super('unknown exception');
}

class DuplicatedAccountException extends DefinedException {
  const DuplicatedAccountException() : super('중복된 아이디 또는 닉네임입니다.');
}

class DuplicatedEmailException extends DefinedException {
  const DuplicatedEmailException() : super('이미 존재하는 이메일입니다.');
}

class DuplicatedNameException extends DefinedException {
  const DuplicatedNameException() : super('이미 존재하는 닉네임입니다.');
}

class IdentifyFailException extends DefinedException {
  const IdentifyFailException() : super('인증번호를 다시 확인해주세요.');
}

class VerifyRequiredException extends DefinedException {
  const VerifyRequiredException() : super('이메일로 발송된 인증번호를 확인해주세요');
}

class LoginFailException extends DefinedException {
  const LoginFailException() : super('잘못된 아이디 또는 비밀번호입니다.');
}
