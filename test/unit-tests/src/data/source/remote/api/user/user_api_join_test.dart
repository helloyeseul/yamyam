import 'dart:convert';

import 'package:get/get.dart';
import 'package:test/test.dart';
import 'package:yamstack/src/data/repository/user/login/exception/user_login_exceptions.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api.dart';
import 'package:yamstack/src/data/source/remote/dio_client.dart';

import '../../../../../../app/test_binding.dart';
import '../../mock_dio_client.dart';
import '../../response/response_builder.dart';

void main() {
  TestBinding().dependencies();

  final client = Get.find<DioClient>() as MockDioClient;
  final api = Get.find<UserApi>();

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

        // when
        client.response = (ResponseBuilder()..addBody(body)).build();
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

        client.response = (ResponseBuilder()
              ..addBody(body)
              ..setStatusCode(400))
            .build();
        final join = api.join(request);

        // then
        expect(join, throwsA(isA<DuplicateAccountException>()));
      });
    });
  });
}
