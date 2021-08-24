import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:yamstack/src/data/source/remote/api/user/response/user_sign_response.dart';
import 'package:yamstack/src/data/source/remote/mapper/response_mapper.dart';

void main() {
  final logger = Logger();

  test('map success response', () {
    // given
    const successResponse = '''
      {
        "message" : "LOGIN_SUCCESS",
        "code" : "LOGIN_SUCCESS",
        "status" : 200,
        "accessToken" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0QGFhYS5iYmIiLCJyb2xlIjoiVVNFUiIsInR5cGUiOiJhY2Nlc3MiLCJleHAiOjE2MjgwMDE0MjR9.ANkMTlZR3IoXam5RTsZALeyCABxsjP9dh-V2EMjlMHU",
        "refreshToken" : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0QGFhYS5iYmIiLCJyb2xlIjoiVVNFUiIsInR5cGUiOiJyZWZyZXNoIiwiZXhwIjoxNjI4MDAxNDI0fQ.xKBoThFP90XEs-OwVLICa7p0atYi6BbTXsbWUdSwzno"
      }''';

    // when
    final response = mapResponse<UserSignResponse>(
      json.decode(successResponse) as Map<String, dynamic>,
    );

    // then
    logger.d(response);
  });

  test('map error response', () {
    // given
    const errorResponse = '''
      {
        "message": "DUPLICATED_ACCOUNT",
        "code": "DUPLICATED_ACCOUNT",
        "status": 400
      }''';

    // when
    final response = mapResponse<UserSignResponse>(
      json.decode(errorResponse) as Map<String, dynamic>,
    );

    // then
    logger.d(response);
  });
}
