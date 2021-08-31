import 'package:yamstack/data/remote/api/user/login/request/user_join_request.dart';

class UserJoinModel {
  UserJoinModel({
    required this.email,
    required this.name,
    required this.password,
  });

  final String email;
  final String name;
  final String password;

  UserJoinRequest toRequest() => UserJoinRequest(
        email: email,
        password: password,
        name: name,
      );
}
