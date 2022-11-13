// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers,ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors

import 'package:utfprtotem/components/pages/card_produto_carrinho.dart';
import 'package:utfprtotem/components/pages/generic_animated_button.dart';
import 'package:utfprtotem/components/pages/generic_button.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/pages/finalizar_pedido/finalizando_pedido_page.dart';
import 'package:utfprtotem/utils/nav.dart';
import 'package:utfprtotem/venda/carrinho.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({Key? key}) : super(key: key);

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {

  Color cor_A = Color(0xfffcd5a4);
  Color? cor_V = Colors.green[200];
  Color? cor_G = Colors.grey[700];

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
          
          _top(),

          _mid(),

          _bottom( controller )

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
                  print('CarrinhoPage ~> Clicou em Voltar!');
                  pop( context );
                }
              ),
            ),

            Container()

          ],
        ),
      );
  }

///--------------------------------------------------------------------------[ Mid ]
  _mid(){
    return 
      Container(
        height: 65.h,
        width: 100.w,
        color: Colors.red[100],

        child: StatefulBuilder(
          builder: ( context, setStateCard ) {

            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: Carrinho.carrinho!.length,
              itemBuilder: ( BuildContext context, int index ) {
          
                return CardProdutoCarrinho( 
                  produto: Carrinho.carrinho![ index ],
                  onPressed: (){
                    print('vsfffff');
                    setStateCard( (){
                      Carrinho.carrinho!.removeAt( index );
                    });
                  },
                );
              }
            );

          }
        )
      );
  }

///--------------------------------------------------------------------------[ Bottom ]
  _bottom( controller ){
    return 
      Container(
        height: 20.h,
        width: 100.w,
        color: Colors.green[100],

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              height: 5.h,
              width: 50.w,
              child: Center(
                child: textoPadrao( 5.h, 'Total: R\$ ${ Carrinho.sumAll().toStringAsFixed(2) }', 0.04, FontWeight.normal, 1, Colors.black, letterSpc: 2.0 ),//height, texto, ajuste, fontW, maxL, cor
              )
            ),

            /*Container(
              //padding: EdgeInsets.only( bottom: 5.w ),
              child: GenericButton(
                height: 10.h, 
                width: 85.w, 
                fontSize: 0.03,
                background: Colors.white, 
                title: 'Confimar Pedido', 
                fontColor: Colors.black,
                onPressed: () {
                  print('CarrinhoPage ~> Clicou em Finalizar!');
                  push( context, FinalizandoPedidoPage() );
                  //push( context, CarrinhoPage() );
                }
              ),
            ),*/

            Container(
                padding: EdgeInsets.only( bottom: 2.h ),
                child: GenericAnimatedButton(
                  height: 10.h, 
                  width: 85.w,
                  fontSize: 0.03,
                  buttonColor: Color.fromARGB(255, 98, 129, 233), 
                  label: 'Confimar Pedido', 
                  fontColor: Colors.white,
                  onPressed: () {
                    print('CarrinhoPage ~> Clicou em Finalizar!');
                    push( context, FinalizandoPedidoPage() );
                  }
                ),
              ),

          ],
        ),
      );
  }


}