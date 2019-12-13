import 'dart:collection';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarrinhoState with ChangeNotifier {
  CarrinhoState();

  String _displayText = "teste";
  List<Produto> _produtos =[];
  int _qtdProdutosCarrinho = 0;
  double totalCarrinho     = 0;

  void setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }
  void adicionarProdutoCarrinho(String id,String nomeProduto,String imagem,String preco,String descricao){
     bool temNoCarrinho = false;
      _qtdProdutosCarrinho = _qtdProdutosCarrinho + 1;
     _produtos.asMap().forEach((index,produto){
       if(produto.id == id){
         produto.qtd = produto.qtd + 1;
        
         _produtos[index] = produto;
         temNoCarrinho = true;
       }
     });
     if(!temNoCarrinho){
        _produtos.add(new Produto(id,nomeProduto,imagem,preco,descricao));
        
     }    
     totalCarrinho += double.parse(preco.replaceAll(',', '.'));    
    notifyListeners();
  }
  void removerProdutoCarrinho(Produto produto){
    totalCarrinho -= double.parse(produto.preco.replaceAll(',', '.'));
    _qtdProdutosCarrinho = _qtdProdutosCarrinho - produto.qtd;
    _produtos.remove(produto);    
    notifyListeners();
  }
  Future<String> fazerPedidoTexto() async {
    if(_produtos.length == 0){
      return '';
    }
    FirebaseUser usuario = await FirebaseAuth.instance.currentUser();
   await Firestore.instance.collection('pedidos').add({
      'produtos':_produtos.map((produto){
        return produto.toJson();
    }).toList(),
      'qtdProdutos':_qtdProdutosCarrinho.toString(),
      'status':'Aguardando Confirmação',
      'total' : totalCarrinho.toString(),
      'pedidoFeitoPor':usuario.uid.toString(),
      'dataPedido':new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).millisecondsSinceEpoch,
      'usuario':{'displayName':usuario.displayName.toString(),
                                'uid':usuario.uid.toString(),
                                'email':usuario.email.toString(),
                                'photoUrl':usuario.photoUrl.toString(),
                                'phoneNumber':usuario.phoneNumber.toString()}
    });
    await Firestore.instance.collection('usuarios')
                      .document(usuario.uid.toString())
                      .setData({'displayName':usuario.displayName.toString(),
                                'uid':usuario.uid.toString(),
                                'email':usuario.email.toString(),
                                'photoUrl':usuario.photoUrl.toString(),
                                'phoneNumber':usuario.phoneNumber.toString()});
    String pedido = 'Ola \nGostaria de fazer o pedido\n Dos seguintes produtos\n';

    _produtos.asMap().forEach((index,produto){
      pedido = pedido + ' '+ produto.qtd.toString() +'x'  + ' '+produto.nomeProduto+' valor: '+produto.preco+ ' \n';
      print(pedido);
    });
    _produtos.clear();
    totalCarrinho = 0;
    _qtdProdutosCarrinho = 0;
    notifyListeners();
    return pedido;
  }
  double get getTotalCarrinho        => totalCarrinho;
  String get getDisplayText          => _displayText;
  int    get getQtdProdutosCarrinho  => _qtdProdutosCarrinho;
  UnmodifiableListView<Produto> get getProdutos => UnmodifiableListView(_produtos.toList());
}