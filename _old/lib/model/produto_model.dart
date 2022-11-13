
// ignore_for_file: prefer_final_fields, unused_field

class ProdutoModel{

  String? _nome;
  int? _codClassificacao;
  int? _codProduto;
  double? _preco;

  ProdutoModel( this._nome, this._codClassificacao, this._codProduto, this._preco);

  String getNome(){ return _nome!; }
  int getClassPai(){ return _codClassificacao!; }
  int getCodProduto(){ return _codProduto!; }
  double getPreco(){ return _preco!; }


}