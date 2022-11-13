
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/utils/espacamento.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GenericButton extends StatelessWidget {

  final double height, width, fontSize;
  final String title;
  final Color background, fontColor;
  final Function() onPressed;

  const GenericButton({
    Key? key,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.background,
    required this.title,
    required this.fontColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: espaceAll(width, 0.01), //l, r, t, b
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: background,//Colors.red.withOpacity(0.4),  
        ),
        child: textoPadrao( height, title, fontSize, FontWeight.w400, 1, fontColor ),
        onPressed: onPressed,
      )
    );
  }
}
