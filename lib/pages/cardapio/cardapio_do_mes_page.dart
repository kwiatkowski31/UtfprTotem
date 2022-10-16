// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print

import 'package:utfprtotem/components/pages/generic_button.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/controllers/config_controller.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/utils/nav.dart';

class CardapioDoMesPage extends StatefulWidget {
  const CardapioDoMesPage({Key? key}) : super(key: key);

  @override
  State<CardapioDoMesPage> createState() => _CardapioDoMesPageState();
}

class _CardapioDoMesPageState extends State<CardapioDoMesPage> {

  Color cor_A = Color(0xfffcd5a4);
  Color? cor_V = Colors.green[200];
  Color? cor_G = Colors.grey[700];

  @override
  Widget build(BuildContext context) {
    final controller        = Provider.of<Controller>( context );
    final configController  = Provider.of<ConfigController>( context );

    return Scaffold(

      resizeToAvoidBottomInset: false,
      //appBar: _appBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
            ? _body( 100.h, 100.w, controller, configController )
            : _body( 100.w, 100.h, controller, configController );
        }
      )
      //_body(),
      //bottomNavigationBar: _bottomMenuItems()

    );
  }

  _body( height, width, controller, configController ){
    return Container(
      width: 100.h,
      height: 100.h,

      color: Colors.blue[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          _top(),

          _mid(),

        ],
      )
    );
  }

///--------------------------------------------------------------------------[ Top ]
  _top(){
    return 
      Container(
        height: 15.h,
        width: 100.w,
        color: Colors.blue[100],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              padding: EdgeInsets.only( left: 5.w ),
              child: GenericButton(
                height: 10.h, 
                width: 20.w, 
                fontSize: 0.015,
                background: Colors.white, 
                title: 'Voltar', 
                fontColor: Colors.black,
                onPressed: () {
                  print('CardapioDoMes ~> Clicou em Voltar!');
                  pop( context );
                }
              ),
            ),

            Container(
              padding: EdgeInsets.only( right: 5.w ),
              child: textoPadrao( 10.h, 'Cardapio do Mês', 0.04, FontWeight.normal, 1, Colors.black )
            ),

          ],
        ),
      );
  }

///--------------------------------------------------------------------------[ Mid ]
  _mid(){
    return 
      Container(
        height: 85.h,
        width: 100.w,
        color: Colors.red[100],
      );
  }

}