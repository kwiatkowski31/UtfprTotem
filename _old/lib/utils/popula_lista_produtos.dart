
import 'package:utfprtotem/model/produto_model.dart';

List<ProdutoModel> populaListaProdutos( List<ProdutoModel> listaVazia ){

  listaVazia.add( ProdutoModel('Lanche01', 1, 1, 5.00 ) );
  listaVazia.add( ProdutoModel('Lanche02', 1, 1, 4.35 ) );
  listaVazia.add( ProdutoModel('Lanche03', 1, 1, 2.79 ) );
  listaVazia.add( ProdutoModel('Lanche04', 1, 1, 6.89 ) );
  listaVazia.add( ProdutoModel('Lanche05', 1, 1, 1.59 ) );
  listaVazia.add( ProdutoModel('Lanche06', 1, 1, 8.49 ) );
  listaVazia.add( ProdutoModel('Lanche07', 1, 1, 3.49 ) );
  listaVazia.add( ProdutoModel('Lanche08', 1, 1, 10.79 ) );

  
   
  return listaVazia;
}