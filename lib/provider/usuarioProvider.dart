import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;



class UsuarioProvider with ChangeNotifier{
  UsuarioProvider();
  DocumentSnapshot usuario;
  ChatUser chatUser;
  String idChatEmUso = '';
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';

  Future<bool> enviarProposta(DocumentSnapshot servico,String valorProposta) async {
  bool salvou = false;
  try {
  
    String nome  = 'sem nome';
    if(usuario['displayName'] != null){
      nome = usuario['displayName'];
    }
    if(servico['orcamentos'] != null){
      var orcamentos = new List.from(servico['orcamentos']) ;
      orcamentos.add(
        {
          'idServico':servico.documentID,
          'idPrestador':servico['idCliente'],
          'valor':valorProposta,
          'nome':nome,
          
        }
      );
       await Firestore.instance.collection('SolicitacoesServicos').document(servico.documentID).updateData({
         "orcamentos":orcamentos
       });
    }else{
     await  Firestore.instance.collection('SolicitacoesServicos').document(servico.documentID).updateData(
        { "orcamentos" :[{
          'idServico':servico.documentID,
          'idPrestador':servico['idCliente'],
          'valor':valorProposta,
          'nome':nome,
          'data':DateTime.now()
        }]}).catchError((onError){
          print("ERRO NA FUNÇÃO DO FIRESTONE EM orcamentos $onError");

        });
    }
    salvou = true;
    
  } catch (e) {
    print("ERRO NA FUNÇÃO $e");
  }
   
    return salvou;
  }

  void setUsuario(DocumentSnapshot u){
    usuario = u;
    setChatUser(usuario);
  }
 void setChatUser(DocumentSnapshot usuario){
   chatUser = ChatUser(
     uid:    (usuario.documentID != null)  ? usuario.documentID : '123456',
     name:(usuario['displayName'] != null) ? usuario['displayName'] : 'teste',     
     avatar: (usuario['photoUrl'] != null) ? usuario['photoUrl'] : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s'
   );
   notifyListeners();
 }
 void setIdChat(String id){
   idChatEmUso = id;
   notifyListeners();
 }
 Future<bool> procurarCriarChat(String idServico , String idCliente, DocumentSnapshot servico ) async {
   print("ESTA NNA PARTE DE CIRAR CHAT OU ACHAR CHAT");
   try {
      QuerySnapshot chat = await Firestore.instance.collection('chats').where('idServico',isEqualTo: idServico)
                                                                       .where('usuarios',arrayContains: usuario.documentID)
                                                                       .getDocuments();
   if(chat.documents.length == 0){
     //criar chat
    DocumentSnapshot criadorServico = await Firestore.instance.document('usuarios/'+idCliente).get();
   
    DocumentReference chatCriado = await Firestore.instance.collection('chats').add({
       'usuarios':[usuario.documentID,idCliente],
       'idServico':idServico,
       'titulo':servico['tituloServico'],
       'dadoUsuarios':[
         { 'displayName':usuario['displayName'],
          'photoUrl':usuario['photoUrl'],
          'uid':usuario.documentID           
           },
       (criadorServico == null) ?  { 'displayName':criadorServico['displayName'],
          'photoUrl':criadorServico['photoUrl'],
          'uid':criadorServico.documentID           
           } : {
             'displayName':'Sem nome',
             'photoUrl':'',
             'uid':idCliente
           }
       ],
     });
     idChatEmUso = chatCriado.documentID;
     notifyListeners();
     return true;

   }else{
     //procurar chat com o iddousuario
     chat.documents.forEach((element) { 
       if(element['usuarios'].contains(usuario.documentID)){

         idChatEmUso = element.documentID;
       }
     });
     notifyListeners();
     return true;
   }
     
   } catch (e) {
     return false;
   }
  
 }
 Future<bool> atualizarPortifolio(dynamic portifolio,List<File> nvFotos) async{
   bool atualizou = false;
   try {
     List<dynamic> nvsFotosUrl = [];
     for (var i = 0; i < nvFotos.length; i++) {
       String nvFoto = await uploadFile(nvFotos[i]);
       nvsFotosUrl.add(nvFoto);
     }    
     List<dynamic> fotos = portifolio['fotos'];
     portifolio['fotos'] = List.from(fotos)..addAll(nvsFotosUrl);
     print("PORTIFOLIO A SER SALVO $portifolio , fotos $fotos uploads $nvsFotosUrl");
     await Firestore.instance.collection('usuarios')
                             .document(usuario.documentID)
                             .updateData({
                               "portifolio":portifolio
                             });
     DocumentSnapshot us = await Firestore.instance.collection('usuarios')
                                                        .document(usuario.documentID)
                                                        .get();
     setUsuario(us);
     return atualizou = true;
     
   } catch (e) {
     print("ATUALIZAÇÃO DE PORTIFOLIO FALHO $e");
   }
   return atualizou;
 }
 
    Future<String> uploadFile(file) async {    
       StorageReference storageReference = FirebaseStorage.instance    
           .ref()    
           .child('fotosUsuarios/${Path.basename(file.path)}}');    
       StorageUploadTask uploadTask = storageReference.putFile(file);    
       await uploadTask.onComplete;    
       print('Foto SALVA NO BD');    
       return storageReference.getDownloadURL().then((fileURL) {    
         return  fileURL; 
       });    
     }  
 Future<bool> atualizarUsuario(novoUser)async{
   bool atualizou = false;
   try {
     await Firestore.instance.collection('usuarios')
                             .document(usuario.documentID)
                             .updateData(novoUser);
     atualizou = true;
     DocumentSnapshot nvUser  = await Firestore.instance.collection('usuarios')
                                        .document(usuario.documentID)
                                        .get();
    setUsuario(nvUser);
    

   } catch (e) {
     print("ERRO AO ATUALZAR USUARIO $e");
     
   }
   return atualizou;
   
 }

  DocumentSnapshot get getUsuarioLogado => usuario;
  ChatUser get getChatUser => chatUser;
  String   get getIdChatEmUso => idChatEmUso;
  String   get getImagemBase => imagemBase;

}