import 'package:json_annotation/json_annotation.dart';

class IntConverter implements JsonConverter<int, Object?> {
  const IntConverter();

  @override
  int fromJson(Object? object) {
    if (object == null) return 0;
    if (object is num) return object.toInt();
    if (object is String) {
      return int.tryParse(object) ?? 0;
    }
    return 0;
  }

  @override
  Object? toJson(int object) => object;
}
