import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:yamstack/extensions/future_helper.dart';

import '../../../../test_binding.mocks.dart';
import 'mock_response.dart';

void setupMockDioPostAnswer(int statusCode, String dataString) {
  when(Get.find<MockDio>().post(any, data: anyNamed('data'))).thenAnswer(
    (_) => MockResponse(
      statusCode: statusCode,
      dataString: dataString,
    ).toFuture(),
  );
}

void verifyMockDioPostCalled() {
  verify(Get.find<MockDio>().post(any, data: anyNamed('data')));
}
