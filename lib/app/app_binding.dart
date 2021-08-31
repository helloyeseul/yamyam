import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamstack/data/remote/api/user/login/user_login_api.dart';
import 'package:yamstack/data/remote/interceptor/error_interceptor.dart';
import 'package:yamstack/data/remote/interceptor/response_interceptor.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository.dart';
import 'package:yamstack/data/repository/user/login/user_login_repository_impl.dart';

class AppBinding extends Bindings {
  static const String _baseUrl = 'http://yam-stack.com';

  @override
  void dependencies() {
    Get.put<Dio>(dio, permanent: true);
    Get.put(UserLoginApi(Get.find<Dio>()), permanent: true);
    Get.put<UserLoginRepository>(
      UserLoginRepositoryImpl(Get.find()),
      permanent: true,
    );
  }

  @visibleForTesting
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: 30000,
          receiveTimeout: 30000,
          sendTimeout: 30000,
          receiveDataWhenStatusError: true,
          headers: <String, dynamic>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8'
          },
        ),
      )..interceptors.addAll([
          LogInterceptor(
            requestHeader: false,
            requestBody: true,
            responseBody: true,
          ),
          ResponseInterceptor(),
          ErrorInterceptor(),
        ]);
}
