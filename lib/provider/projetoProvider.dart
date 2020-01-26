import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;


class ProjetoProviderState with ChangeNotifier{
    ProjetoProviderState();
    final _formKey = GlobalKey<FormState>();
    String idProjetoSelecionado;
    String nomeProjetoSelecionado = "";

    Future<bool> criarProjeto(Map<String,dynamic> projeto,FirebaseUser usuario) async {
      bool projetoSalvo = false;
      DocumentReference projetoDb =  await Firestore.instance.collection('projetos').add({
        ...projeto,
        "idCliente": (usuario != null) ? usuario.providerId : "123456"
      });
      if(projetoDb.documentID != null){
        projetoSalvo = true;
        }
        return projetoSalvo;
    }
    Stream<QuerySnapshot> getProjetosStream(FirebaseUser usuario){
      return Firestore.instance.collection('projetos')
                        .where("idCliente",isEqualTo: (usuario != null) ? usuario.providerId : "123456")
                        .snapshots();
    }
    void setIdProjetoSelecionado(String id){
         idProjetoSelecionado = id; 
    }
    void setNomeProjetoSelecionado(String nome){
         nomeProjetoSelecionado = nome;
         notifyListeners();
    }
    Future<String> uploadFile(file) async {    
       StorageReference storageReference = FirebaseStorage.instance    
           .ref()    
           .child('fotosServicos/${Path.basename(file.path)}}');    
       StorageUploadTask uploadTask = storageReference.putFile(file);    
       await uploadTask.onComplete;    
       print('File Uploaded');    
       return storageReference.getDownloadURL().then((fileURL) {    
         return  fileURL; 
       });    
     }  
    Future<bool> addFotoProjeto(File foto) async {
      bool projetoAlterado = false;
      String urlFoto = await uploadFile(foto);
      await Firestore.instance.document('projetos'+'/'+idProjetoSelecionado).updateData({"fotos":FieldValue.arrayUnion([urlFoto])});
      projetoAlterado = true;
      return projetoAlterado;

    }
    alertaProjetoSalvo(BuildContext context){
      showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Projeto Criado!"),
          content: new Text("Projeto Criado Com Sucesso!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {                
                Navigator.of(context).pop();
              },),
            new FlatButton(
              child: new Text("Ver Projetos"),
              onPressed: () {                
                Navigator.of(context).pop();
              },)
          ],
        );
      },
    );
    }

    alertaProjetoErro(BuildContext context){
      showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Erro!"),
          content: new Text("Não foi possivel criar o Projeto Tente Mais Tarde!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {                
                Navigator.of(context).pop();
              },),
           
          ],
        );
      },
    );
    }
    void dialogCriarProjeto(BuildContext context,FirebaseUser usuario){
      String nomeNvProjeto  = "";
     
      showDialog(
        context:context,
        builder:(BuildContext context){
          return AlertDialog(
            title: Text("Digite o nome do Projeto"),
            content: Form(
              key: _formKey,
              child: TextFormField(
                 validator: (value) {
                  if (value.isEmpty) {
                    return 'Por Favor Escreva um nome!';
                  }
                  return null;
                },
                  onChanged: (s){
                    nomeNvProjeto = s;
                  },
              ),
            )
              ,
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("Criar"),
                  onPressed: ()async {
                    if(_formKey.currentState.validate()){
                        
                        bool criado = await criarProjeto({"nome":nomeNvProjeto,"fotos":[]}, usuario);
                        
                        if(criado){
                          Navigator.of(context).pop();
                          alertaProjetoSalvo(context);
                        }else{
                          Navigator.of(context).pop();
                          alertaProjetoErro(context);
                        }

                    }
                   
                  },
                ),
                
              ],
          );
        }
      );
     
  }

 String get getIdProjetoSelecionado   => idProjetoSelecionado;
 String get getNomeProjetoSelecionado => nomeProjetoSelecionado;
}