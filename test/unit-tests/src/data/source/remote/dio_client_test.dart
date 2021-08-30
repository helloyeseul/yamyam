import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yamstack/data/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/data/remote/dio/dio_client.dart';
import 'package:yamstack/data/remote/response/base/base_single_response.dart';
import 'package:yamstack/data/remote/response/base/empty_response.dart';
import 'package:yamstack/data/remote/response/exception/defined_exceptions.dart';
import 'package:yamstack/extensions/future_helper.dart';

import '../../../../test_binding.dart';
import '../../../../test_binding.mocks.dart';
import 'mock_response.dart';

void main() {
  late final DioClient client;

  setUpAll(() {
    TestBinding().dependencies();
    client = Get.find<DioClient>();
  });

  group('GET 테스트', () {
    test('성공 테스트', () {
      // given
      const url = '/login/nameCheck';
      const name = 'test';

      // when
      when(Get.find<MockDio>().get(any)).thenAnswer(
        (_) => MockResponse(
          statusCode: 200,
          dataString: '{"message":"false","code":"CHECK_NAME","status":200}',
        ).toFuture(),
      );

      final responseFuture =
          client.getSingleResponse<EmptyResponse>('$url/$name');

      // then
      expect(
        responseFuture,
        completion(isA<BaseSingleResponse<EmptyResponse>>()),
      );
      expect(
        responseFuture.then((value) => value.status),
        completion(equals(200)),
      );
    });
  });

  group('POST 테스트', () {
    // given
    const url = '/login/join';
    final request = <String, dynamic>{
      'email': 'hello@flutter.com',
      'password': '1234',
      'name': '플러터'
    };

    test('SUCCESS 테스트', () {
      // when
      when(Get.find<MockDio>().post(any, data: anyNamed('data'))).thenAnswer(
        (_) => MockResponse(
          statusCode: 200,
          dataString: '''
            {
              "message" : "LOGIN_SUCCESS",
              "code" : "LOGIN_SUCCESS",
              "status" : 200,
              "accessToken" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0QGFhYS5iYmIiLCJyb2xlIjoiVVNFUiIsInR5cGUiOiJhY2Nlc3MiLCJleHAiOjE2MjgwMDE0MjR9.ANkMTlZR3IoXam5RTsZALeyCABxsjP9dh-V2EMjlMHU",
              "refreshToken" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0QGFhYS5iYmIiLCJyb2xlIjoiVVNFUiIsInR5cGUiOiJyZWZyZXNoIiwiZXhwIjoxNjI4MDAxNDI0fQ.xKBoThFP90XEs-OwVLICa7p0atYi6BbTXsbWUdSwzno"
            }''',
        ).toFuture(),
      );

      final responseFuture =
          client.postSingleResponse<UserTokenResponse>(url, request);

      // then
      expect(
        responseFuture,
        completion(isA<BaseSingleResponse<UserTokenResponse>>()),
      );
      expect(
        responseFuture.then((value) => value.status),
        completion(equals(200)),
      );
    });

    test('FAIL 테스트', () {
      // when
      final responseFuture =
          client.postSingleResponse<UserTokenResponse>(url, request);

      // then
      expect(
        responseFuture,
        throwsA(isA<DuplicatedAccountException>()),
      );
    });
  });
}
