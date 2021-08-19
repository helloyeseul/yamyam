import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class NotoSans {
  static TextStyle size20({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacing = -0.4,
    Color color = Colors.black,
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

  static TextStyle size18({
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacing = -0.4,
    Color color = Colors.black,
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

  static TextStyle size16({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = -0.4,
    Color color = Colors.black,
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

  static TextStyle size12({
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacing = -0.4,
    Color color = Colors.black,
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

  static TextStyle size9({
    double fontSize = 9,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = -0.24,
    Color color = Colors.black,
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
