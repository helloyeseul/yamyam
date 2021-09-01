import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yamstack/resource/color_resource.dart';

class NotoSansText extends Text {
  NotoSansText(
    this.text, {
    required this.size,
    Key? key,
    this.fontWeight = FontWeight.w400,
    this.letterSpacing = -0.4,
    this.color = ColorResource.black_0xff202020,
    this.underline = false,
  }) : super(
          text,
          key: key,
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              fontWeight: fontWeight,
              fontSize: size,
              letterSpacing: letterSpacing,
              color: color,
              decoration:
                  underline ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        );

  final String text;
  final double size;
  final FontWeight fontWeight;
  final double letterSpacing;
  final Color color;
  final bool underline;
}
