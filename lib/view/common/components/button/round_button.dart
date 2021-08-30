import 'package:flutter/material.dart';
import 'package:yamstack/view/common/components/text/noto_sans_text.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.borderRadius = 4.0,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: Container(
        height: 48,
        color: backgroundColor,
        child: TextButton(
            onPressed: onPressed,
            child: NotoSansText(text, size: 16, color: textColor)),
      ),
    );
  }
}
