
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

//textoPadrao('aloo', size, 0.035, FontWight.w400, 1, Colors.black)
textoPadrao( height, texto, ajuste, fontW, maxL, cor, {letterSpc = 1.5} ){
  return Text(
    texto,
    style: GoogleFonts.raleway(//josefinSans
      textStyle: TextStyle(
        fontSize: 100.h * ajuste,//0.025,
        letterSpacing: letterSpc,//1.5,
        color: cor,//Colors.black,
        fontWeight: fontW,
        decoration: TextDecoration.none,
      ),
    ),
    maxLines: maxL,
    overflow: TextOverflow.ellipsis,
  );
}

///---------------------------------------------------------------------------------[ Texto_Padrao_Fonte2 ]
textoPadraoF2( height, texto, ajuste, fontW, maxL, cor, {letterSpc = 1.5} ){
  return Text(
    texto,
    style: GoogleFonts.raleway(//josefinSans
      textStyle: TextStyle(
        fontSize: 100.h * ajuste,//0.025,
        letterSpacing: letterSpc,//1.5,
        color: cor,//Colors.black,
        fontWeight: fontW,
        decoration: TextDecoration.none,
      ),
    ),
    maxLines: maxL,
    overflow: TextOverflow.ellipsis,
  );
}