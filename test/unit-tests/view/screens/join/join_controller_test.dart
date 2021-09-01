import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/view/screens/join/join_controller.dart';

import 'join_controller_test.mocks.dart';

@GenerateMocks([UserLoginRepository])
void main() {
  final repository = MockUserLoginRepository();
  final controller = JoinController(repository);

  test('회원가입 테스트', () {
    /* given */
    // controller.joinForm.email = 'sdc01194@gmail.com';
    controller.joinForm.name = '플러터';
    controller.joinForm.password = '1234';
    controller.joinForm.passwordRepeat = '1234';
    controller.joinForm.isAgreeWithTerms = true;

    /* when */
    when(repository.join(any)).thenAnswer((_) => Future.value());
    final result = controller.onPressJoin();

    /* then */
  });
}
