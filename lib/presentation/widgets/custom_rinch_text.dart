import 'package:flutter/material.dart';

class ColoredText extends StatelessWidget {
  final String text;
  final Color color;

  const ColoredText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
