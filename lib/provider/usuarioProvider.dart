import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';


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

  DocumentSnapshot get getUsuarioLogado => usuario;
  ChatUser get getChatUser => chatUser;
  String   get getIdChatEmUso => idChatEmUso;

}