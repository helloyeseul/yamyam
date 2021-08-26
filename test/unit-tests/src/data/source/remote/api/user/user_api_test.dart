import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/request/user_sign_in_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api_impl.dart';

import '../../mock_dio_client.dart';

void main() {
  final client = MockDioClient();
  final UserApi api = UserApiImpl(client);

  group('UserApiTest', () {
    test('signIn', () async {
      // given
      final request = UserSignInRequest(
        email: 'hello@flutter.com',
        password: '1234',
      );

      client.response = UserTokenResponse(
        'LOGIN_SUCCESS',
        'LOGIN_SUCCESS',
        200,
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0QGFhYS5iYmIiLCJyb2xlIjoiVVNFUiIsInR5cGUiOiJhY2Nlc3MiLCJleHAiOjE2MjgwMDE0MjR9.ANkMTlZR3IoXam5RTsZALeyCABxsjP9dh-V2EMjlMHU',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0QGFhYS5iYmIiLCJyb2xlIjoiVVNFUiIsInR5cGUiOiJyZWZyZXNoIiwiZXhwIjoxNjI4MDAxNDI0fQ.xKBoThFP90XEs-OwVLICa7p0atYi6BbTXsbWUdSwzno',
      );

      // when
      final result = await api.signIn(request);

      // then
      verify(client.postSingleResponse('/login/sign', request.toJson()));
      assert(result.accessToken != null);
      assert(result.refreshToken != null);
    });
  });
}
