// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:utfprtotem/components/pages/generic_animated_button.dart';
import 'package:utfprtotem/components/pages/generic_button.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/pages/finalizar_pedido/pedido_finalizado_page.dart';
import 'package:utfprtotem/utils/nav.dart';

class FinalizandoPedidoPage extends StatefulWidget {
  const FinalizandoPedidoPage({Key? key}) : super(key: key);

  @override
  State<FinalizandoPedidoPage> createState() => _FinalizandoPedidoPageState();
}

class _FinalizandoPedidoPageState extends State<FinalizandoPedidoPage> {

  late Timer timer;
  int contTimer = 0;
  

  @override
  Widget build(BuildContext context) {
    final controller        = Provider.of<Controller>( context );

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

      color: Colors.white,//Colors.blue[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Container(
            height: 10.h,
            width: 100.w,
            child: Center(
              child: textoPadrao( 5.h, 'Como deseja pagar?', 0.03, FontWeight.normal, 2, Colors.black ),
            )
          ),

          SizedBox( height: 10.h ),

          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Container(
                padding: EdgeInsets.only( left: 5.w ),
                child: GenericAnimatedButton(
                  height: 10.h, 
                  width: 40.w, 
                  fontSize: 0.03,
                  buttonColor: Color.fromARGB(255, 52, 111, 179), 
                  label: 'Cartão', 
                  fontColor: Colors.white,
                  onPressed: () {
                    print('Clicou em CARTAO!');
                    //push( context, PedidoFinalizadoPage() );

                    processaTransacao();
                  }
                ),
              ),

              SizedBox( width: 10.w ),

              Container(
                padding: EdgeInsets.only( right: 5.w ),
                child: GenericAnimatedButton(
                  height: 10.h, 
                  width: 40.w, 
                  fontSize: 0.03,
                  buttonColor: Color.fromARGB(255, 49, 185, 78), 
                  label: 'Dinheiro', 
                  fontColor: Colors.white,
                  onPressed: () {
                    print('Clicou em DINHEIRO!');
                    //push( context, PedidoFinalizadoPage() );

                    processaTransacao();
                  }
                ),
              ),

            ],
          ),

        ],
      )
    ); 
  }


///--------------------------------------------------------------------------[ Dialog ]
  Future<void> dialogAdicionarProduto() async {
    int qtd = 1;

    return 
      showDialog(
        context: context,
        builder: ( context ) {

          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[

                  Container(
                    height: 5.h,
                    width: 80.w,
                    //color: Colors.yellow[100],
                    child: Center(
                      child: textoPadrao( 10.h, 'Processando', 0.03, FontWeight.w400, 1, Colors.black ),
                    )
                  ),

                  SizedBox( height: 2.h ),

                  Container(
                    height: 15.h,
                    width: 80.w,
                    child: Center(
                      child: Container(
                        height: 15.h,
                        width: 15.h,
                        child: CircularProgressIndicator()
                      ),
                    ),
                  ),

                  SizedBox( height: 2.h ),

                  Container(
                    height: 5.h,
                    width: 80.w,
                    //color: Colors.yellow[100],
                    child: Center(
                      child: textoPadrao( 10.h, 'Aguarde...', 0.025, FontWeight.w400, 1, Colors.black ),
                    )
                  ),
                      

                ],
              ),
            )
          );
        },
      );
  }


  processaTransacao() {
    dialogAdicionarProduto();
    timerProcessando();
  }

///--------------------------------------------------------------------------[ TimerProcessando ]

  timerProcessando(){
    contTimer = 0;
    const oneSec = Duration(seconds: 1);

    timer = Timer.periodic(
      oneSec,
      (Timer tempo) {
        if ( contTimer > 2 ) {
          timer.cancel();
          //pushReplacement( context, HomePage() );
          //dispose();

          pop( context );
          push( context, PedidoFinalizadoPage() );
        } 
        else {
          contTimer++;
          print('timer --> $contTimer');
        }
      },
    );
  }



}