import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mockito/mockito.dart';
import 'package:yamstack/src/data/source/remote/response/response_mapper.dart';

class MockResponseExtensions extends Mock implements Response {
  Future<T> mapResponseOrError<T>() => noSuchMethod(
        Invocation.method(#mapResponseOrError, []),
        returnValue: Future.value(
          mapResponse<T>(body! as Map<String, dynamic>),
        ),
      ) as Future<T>;
}
