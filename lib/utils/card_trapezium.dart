
import 'package:flutter/material.dart';

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip( Size size ) {
    final path = Path();
    path.lineTo(size.width * 4/5, 0.0);//Onde começa o traço na parte de cima
    path.lineTo(size.width * 3/5, size.height);//Onde começa o traço na parte de baixo

    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
  
  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}

class TrapeziumImageClipper extends CustomClipper<Path> {
  @override
  Path getClip( Size size ) {
    final path = Path();

    //..color = const Color.fromARGB(255, 33, 150, 243)
    //..style = PaintingStyle.stroke
    //..strokeWidth = 1;
         
    path.moveTo( size.width * 2/5, size.height );
    path.lineTo( size.width * 3/5, 0 );

    path.lineTo( size.width, 0 );
    path.lineTo( size.width, size.height );

    //path.quadraticBezierTo( size.width * 0.8293182, size.height, size.width * 0.3172727, size.height );
    //canvas.drawPath(path, paint0);

    path.close();
    return path;
  }
  
  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}