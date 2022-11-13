
import 'package:utfprtotem/model/produto_carrinho.dart';
import 'package:utfprtotem/model/produto_model.dart';


class Carrinho {
  
  static double total = 0.0;
  static List<ProdutoCarrinho>? carrinho;

  static adicionarProduto( ProdutoModel p, qtd ){
    ProdutoCarrinho prodc = ProdutoCarrinho( p.getNome(), p.getCodProduto(), p.getCodProduto(), p.getPreco(), qtd ); 
      
    carrinho ??= <ProdutoCarrinho>[];
    carrinho!.add( prodc );
    //total += p.getPreco() * qtd;
  }

  static sumAll(){
    double valorTotal = 0.00;

    /**/
    if( carrinho != null ){
      for( ProdutoCarrinho p in carrinho! ) {
        valorTotal += p.getPreco() * p.getQuantidade();
      }
    }

    return valorTotal;
  }

}