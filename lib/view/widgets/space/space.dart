import 'package:flutter/material.dart';

class Space extends Padding {
  Space(double value) : super(padding: EdgeInsets.all(value));

  Space.small() : super(padding: EdgeInsets.all(8.0));
  Space.medium() : super(padding: EdgeInsets.all(16.0));
  Space.large() : super(padding: EdgeInsets.all(32.0));
  Space.xLarge() : super(padding: EdgeInsets.all(48.0));
}
