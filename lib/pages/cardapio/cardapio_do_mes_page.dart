// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print

import 'package:utfprtotem/components/pages/card_item_cardapio.dart';
import 'package:utfprtotem/components/pages/card_produto_cardapio.dart';
import 'package:utfprtotem/components/pages/generic_animated_button.dart';
import 'package:utfprtotem/components/pages/generic_button.dart';
import 'package:utfprtotem/components/pages/grid_cardapio.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/model/produto_model.dart';
import 'package:utfprtotem/utils/nav.dart';
import 'package:utfprtotem/utils/popula_lista_produtos.dart';

class CardapioDoMesPage extends StatefulWidget {
  const CardapioDoMesPage({Key? key}) : super(key: key);

  @override
  State<CardapioDoMesPage> createState() => _CardapioDoMesPageState();
}

class _CardapioDoMesPageState extends State<CardapioDoMesPage> {

  late List<ProdutoModel> listaCardapio = [];

  @override
  void initState() {
    //TODO: implement initState
    listaCardapio = populaListaProdutos( listaCardapio );

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
                  print('CardapioDoMesPage ~> Clicou em Voltar!');
                  pop( context );
                }
              ),
            ),

            Container(
              padding: EdgeInsets.only( right: 5.w ),
              child: textoPadrao( 10.h, 'Cardapio do Mês', 0.025, FontWeight.normal, 1, Colors.black )
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

        child: StatefulBuilder(
          builder: ( context, setStateCard ) {

            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listaCardapio.length,
              itemBuilder: ( BuildContext context, int index ) {
          
                /*return CardProdutoCardapio( 
                  produto: listaCardapio[ index ],
                );*/

                return CardItemCardapio(
                  height: 10.h, 
                  width: 100.w,
                  produto: listaCardapio[ index ],
                  image: 'assets/images/card_image.jpg',
                  onPressed: () {},
                );

              }
            );

          }
        )
      );
  }


  _gridTile( int i, controller ){
    return CardapioGridTile( 
      produto: listaCardapio[ i ],
      onPressed: (){
        print('Clicou Produto Cardapio(Nao sera utilizado onClick aqui ou vai?)');
        //Quando clica aqui, direciona pra tela do produto
      },
    );
  }


}