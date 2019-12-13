class User {
  String username;
  String telefone;
  String imagem;
  User({this.username, this.telefone, this.imagem});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      telefone: json['telefone'],
      imagem: json['imagem']
    );
  }
  set setUsername(String username){
    this.username = username;
  }
  set setTelefone(String telefone){
    this.telefone = telefone;
  }
  set setImagem(String imagem){
    this.imagem = imagem;
  }
}

class UserCredential {
  String telefone;  
  UserCredential({this.telefone});
  set setTelefone(String telefone){
    this.telefone = telefone;
  }
}
