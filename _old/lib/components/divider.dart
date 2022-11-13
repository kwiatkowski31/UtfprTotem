
import 'package:flutter/material.dart';

divider(){
  return Divider(
    height: 10,
    thickness: 1,
    indent: 10,
    endIndent: 10,
    color: Colors.grey[800],
  );
}


dividerShort(){
  return Divider(
    height: 10,
    thickness: 1,
    indent: 40,
    endIndent: 40,
    color: Colors.grey[800],
  );
}


dividerVertical(){
  return VerticalDivider(
    width: 10,
    thickness: 1,
    indent: 0,
    endIndent: 0,
    color: Colors.grey[700],
  );
}