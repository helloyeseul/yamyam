import 'package:get/get.dart';
import 'package:test/test.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api.dart';
import 'package:yamstack/src/data/source/remote/response/exception/defined_exception.dart';

import '../../../../../../test/test_binding.dart';
import '../../dio_helper.dart';

void main() {
  late final UserApi api;

  setUpAll(() {
    TestBinding().dependencies();
    api = Get.find<UserApi>();
  });

  final request = UserJoinRequest(
    email: 'hello@flutter.com',
    password: '1234',
    name: '플러터',
  );

  group('회원가입 성공', () {
    test('회원가입 성공 테스트', () {
      // given
      const response = '''
          {
              "message": "JOIN_SUCCESS",
              "code": "JOIN_SUCCESS",
              "status": 200
          }''';

      setupMockDioPostAnswer(200, response);

      final join = api.join(request);

      // then
      verifyMockDioPostCalled();
      expect(join.then((value) => value.message),
          completion(equals('JOIN_SUCCESS')));
      expect(
          join.then((value) => value.code), completion(equals('JOIN_SUCCESS')));
      expect(join.then((value) => value.status), completion(equals(200)));
    });
  });

  group('회원가입 실패', () {
    test('회원가입 실패 테스트', () {
      // given
      const response = '''
          {
              "message": "DUPLICATED_ACCOUNT",
              "code": "DUPLICATED_ACCOUNT", 
              "status": "400"
          }''';

      setupMockDioPostAnswer(400, response);

      final join = api.join(request);

      // then
      verifyMockDioPostCalled();
      expect(join, throwsA(isA<DuplicatedAccountException>()));
    });
  });
}
