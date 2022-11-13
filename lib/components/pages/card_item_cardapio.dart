// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:utfprtotem/components/texto_padrao.dart';
import 'package:utfprtotem/utils/card_trapezium.dart';

class CardItemCardapio extends StatelessWidget {

  final double height;
  final double width;
  final String title;
  final String valor;
  final String image;
  final Function() onPressed;

  const CardItemCardapio
({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
    required this.valor,
    required this.image,

    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        // ignore: sort_child_properties_last
        child: Container(
          height: height,
          width: width,
          
          decoration: BoxDecoration(
            color: Colors.transparent,
            //border: Border.all( color: Colors.red, width: 2 ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),

          child: Container(
            width: width * 0.2,
            height: width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white.withOpacity(0.1),
            ),

            child: Stack(
              children: [
                //~~~~~~~~~~~~~~~~~~~~~[ 1º Metade do Card ]

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: width,
                    height: height,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: width * 0.5,
                        height: height,
                
                        //decoration: BoxDecoration( image: DecorationImage(image: AssetImage(image), fit: BoxFit.fitWidth) ),
                        child: Image.asset( image, fit: BoxFit.fitWidth ),
                      )
                    ),
                  ),
                ),

                //~~~~~~~~~~~~~~~~~~~~~[ 2º Metade do Card ]
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: ClipPath(
                    clipper: TrapeziumClipper(),
                    child: Container(
                      width: width * 0.9,//90% o tamanho do card
                      height: height,//100% a altura do card
                      color: Colors.grey[200],
                      padding: EdgeInsets.only( top: 8.0, bottom: 8.0, left: 20.0, right: 50.0),
                
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Nome do Produto
                          textoCardProduto( title, 0.03, FontWeight.w400, 1, Colors.grey[700] ),
                          //Preço do Produto
                          textoCardProduto( valor, 0.025, FontWeight.w400, 1, Colors.grey[500] ),
                        ],
                      )
                    ),
                  ),
                ),

              ],
            ),
            
          ),
        ),
        onTap: onPressed
      );
  }
}