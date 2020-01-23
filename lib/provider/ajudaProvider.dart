import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AjudaProviderState with ChangeNotifier {
  AjudaProviderState();

  Future<bool> criarAjuda(Map<String,dynamic> ajuda) async{
    bool ajudaSalva = false;
    DocumentReference ajudaDb = await  Firestore.instance.collection('pedidosAjuda').add({...ajuda});
    if(ajudaDb.documentID != null){
      ajudaSalva = true;
    }
    return ajudaSalva;
  }
  Stream<QuerySnapshot> opcoesAjuda() {
    return Firestore.instance.collection('opcoesAjuda').snapshots();

  }
  void alertaSalvo(BuildContext context){     

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Pedido de Ajuda Feito"),
          content: new Text("Entraremos em contato com mais informações!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                
                Navigator.of(context).pushNamed('/');
              },
              )
          ],
        );
      },
    );
  
  }
  void alertaErro(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Erro!"),
          content: new Text("Não foi possivel fazer o pedido de ajuda,tente novamente mais tarde!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                
                Navigator.of(context).pushNamed('/');
              },
              )
          ],
        );
      },
    );

  }
 
}