import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';
import 'package:yamstack/data/exception/defined_exceptions.dart';
import 'package:yamstack/data/remote/api/user/login/response/user_token_response.dart';
import 'package:yamstack/data/remote/api/user/login/user_login_api.dart';
import 'package:yamstack/data/remote/response/base_single_response.dart';
import 'package:yamstack/data/remote/response/empty_response.dart';
import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';
import 'package:yamstack/data/repository/user/login/model/user_verify_model.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository_impl.dart';
import 'package:yamstack/data/shared/preference_constants.dart';
import 'package:yamstack/extensions/future_helper.dart';

import 'user_login_repository_test.mocks.dart';

@GenerateMocks([UserLoginApi])
void main() {
  final api = MockUserLoginApi();
  final repository = UserLoginRepositoryImpl(api);

  group('이메일 중복 확인 테스트', () {
    test('사용 가능', () {
      /* given */
      const email = 'sdc01194@gmail.com';

      /* when */
      when(api.emailCheck(any)).thenAnswer(
        (_) => BaseSingleResponse<EmptyResponse>.fromJson(<String, dynamic>{
          'message': 'true',
          'code': 'CHECK_ID',
          'status': 200,
        }).toFuture(),
      );

      final result = repository.checkEmail(email);

      /* then */
      verify(api.emailCheck(email));
      expect(result, completion(isA<void>()));
    });

    test('사용 불가 (중복됨)', () {
      /* given */
      const email = 'sdc01194@gmail.com';

      /* when */
      when(api.emailCheck(any)).thenAnswer(
        (_) => BaseSingleResponse<EmptyResponse>.fromJson(<String, dynamic>{
          'message': 'false',
          'code': 'CHECK_ID',
          'status': 200
        }).toFuture(),
      );

      final result = repository.checkEmail(email);

      /* then */
      verify(api.emailCheck(email));
      expect(result, throwsA(isA<DuplicatedEmailException>()));
    });
  });

  group('회원가입 테스트', () {
    test('회원가입 성공', () {
      /* given */
      final model = UserJoinModel(
          email: 'sdc01194@gmail.com', name: '플러터', password: '1234');

      /* when */
      when(api.join(any)).thenAnswer(
        (_) => BaseSingleResponse<EmptyResponse>.fromJson(<String, dynamic>{
          'message': 'JOIN_SUCCESS',
          'code': 'JOIN_SUCCESS',
          'status': 200
        }).toFuture(),
      );

      final result = repository.join(model);

      /* then */
      verify(api.join(any));
      expect(result, completion(isA<void>()));
    });

    test('회원가입 실패', () {
      /* given */
      final model = UserJoinModel(
          email: 'sdc01194@gmail.com', name: '플러터', password: '1234');

      /* when */
      when(api.join(any)).thenThrow(
        DioError(
            requestOptions: RequestOptions(path: ''),
            error: const DuplicatedAccountException()),
      );

      final result = repository.join(model);

      /* then */
      verify(api.join(any));
      expect(result, throwsA(isA<DuplicatedAccountException>()));
    });
  });

  group('본인인증 테스트', () {
    /* given */
    final model = UserVerifyModel(email: 'abc', authCode: '123');
    const accessToken = 'accessToken11';
    const refreshToken = 'refreshToken11';

    late final SharedPreferences pref;

    setUpAll(() async {
      pref = await SharedPreferences.getInstance();
    });

    tearDown(() {
      pref.remove(PREF_KEY_ACCESS_TOKEN);
      pref.remove(PREF_KEY_REFRESH_TOKEN);
    });

    test('본인인증 성공', () async {
      /* when */
      when(api.verify(any)).thenAnswer(
        (_) => BaseSingleResponse<UserTokenResponse>.fromJson(<String, dynamic>{
          'message': 'IDENTIFY_SUCCESS',
          'code': 'IDENTIFY_SUCCESS',
          'status': 200,
          'data': {
            'accessToken': accessToken,
            'refreshToken': refreshToken,
          }
        }).toFuture(),
      );

      await repository.verify(model);

      /* then */
      expect(pref.getString(PREF_KEY_ACCESS_TOKEN), equals(accessToken));
      expect(pref.getString(PREF_KEY_REFRESH_TOKEN), equals(refreshToken));
    });

    test('본인인증 실패', () {
      /* when */
      when(api.verify(any)).thenThrow(
        DioError(
          requestOptions: RequestOptions(path: ''),
          error: const VerifyFailException(),
        ),
      );

      /* then */
      expect(pref.getString(PREF_KEY_ACCESS_TOKEN), isNull);
      expect(pref.getString(PREF_KEY_REFRESH_TOKEN), isNull);
    });
  });
}
