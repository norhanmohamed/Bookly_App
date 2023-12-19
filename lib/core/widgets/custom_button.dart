import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.backgroundColor,
      required this.textCOlor,
      this.borderRadius,
      required this.text,
      this.fontsize,
      this.onPressed})
      : super(key: key);
  final Color backgroundColor;
  final Color textCOlor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontsize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              BorderRadius.circular(
                12,
              ),
        ),
        backgroundColor: backgroundColor,
      ),
      child: Text(
        text,
        style: Styles.tesxtStyle18.copyWith(
          color: textCOlor,
          fontWeight: FontWeight.w900,
          fontSize: fontsize,
        ),
      ),
    );
  }
}
