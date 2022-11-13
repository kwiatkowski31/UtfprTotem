import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:utfprtotem/components/texto_padrao.dart';


class GenericAnimatedButton extends StatelessWidget {

  final double height, width, fontSize;
  final String label;
  final Color fontColor, buttonColor;
  final Function() onPressed;

  const GenericAnimatedButton({
      Key? key,
      required this.height,
      required this.width,
      required this.fontSize,
      required this.label,
      required this.fontColor,
      required this.buttonColor,
      required this.onPressed,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: espaceAll(width, 0.01), //l, r, t, b

      child: Center(
        child: AnimatedButton(
          width: width,
          height: height,
          color: buttonColor,

          child: textoPadraoF2( height, label, fontSize, FontWeight.w400, 1, fontColor ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}