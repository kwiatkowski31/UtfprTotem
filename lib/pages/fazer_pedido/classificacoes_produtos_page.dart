// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print, sort_child_properties_last, avoid_unnecessary_containers

import 'package:utfprtotem/components/pages/generic_animated_button.dart';
import 'package:utfprtotem/components/pages/generic_button.dart';
import 'package:utfprtotem/components/pages/grid_classificacao.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/model/classificacao_model.dart';
import 'package:utfprtotem/pages/finalizar_pedido/carrinho_page.dart';
import 'package:utfprtotem/pages/fazer_pedido/produtos_page.dart';
import 'package:utfprtotem/utils/nav.dart';
import 'package:utfprtotem/utils/popula_lista_classificacoes.dart';
import 'package:utfprtotem/venda/carrinho.dart';

class ClassificacoesProdutosPage extends StatefulWidget {
  const ClassificacoesProdutosPage({Key? key}) : super(key: key);

  @override
  State<ClassificacoesProdutosPage> createState() => _ClassificacoesProdutosPageState();
}

class _ClassificacoesProdutosPageState extends State<ClassificacoesProdutosPage> {

  List<ClassificacaoModel>? listaClassificacoes = [];


  @override
  void initState() {
    //TODO: implement initState
    listaClassificacoes = populaListaClassificacoes( listaClassificacoes! );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>( context );

    return Scaffold(

      resizeToAvoidBottomInset: false,
      //appBar: _appBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
            ? _body( 100.h, 100.w, controller )
            : _body( 100.w, 100.h, controller );
        }
      )
      //_body(),
      //bottomNavigationBar: _bottomMenuItems()

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
              child: GenericAnimatedButton(
                height: 10.h, 
                width: 25.w, 
                fontSize: 0.02,
                buttonColor: Color.fromARGB(255, 158, 7, 7), 
                label: 'Voltar', 
                fontColor: Colors.white,
                onPressed: () {
                  print('ClassificacoesProdutosPage ~> Clicou em Voltar!');
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
        height: 70.h,
        width: 100.w,
        color: Colors.red[100],

        child: listaClassificacoes != null ? 
          CustomScrollView(
            primary: false,
            scrollDirection: Axis.vertical,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                  ),

                  delegate: SliverChildBuilderDelegate(
                    ( context, int index ){
                      return _gridTile( index );
                    },
                    childCount: listaClassificacoes!.length,
                  ),
                ),
              ),
            ],
          )
          : Container( child: Text('Não foi possível carregar as classificações!') ),
      );
  }

///--------------------------------------------------------------------------[ Bottom ]
  _bottom( controller ){
    return 
      Container(
        height: 15.h,
        width: 100.w,
        color: Colors.green[100],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              height: 5.h, 
              width: 50.w, 
              padding: EdgeInsets.only( left: 5.w ),

              color: Colors.green[400],
              child: textoPadrao( 5.h, 'R\$ ${ Carrinho.sumAll().toStringAsFixed(2) }', 0.04, FontWeight.normal, 1, Colors.black ),//height, texto, ajuste, fontW, maxL, cor
            ),

            Container(
              padding: EdgeInsets.only( right: 5.w ),
              child: GenericAnimatedButton(
                height: 10.h, 
                width: 40.w, 
                fontSize: 0.03,
                buttonColor: Color.fromARGB(255, 53, 184, 81), 
                label: 'Finalizar', 
                fontColor: Colors.white,
                onPressed: () {
                  print('ClassificacoesProdutosPage ~> Clicou em Finalizar!');
                  push( context, CarrinhoPage() );
                }
              ),
            ),

          ],
        ),
      );
  }



///--------------------------------------------------------------------------[ GridTile ]
  _gridTile( int i ){
    return ClassificacaoGridTile( 
      classificacao: listaClassificacoes![ i ],
      isClassificacao: true,
      onPressed: (){
        print('ProdutosPage ~> Touched: ${listaClassificacoes![ i ].getCodClass()}');
        push( context, ProdutosPage( listaClassificacoes![ i ].getCodClass() ) );
      },
    );
  }


}