import 'package:get/get_connect/http/src/response/response.dart';

class ResponseBuilder {
  int? _statusCode = 200;

  final Map<String, String> _headers = <String, String>{
    'Content-Type': 'application/json',
    'Content-Length': '440',
  };

  final Map<String, dynamic> _body = <String, dynamic>{};
  String? _bodyString;

  void setStatusCode(int? value) {
    _statusCode = value;
  }

  void setBodyString(String? value) {
    _bodyString = value;
  }

  void addBody(Map<String, dynamic>? body) {
    _body.addAll(body ?? <String, dynamic>{});
  }

  void clearBody() {
    _body.clear();
  }

  void addHeaders(Map<String, String> headers) {
    _headers.addAll(headers);
  }

  Response build() => Response(
        statusCode: _statusCode,
        headers: _headers,
        body: _body,
        bodyString: _bodyString,
      );
}
