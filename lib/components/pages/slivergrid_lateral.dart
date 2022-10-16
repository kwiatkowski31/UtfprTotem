// ignore_for_file:prefer_const_constructors

import 'package:flutter/material.dart';

class SliverGridLateral extends StatelessWidget {
  const SliverGridLateral({
    Key? key
  }) : super(key: key);

  //A lista eu pego do controller

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                return null;//_item( listaDeClassificacoes, index, context, listaImagensAltaDef);
              },
              childCount: 1//listaDeClassificacoes.length,
            ),
          ),
        ),
      ],
    );
  }
}
