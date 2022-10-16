// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

google_text_style_01( size, ajuste, fontW, cor, {letterSpc = 1.5}) {
  return GoogleFonts.raleway(
    //josefinSans
    textStyle: TextStyle(
      fontSize: size.height * ajuste,
      letterSpacing: letterSpc,
      color: cor,
      fontWeight: fontW,
      decoration: TextDecoration.none,
    ),
  );
}
