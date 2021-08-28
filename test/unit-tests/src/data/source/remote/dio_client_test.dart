import 'package:test/test.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/src/data/source/remote/dio_client.dart';
import 'package:yamstack/src/data/source/remote/response/base_single_response.dart';
import 'package:yamstack/src/data/source/remote/response/empty_response.dart';

void main() {
  final client = DioClient();

  group('ApiClientTest', () {
    group('GET 테스트', () {
      test('성공 테스트', () {
        // given
        const url = '/login/nameCheck';
        const name = 'test';

        // when
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
      test('성공 테스트', () {
        // given
        const url = '/login/sign';
        final request = <String, dynamic>{
          'email': 'hello@flutter.com',
          'password': '1234',
        };

        // when
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
    });
  });
}
