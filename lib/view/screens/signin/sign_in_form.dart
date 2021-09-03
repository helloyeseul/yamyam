import 'package:yamstack/data/repository/user/login/model/user_sign_in_model.dart';

class SignInForm {
  String email = '';
  String password = '';

  bool get isFormCompleted => email.isNotEmpty && password.isNotEmpty;

  UserSignInModel toModel() =>
      UserSignInModel(email: email, password: password);
}
