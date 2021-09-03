abstract class DefinedUIException extends FormatException {
  const DefinedUIException(String message) : super(message);
}

class UnknownException extends DefinedUIException {
  const UnknownException() : super('알 수 없는 오류');
}
