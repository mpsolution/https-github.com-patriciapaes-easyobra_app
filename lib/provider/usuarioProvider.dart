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

}