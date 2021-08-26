import 'package:get/get.dart';
import 'package:yamstack/src/data/repository/user/login/user_repository.dart';
import 'package:yamstack/src/data/repository/user/login/user_repository_impl.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api_impl.dart';
import 'package:yamstack/src/data/source/remote/api_client.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    Get.put<UserApi>(UserApiImpl(Get.find()), permanent: true);
    Get.put<UserRepository>(
      UserRepositoryImpl(Get.find<UserApi>()),
      permanent: true,
    );
  }
}
