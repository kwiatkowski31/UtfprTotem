

import 'package:flutter/cupertino.dart';



espace( size, l, r, t, b ){
  return EdgeInsets.only( left: size * l, right: size * r, top: size * t, bottom: size * b );
}

espaceAll( size, espaco ){
  return EdgeInsets.all( size * espaco );
}