class Produto{
  String id,nomeProduto,imagem,preco,descricao;
  int    qtd = 1;
  Produto(this.id,this.nomeProduto,this.imagem,this.preco,this.descricao);
  String get getNomeProduto => nomeProduto;
  String get getImagem      => imagem;
  String get getPreco       => preco;
  String get getDescricao   => descricao;
  Produto.fromMap(Map<dynamic,dynamic>map){
    this.nomeProduto = map['nomeProduto'];
    this.imagem      = map['imagem'];
    this.id          = map['key'];
    this.preco       = map['preco'];
    this.qtd         = map['qtd'];
    this.descricao   = map['descricao'];
  }
  Map<String,dynamic>toJson(){
    return{
      "nomeProduto":this.nomeProduto,
      "imagem":this.imagem,
      "key":this.id,
      "preco" :this.preco,
      "descricao":this.descricao,
      "qtd":this.qtd
    };
  }
}