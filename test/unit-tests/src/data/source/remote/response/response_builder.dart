import 'package:dio/dio.dart';

class ResponseBuilder {
  int? _statusCode = 200;

  final Map<String, dynamic> _body = <String, dynamic>{};

  void setStatusCode(int? value) {
    _statusCode = value;
  }

  void addBody(Map<String, dynamic>? body) {
    _body.addAll(body ?? <String, dynamic>{});
  }

  void clearBody() {
    _body.clear();
  }

  Response build() => Response(
        data: _body,
        requestOptions: RequestOptions(path: ''),
        statusCode: _statusCode,
      );
}
