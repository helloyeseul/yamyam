import 'package:mockito/mockito.dart';
import 'package:yamstack/src/data/source/remote/dio_client.dart';

class MockDioClient extends Mock implements DioClient {
  dynamic response;

  @override
  Future<T> postSingleResponse<T>(String? url, Map? request) async =>
      super.noSuchMethod(
        Invocation.genericMethod(#postSingleResponse, [T], [url, request]),
        returnValue: Future<T>.value(response as T),
        returnValueForMissingStub: Future<T>.value(response as T),
      ) as Future<T>;

  @override
  Future<T> getSingleResponse<T>(String? url, {Map? request}) async =>
      super.noSuchMethod(
        Invocation.genericMethod(
          #getSingleResponse,
          [T],
          [url],
          {#request: request},
        ),
        returnValue: Future<T>.value(response as T),
        returnValueForMissingStub: Future<T>.value(response as T),
      ) as Future<T>;
}
