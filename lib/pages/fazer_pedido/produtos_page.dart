// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print, sized_box_for_whitespace,, sort_child_properties_last, unused_field, curly_braces_in_flow_control_structures 

import 'package:utfprtotem/components/pages/generic_animated_button.dart';
import 'package:utfprtotem/components/pages/generic_button.dart';
import 'package:utfprtotem/components/pages/grid_produto.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/model/produto_model.dart';
import 'package:utfprtotem/pages/finalizar_pedido/carrinho_page.dart';
import 'package:utfprtotem/utils/nav.dart';
import 'package:utfprtotem/utils/popula_lista_produtos.dart';
import 'package:utfprtotem/venda/carrinho.dart';

class ProdutosPage extends StatefulWidget {

  final int codClassificacao;

  //const ProdutosPage({Key? key}) : super(key: key);

  const ProdutosPage( this.codClassificacao, {Key? key} ) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {

  late List<ProdutoModel> listaProdutos = [];
  StateSetter? _setStateDialog;

  @override
  void initState() {
    //TODO: implement initState
    listaProdutos = populaListaProdutos( listaProdutos );
    _setStateDialog = setState;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final controller        = Provider.of<Controller>( context );

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

          _mid( controller ),

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
                  print('ProdutosPage ~> Clicou em Voltar!');
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
  _mid( controller ){
    return 
      Container(
        height: 70.h,
        width: 100.w,
        color: Colors.red[100],

        child: listaProdutos != null ? 
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
                      return _gridTile( index, controller );
                    },
                    childCount: listaProdutos.length,
                  ),
                ),
              ),
            ],
          )
          : Container( child: Text('Não foi possível carregar os produtos!') ),
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
              //child: textoPadrao( 5.h, 'R\$ 10,00', 0.04, FontWeight.normal, 1, Colors.black ),//height, texto, ajuste, fontW, maxL, crossAxisAlignment
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
  _gridTile( int i, controller ){
    return ProdutoGridTile( 
      produto: listaProdutos[ i ],
      onPressed: (){
        print('ProdutosPage ~> Touched: ${listaProdutos[ i ].getNome()}');
        dialogAdicionarProduto( listaProdutos[ i ], controller );
      },
    );
  }


///--------------------------------------------------------------------------[ Dialog ]
  Future<void> dialogAdicionarProduto( ProdutoModel produto, controller ) async {
    int qtd = 1;

    return 
      showDialog(
        context: context,
        builder: (context) {

          return StatefulBuilder(
            builder: (context, setState) {
              _setStateDialog = setState;

              return AlertDialog(
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[

                      Container(
                        height: 5.h,
                        width: 80.w,
                        color: Colors.yellow[100],
                        child: Center(
                          child: textoPadrao( 10.h, produto.getNome(), 0.03, FontWeight.w400, 1, Colors.black ),
                        )
                      ),

                      SizedBox( height: 2.h ),

                      Row(///-------------------------------------------------------[ Menos/Mais ]
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Expanded( child: Container() ),

                          Expanded(
                            child: GenericButton(
                              height: 5.h, 
                              width: 5.w, 
                              fontSize: 0.03,
                              background: Color.fromARGB(255, 211, 73, 71),
                              title: '-', 
                              fontColor: Colors.white, 
                              onPressed: () {
                                print('Clicou em MENOS -> $qtd');

                                _setStateDialog!(() {
                                  if( qtd > 1 )
                                    qtd--;
                                });
                              }
                            ),
                          ),

                          Expanded(
                            child: Center(
                              child: textoPadrao( 10.h, qtd.toString(), 0.03, FontWeight.w400, 1, Colors.black ),
                            )
                          ),

                          Expanded(
                            child: GenericButton(
                              height: 5.h, 
                              width: 5.w, 
                              fontSize: 0.03,
                              background: Color.fromARGB(255, 81, 192, 85), 
                              title: '+', 
                              fontColor: Colors.white,
                              onPressed: () {
                                print('Clicou em MAIS -> $qtd');
                                _setStateDialog!(() {
                                  qtd++;
                                });
                              }
                            ),
                          ),

                          Expanded( child: Container() ),

                        ],
                      ),

                      SizedBox( height: 2.h ),

                      Row(///-------------------------------------------------------[ Confirmar/Cancelar ]
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Expanded(
                            child: GenericButton(
                              height: 5.h, 
                              width: 5.w, 
                              fontSize: 0.02,
                              background: Color.fromARGB(255, 105, 7, 7), 
                              title: 'Cancelar', 
                              fontColor: Colors.white,
                              onPressed: () {
                                print('Clicou em CANCELAR');
                                pop( context );
                              }
                            ),
                          ),

                          Expanded(
                            child: GenericButton(
                              height: 5.h, 
                              width: 5.w, 
                              fontSize: 0.02,
                              background: Color.fromARGB(255, 20, 134, 20), 
                              title: 'Adicionar', 
                              fontColor: Colors.white,
                              onPressed: () {
                                print('Clicou em ADICIONAR');
                                pop( context );
                                Carrinho.adicionarProduto( produto, qtd );
                                print('~~~~~~~~~~~~~~> carrinho: ${Carrinho.carrinho!.length}');
                              }
                            ),
                          ),
                          
                        ],
                      ),

                    ],
                  ),
                )
              );
            },
          );
        },
      );
  }

  
}