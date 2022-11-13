
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/model/produto_carrinho.dart';
import 'package:utfprtotem/model/produto_model.dart';

class CardProdutoCardapio extends StatelessWidget {

  final ProdutoModel produto;

  const CardProdutoCardapio({ 
    required this.produto,
    Key? key,

  }) : super(key: key);

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: const EdgeInsets.only( left: 16, right: 16, top: 8, bottom: 8 ),

      child: Container(
        width: 100.w,
        height: 10.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular( 12 ),
          boxShadow: [
            BoxShadow( blurRadius: 4, color: Color(0x320E151B), offset: Offset(0, 1) )
          ],
        ),

        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              margin: EdgeInsets.only( left: 20, right: 10, top: 10, bottom: 10 ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular( 12 ),
                child: Image.asset( 'assets/images/food_default.png', fit: BoxFit.cover ),
              ),
            ),

            Container(
              width: 70.w,
              color: Colors.red,

              child: Column(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: 70.w,
                    height: 5.h,
                    color: Colors.blue,
                    child: textoPadrao( 100.h, produto.getNome(), 0.03, FontWeight.w400, 1, Colors.black ),
                  ),

                  Container(
                    width: 70.w,
                    height: 5.h,
                    color: Colors.blue,
                    child: textoPadrao( 100.h, 'R\$ ${produto.getPreco().toString()}', 0.02, FontWeight.w400, 1, Colors.black ),
                  ),

                ],
              ),
            ),
            
          ],
        ),
      ),

    );

  }
}