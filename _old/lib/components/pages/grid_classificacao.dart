// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:utfprtotem/model/classificacao_model.dart';

class ClassificacaoGridTile extends StatelessWidget {

  final ClassificacaoModel classificacao;
  final bool isClassificacao;
  final Function() onPressed;

  const ClassificacaoGridTile({
      Key? key,
      required this.classificacao,
      required this.isClassificacao,
      required this.onPressed,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.all( Radius.circular(10.0) ),
        ),

        child: GridTile(
          child: Image.asset( "assets/images/food_default.png", fit: BoxFit.cover ),
          footer: ClipRRect(
            borderRadius: //BorderRadius.circular(10.0),
              BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)
              ),
            child: isClassificacao ? 
              GridTileBar(
                backgroundColor: Colors.black45,
                title: Text( classificacao.getNome() )
              )
              : GridTileBar(
                backgroundColor: Colors.black45,
                title: Text( classificacao.getNome() ),
                trailing: Icon( Icons.fastfood, color: Colors.white )
              )

          ), 
        ),
      ),
      onTap: onPressed,
    );
  }
}