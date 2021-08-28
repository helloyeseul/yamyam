import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:yamstack/src/data/source/remote/dio_client.dart';
import 'package:yamstack/src/data/source/remote/response/base_single_response.dart';
import 'package:yamstack/src/data/source/remote/response/response_extensions.dart';

class MockDioClient extends Mock implements DioClient {
  Response? response;

  @override
  Future<BaseSingleResponse<T>> postSingleResponse<T>(
          String? url, Map? request) async =>
      super.noSuchMethod(
        Invocation.genericMethod(#postSingleResponse, [T], [url, request]),
        returnValue: response!.mapSingleResponseOrError<T>(),
        returnValueForMissingStub: response!.mapSingleResponseOrError<T>(),
      ) as Future<BaseSingleResponse<T>>;

  @override
  Future<BaseSingleResponse<T>> getSingleResponse<T>(String? url,
          {Map? request}) async =>
      super.noSuchMethod(
        Invocation.genericMethod(
          #getSingleResponse,
          [T],
          [url],
          {#request: request},
        ),
        returnValue: response!.mapSingleResponseOrError<T>(),
        returnValueForMissingStub: response!.mapSingleResponseOrError<T>(),
      ) as Future<BaseSingleResponse<T>>;
}
