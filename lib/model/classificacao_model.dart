
// ignore_for_file: prefer_final_fields, unused_field, unused_element

import 'package:utfprtotem/model/produto_model.dart';

class ClassificacaoModel{

  String? _nome;
  int? _codClassificacao;
  List<ProdutoModel> _listaProdutos = [];

  ClassificacaoModel( this._nome, this._codClassificacao );

///------------------------------------------------------------------------[ GETTERS ]
  String getNome(){ return _nome!; }
  int getCodClass(){ return _codClassificacao!; }
  List<ProdutoModel> getListaProdutos(){ return _listaProdutos; }


///------------------------------------------------------------------------[ SETTERS ]
  
  _setProdutos( List<ProdutoModel> lista ){ _listaProdutos.addAll( lista ); }
  _addProduto( ProdutoModel produto ){ _listaProdutos.add( produto ); }

}