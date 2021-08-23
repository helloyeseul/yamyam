import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yamstack/resource/color_resource.dart';

abstract class NotoSans extends TextStyle {
  static TextStyle size(
    double fontSize, {
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacing = -0.4,
    Color color = ColorResource.black_0xff202020,
    bool underline = false,
  }) =>
      GoogleFonts.notoSans(
        textStyle: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          color: color,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
        ),
      );
}
