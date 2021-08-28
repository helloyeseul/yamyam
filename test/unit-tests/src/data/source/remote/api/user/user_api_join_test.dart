import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yamstack/src/data/repository/user/login/exception/user_login_exceptions.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api_impl.dart';
import 'package:yamstack/src/data/source/remote/dio_client.dart';
import 'package:yamstack/src/data/source/remote/interceptor/response_interceptor.dart';
import 'package:yamstack/src/data/source/remote/response/base_single_response.dart';
import 'package:yamstack/src/data/source/remote/response/empty_response.dart';

import 'user_api_join_test.mocks.dart';

@GenerateMocks([DioClient])
void main() {
  final client = MockDioClient();
  final api = UserApiImpl(client);

  final request = UserJoinRequest(
    email: 'hello@flutter.com',
    password: '1234',
    name: '플러터',
  );

  group('UserApiJoinTest', () {
    group('회원가입 성공', () {
      test('회원가입 성공 테스트', () {
        // given
        final body = json.decode(
          '''
          {
              "message": "JOIN_SUCCESS",
              "code": "JOIN_SUCCESS",
              "status": 200
          }''',
        ) as Map<String, dynamic>;

        final responseBody = ResponseInterceptor.formatResponseData(body);
        final response =
            BaseSingleResponse<EmptyResponse>.fromJson(responseBody);

        // when
        when(client.postSingleResponse<EmptyResponse>(any, any))
            .thenAnswer((_) => Future.value(response));

        final join = api.join(request);

        // then
        expect(join.then((value) => value.message),
            completion(equals('JOIN_SUCCESS')));
        expect(join.then((value) => value.code),
            completion(equals('JOIN_SUCCESS')));
        expect(join.then((value) => value.status), completion(equals(200)));
      });
    });

    group('회원가입 실패', () {
      test('회원가입 실패 테스트', () {
        // given
        final body = json.decode(
          '''
          {
              "message": "DUPLICATED_ACCOUNT",
              "code": "DUPLICATED_ACCOUNT", 
              "status": "400"
          }''',
        ) as Map<String, dynamic>;

        final responseBody = ResponseInterceptor.formatResponseData(body);
        final response =
            BaseSingleResponse<EmptyResponse>.fromJson(responseBody);

        // when
        when(client.postSingleResponse<EmptyResponse>(any, any))
            .thenAnswer((_) => Future.value(response));

        final join = api.join(request);

        // then
        expect(join, throwsA(isA<DuplicateAccountException>()));
      });
    });
  });
}
