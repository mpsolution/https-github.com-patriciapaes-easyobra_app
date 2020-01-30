import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UsuarioProvider with ChangeNotifier{
  UsuarioProvider();
  DocumentSnapshot usuario;

  void setUsuario(DocumentSnapshot u){
    usuario = u;
  }


  DocumentSnapshot get getUsuarioLogado => usuario;

}