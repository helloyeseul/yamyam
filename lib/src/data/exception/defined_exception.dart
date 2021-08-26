abstract class DefinedException extends FormatException {
  const DefinedException(String message) : super(message);
}

class UnknownException extends DefinedException {
  const UnknownException() : super('unknown exception');
}
