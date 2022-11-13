

import 'package:utfprtotem/model/classificacao_model.dart';
import 'package:utfprtotem/model/produto_model.dart';

class AllProdutos{

  static List<ClassificacaoModel>  allClassificacoes = [];
  static List<ProdutoModel>        allProdutos       = [];


  setClassificacoes( List<ClassificacaoModel> lista ){ allClassificacoes.addAll( lista ); }
  setProdutos( List<ProdutoModel> lista ){ allProdutos.addAll( lista ); }

  getClassificacoes(){ return allClassificacoes; }
  getProdutos(){ return allProdutos; }

}








