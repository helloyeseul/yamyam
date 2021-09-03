abstract class DefinedDataException extends FormatException {
  const DefinedDataException(String message) : super(message);
}

class UnknownException extends DefinedDataException {
  const UnknownException() : super('알 수 없는 오류');
}

class DuplicatedAccountException extends DefinedDataException {
  const DuplicatedAccountException() : super('이미 사용중인 아이디입니다.');
}

class DuplicatedEmailException extends DefinedDataException {
  const DuplicatedEmailException() : super('이미 사용중인 이메일입니다.');
}

class DuplicatedNameException extends DefinedDataException {
  const DuplicatedNameException() : super('이미 사용중인 닉네임입니다.');
}

class VerifyAuthCodeFailException extends DefinedDataException {
  const VerifyAuthCodeFailException() : super('* 인증번호가 틀렸습니다.');
}

class VerifyRequiredException extends DefinedDataException {
  const VerifyRequiredException() : super('이메일로 발송된 인증번호를 확인해주세요');
}

class LoginFailException extends DefinedDataException {
  const LoginFailException() : super('잘못된 아이디 또는 비밀번호입니다.');
}
