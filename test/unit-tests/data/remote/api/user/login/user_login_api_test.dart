import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:yamstack/app/app_binding.dart';
import 'package:yamstack/data/exception/defined_exceptions.dart';
import 'package:yamstack/data/remote/api/user/login/request/user_identify_request.dart';
import 'package:yamstack/data/remote/api/user/login/request/user_join_request.dart';
import 'package:yamstack/data/remote/api/user/login/request/user_sign_request.dart';
import 'package:yamstack/data/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/data/remote/api/user/login/user_login_api.dart';
import 'package:yamstack/data/remote/response/base_single_response.dart';
import 'package:yamstack/data/remote/response/empty_response.dart';

void main() {
  final api = UserLoginApi(AppBinding().dio);

  test('이메일 중복 체크', () {
    /* given */
    const email = 'sdc01194@gmail.com';

    /* when */
    final response = api.emailCheck(email);

    /* then */
    expect(response, completion(isA<BaseSingleResponse<EmptyResponse>>()));
  });

  group('닉네임 중복 체크', () {
    test('false', () {
      /* given */
      const name = '플러터';

      /* when */
      final response = api.nameCheck(name);

      /* then */
      // 타입 체크
      expect(
        response,
        completion(isA<BaseSingleResponse<EmptyResponse>>()),
      );
      // 중복된 닉네임 message = false 체크
      expect(
        response.then((value) => value.message),
        completion(equals('false')),
      );
    });

    test('true', () {
      /* given */
      const name = '플러터121212';

      /* when */
      final response = api.nameCheck(name);

      /* then */
      // 타입 체크
      expect(
        response,
        completion(isA<BaseSingleResponse<EmptyResponse>>()),
      );
      // 가입 가능한 닉네임 message = true 체크
      expect(
        response.then((value) => value.message),
        completion(equals('true')),
      );
    });
  });

  group('이메일 중복 체크', () {
    test('false', () {
      /* given */
      const email = 'sdc01194@gmail.com';

      /* when */
      final response = api.emailCheck(email);

      /* then */
      expect(response, completion(isA<BaseSingleResponse<EmptyResponse>>()));
    });
  });

  group('회원가입', () {
    test('중복된 아이디', () {
      /* given */
      final request = UserJoinRequest(
        email: 'sdc01194@gmail.com',
        password: '1234',
        name: '얌얌1',
      );

      try {
        /* when */
        api.join(request);
      } on DioError catch (e) {
        /* then */
        expect(e, isA<DioError>());
        expect(e.error, isA<DuplicatedAccountException>());
      }
    });
  });

  test('본인인증 실패', () async {
    /* given */
    final request = UserIdentifyRequest(
      email: 'sdc01194@gmail.com',
      authCode: '355161',
    );

    try {
      /* when */
      await api.identify(request);
    } on DioError catch (e) {
      /* then */
      expect(
        e.error,
        isA<IdentifyFailException>(),
      );
    }
  });

  group('로그인', () {
    test('로그인 성공', () {
      /* given */
      final request = UserSignRequest(
        email: 'sdc01194@gmail.com',
        password: '1234',
      );

      /* when */
      final response = api.sign(request);

      /* then */
      // 타입 체크
      expect(
        response,
        completion(isA<BaseSingleResponse<UserTokenResponse>>()),
      );
      // 토큰
      expect(
        response.then((value) => value.data.accessToken),
        completion(isNotEmpty),
      );
      expect(
        response.then((value) => value.data.refreshToken),
        completion(isNotEmpty),
      );
    });

    test('로그인 실패', () async {
      /* given */
      final request = UserSignRequest(
        email: 'sdc01194@gmail.com',
        password: '12345',
      );

      try {
        /* when */
        await api.sign(request);
      } on DioError catch (e) {
        /* then */
        // 타입 체크
        expect(e, isA<DioError>());
        expect(e.error, isA<LoginFailException>());
      }
    });
  });
}
