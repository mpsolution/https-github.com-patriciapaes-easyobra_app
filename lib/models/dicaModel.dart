class DicaModel{
  String titulo = '';
  String conteudo = '';
  String capa = '';
  DicaModel({this.titulo,this.conteudo,this.capa});
  @override
  String toString() {
    // TODO: implement toString
    return 'Titulo ${this.titulo} CONTEUDO ${this.conteudo} CAPA ${this.capa}';
  }
}