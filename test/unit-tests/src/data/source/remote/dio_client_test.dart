import 'package:test/test.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/src/data/source/remote/dio_client.dart';

void main() {
  final client = DioClient();

  group('ApiClientTest', () {
    test('get test', () async {
      // given
      const url = '/login/nameCheck';
      const name = 'test';

      // when
      final responseFuture =
          client.getSingleResponse<UserTokenResponse>('$url/$name');

      // then
      expect(responseFuture, completion(isA<UserTokenResponse>()));
    });

    test('post test', () async {
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
      expect(responseFuture, completion(isA<UserTokenResponse>()));
    });
  });
}
