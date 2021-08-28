import 'package:test/test.dart';
import 'package:yamstack/src/data/exception/defined_exception.dart';
import 'package:yamstack/src/data/repository/user/login/exception/user_login_exceptions.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/src/data/source/remote/response/response_extensions.dart';

import 'response_builder.dart';

void main() {
  const accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0QGFhYS5iYmIiLCJyb2xlIjoiVVNFUiIsInR5cGUiOiJhY2Nlc3MiLCJleHAiOjE2MjgwMDE0MjR9.ANkMTlZR3IoXam5RTsZALeyCABxsjP9dh-V2EMjlMHU';
  const refreshToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0QGFhYS5iYmIiLCJyb2xlIjoiVVNFUiIsInR5cGUiOiJyZWZyZXNoIiwiZXhwIjoxNjI4MDAxNDI0fQ.xKBoThFP90XEs-OwVLICa7p0atYi6BbTXsbWUdSwzno';

  group('ResponseExtensionsTest', () {
    group('SUCCESS: 성공 테스트', () {
      test('response.status = 200 일 때', () {
        // given
        final responseBody = <String, dynamic>{
          'message': 'LOGIN_SUCCESS',
          'code': 'LOGIN_SUCCESS',
          'status': 200,
          'accessToken': accessToken,
          'refreshToken': refreshToken
        };

        // when
        final result = (ResponseBuilder()
              ..addBody(responseBody)
              ..setStatusCode(200))
            .build()
            .mapSingleResponseOrError<UserTokenResponse>();
      });
    });

    group('FAIL: 서버에서 넘어온 에러', () {
      test('ID/PW 오류', () {
        // given
        final responseBody = <String, dynamic>{
          'message': 'LOGIN_FAILED',
          'code': 'AUTH_002',
          'status': 401,
        };

        // when
        final result = (ResponseBuilder()
              ..addBody(responseBody)
              ..setStatusCode(401))
            .build()
            .mapSingleResponseOrError<UserTokenResponse>();

        // then
        expect(result, throwsA(isA<WrongIdOrPasswordException>()));
      });

      test('Unknown 오류', () {
        // given
        final responseBody = <String, dynamic>{
          'message': 'UNKNOWN',
          'code': 'UNKNOWN',
          'status': 405,
        };

        // when
        final result = (ResponseBuilder()
              ..setStatusCode(405)
              ..addBody(responseBody))
            .build()
            .mapSingleResponseOrError<UserTokenResponse>();

        // then
        expect(result, throwsA(isA<UnknownException>()));
      });
    });
  });
}
