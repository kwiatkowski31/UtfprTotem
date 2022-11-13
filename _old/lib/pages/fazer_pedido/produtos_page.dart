// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print, sized_box_for_whitespace,, sort_child_properties_last 

import 'package:utfprtotem/components/pages/generic_button.dart';
import 'package:utfprtotem/controllers/config_controller.dart';
import 'package:utfprtotem/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/model/produto_model.dart';
import 'package:utfprtotem/utils/nav.dart';
import 'package:utfprtotem/utils/popula_lista_produtos.dart';

class ProdutosPage extends StatefulWidget {

  final int codClassificacao;

  //const ProdutosPage({Key? key}) : super(key: key);

  const ProdutosPage( this.codClassificacao, {Key? key} ) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {

  late List<ProdutoModel> listaProdutos;

  @override
  void initState() {
    //TODO: implement initState
    listaProdutos = populaListaProdutos( listaProdutos );

    super.initState();
  }


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

          Container(),

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
  _mid(){
    return 
      Container(
        height: 85.h,
        width: 100.w,
        child: CustomScrollView(
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
                  (context, int index) {
                    return _produtoCard( listaProdutos[ index ],  context );
                  },
                  childCount: listaProdutos.length,
                ),
              ),
            ),
          ],
        ),
      );
  }



  _produtoCard( produto, context ){
    return GestureDetector(
      child: GridTile(
        child: Image.asset("assets/images/comida.png", fit: BoxFit.cover),
        footer: ClipRRect(
          borderRadius: //BorderRadius.circular(10.0),
            BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)
            ),
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text( produto.getNome() ),
            trailing: Icon(
              Icons.fastfood,
              color: Colors.white,
            ),
          ),
        ), 
      ),
      onTap: () {
        print('ProdutosPage ~> Tocou no Produto!');
      },

    );
  }
  
}