import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';
import 'package:yamstack/data/exception/defined_exceptions.dart';
import 'package:yamstack/data/remote/api/user/login/user_login_api.dart';
import 'package:yamstack/data/remote/response/base/base_single_response.dart';
import 'package:yamstack/data/remote/response/base/empty_response.dart';
import 'package:yamstack/data/repository/user/login/model/user_join_model.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository_impl.dart';
import 'package:yamstack/extensions/future_helper.dart';

import 'user_login_repository_test.mocks.dart';

@GenerateMocks([UserLoginApi])
void main() {
  final api = MockUserLoginApi();
  final UserLoginRepository repository = UserLoginRepositoryImpl(api);

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
}
