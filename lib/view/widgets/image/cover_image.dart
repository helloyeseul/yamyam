import 'package:flutter/cupertino.dart';

class CoverImage extends Image {
  CoverImage.asset(String name)
      : super.asset(
          name,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        );
}
