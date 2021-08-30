import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:yamstack/app/app_binding.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api.dart';
import 'package:yamstack/src/data/source/remote/api/user/login/user_api_impl.dart';
import 'package:yamstack/src/data/source/remote/dio_client.dart';

import 'test_binding.mocks.dart';

@GenerateMocks([Dio])
class TestBinding extends Bindings {
  @override
  void dependencies() {
    // dio
    Get.put<Dio>(AppBinding().dio, permanent: true);
    // dio mock
    Get.put<MockDio>(MockDio(), permanent: true);

    // client
    Get.put<DioClient>(DioClient(Get.find<MockDio>()), permanent: true);

    // api
    Get.put<UserApi>(UserApiImpl(Get.find<DioClient>()), permanent: true);
  }
}
