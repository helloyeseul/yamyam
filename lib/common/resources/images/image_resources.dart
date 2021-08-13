import 'package:flutter/foundation.dart';

@immutable
class ImageResources {
  static const _root = 'assets/images';

  final introBackground = '$_root/intro_bg.jpg';

  String get(String name) => '$_root/$name';
}
