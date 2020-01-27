import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_scaffold/componentes/cardServico.dart';
import 'package:path/path.dart' as Path;


class ProjetoProviderState with ChangeNotifier{
    ProjetoProviderState();
    final _formKey = GlobalKey<FormState>();
    String idProjetoSelecionado;
    String nomeProjetoSelecionado = "";
    DocumentSnapshot projetoSelecionado;
    List<DocumentSnapshot> servicosDoProjeto = [];

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
    Future<void>  setServicosDoProjeto(List<dynamic> listaServicos) async {
      print("LISTA DE SERVICOS $listaServicos");
      servicosDoProjeto = [];
      if(listaServicos == null) listaServicos = [];
      listaServicos.forEach((f)async{
          DocumentSnapshot servico = await  Firestore.instance.collection('servicos').document(f).get();
          servicosDoProjeto.add(servico);
      });
      notifyListeners();
      print("OUVINTES NOTIFICADOS");
     
    }

    Future<bool> adicionarServicoProjeto(BuildContext context,FirebaseUser usuario) async {
            bool adicionado = false;
      QuerySnapshot servicos =  await Firestore.instance.collection('servicos').where('idCliente',isEqualTo:(usuario != null)? usuario.providerId : "123456").getDocuments();
     await showDialog(
        context: context,
        builder: (BuildContext context){
          return  AlertDialog(
            title:  Text("Escolha o Serviço Para Adicionar ao Projeto",style: TextStyle(fontSize: 15),) ,
            content:Container(
              height: MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.width ,
              child:ListView.builder(
                  shrinkWrap: true,
                  itemCount: servicos.documents.length,
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                      onTap: () async {
                        Navigator.of(context).maybePop();
                        if(projetoSelecionado["servicos"] != null){
                          await Firestore.instance.collection('projetos').document(projetoSelecionado.documentID).updateData({
                          "servicos":FieldValue.arrayUnion([servicos.documents[index].documentID]),
                          "gastosServicos":FieldValue.increment(servicos.documents[index]['valorServico']),
                          "gastosTotais":FieldValue.increment(servicos.documents[index]['valorServico'])
                        });
                        }else{
                           await Firestore.instance.collection('projetos').document(projetoSelecionado.documentID).updateData({
                          "servicos":[servicos.documents[index].documentID],
                          "gastosServicos":FieldValue.increment(servicos.documents[index]['valorServico']),
                          "gastosTotais":FieldValue.increment(servicos.documents[index]['valorServico'])
                        });
                        }
                        
                       DocumentSnapshot p = await  Firestore.instance.collection('projetos')
                                          .document(projetoSelecionado.documentID)
                                          .get();
                        projetoSelecionado = p;
                       await  setServicosDoProjeto(projetoSelecionado.data['servicos']);
                       notifyListeners();
                      },
                      child: CardServico(servicos.documents[index],false) ,
                    )
                   ;
                  },
                )  ,
            )
            ,
          );
        }
      );
      return adicionado = true;
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
    void setProjetoSelecionado(DocumentSnapshot projeto) async {
      projetoSelecionado = projeto;
      await  setServicosDoProjeto(projetoSelecionado.data['servicos']);
      notifyListeners();

    }
    void setIdProjetoSelecionado(String id){
         idProjetoSelecionado = id; 
    }
    void setNomeProjetoSelecionado(String nome){
         nomeProjetoSelecionado = nome;
         notifyListeners();
    }
 String get getIdProjetoSelecionado   => idProjetoSelecionado;
 String get getNomeProjetoSelecionado => nomeProjetoSelecionado;
 List<DocumentSnapshot> get getListaServicosDoProjeto =>servicosDoProjeto;
 DocumentSnapshot get getProjetoSelecionado => projetoSelecionado;
}