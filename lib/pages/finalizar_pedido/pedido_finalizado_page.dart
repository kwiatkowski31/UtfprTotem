// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:utfprtotem/components/pages/generic_button.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/pages/home/home_page.dart';
import 'package:utfprtotem/utils/nav.dart';

class PedidoFinalizadoPage extends StatefulWidget {
  const PedidoFinalizadoPage({Key? key}) : super(key: key);

  @override
  State<PedidoFinalizadoPage> createState() => _PedidoFinalizadoPageState();
}

class _PedidoFinalizadoPageState extends State<PedidoFinalizadoPage> {

  late Timer timer;
  int contTimer = 0;

  @override
  void initState() {
    timerMsg();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>( context );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
            ? _body( 100.h, 100.w, controller )
            : _body( 100.w, 100.h, controller );
        }
      )
    );
  }

  _body( height, width, controller ){
    return Container(
      width: 100.h,
      height: 100.h,

      color: Colors.blue[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Container(
            child: textoPadrao( 5.h, '   Pedido Finalizado\nLeve a ficha ao caixa!', 0.035, FontWeight.normal, 2, Colors.black ),//text size: parte1(17) // parte2(22)
          ),

        ],
      )
    );
  }


///---------------------------------------------------------------------[ Timer ]

  timerMsg() async {
    contTimer = 0;
    const oneSec = Duration(seconds: 1);

    timer = Timer.periodic(
      oneSec,
      (Timer tempo) {
        if ( contTimer > 2 ) {
          timer.cancel();
          pushReplacement( context, HomePage() );
          //dispose();
        } 
        else {
          contTimer++;
          print('timer --> $contTimer');
        }
      },
    );
  }


}