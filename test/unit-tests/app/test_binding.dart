import 'package:get/get.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api_impl.dart';
import 'package:yamstack/src/data/source/remote/dio_client.dart';

import '../src/data/source/remote/mock_dio_client.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DioClient>(MockDioClient(), permanent: true);
    Get.put<UserApi>(UserApiImpl(Get.find<DioClient>()), permanent: true);
  }
}
