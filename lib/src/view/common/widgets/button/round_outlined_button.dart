import 'package:flutter/material.dart';
import 'package:yamstack/src/view/common/widgets/text/fontstyle/noto_sans.dart';

class RoundOutlinedButton extends StatelessWidget {
  const RoundOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderRadius = 4.0,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius)),
      splashColor: Colors.transparent,
      child: Text(text, style: NotoSans.size(16, color: textColor)),
    );
  }
}
