import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_scaffold/provider/projetoProvider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class DialProjeto extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   final projetoProvider = Provider.of<ProjetoProviderState>(context);
   final firebaseUser    = Provider.of<FirebaseUser>(context);

    return SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 5,
          child: Icon(Icons.add),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: true,
          // If true user is forced to close dial manually 
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,         
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Ionicons.md_person_add),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Adicionar Serviço',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: (){
                print("FUNÇÃO DE ADICIONAR SERVIÇO");
                projetoProvider.adicionarServicoProjeto(context, firebaseUser);
              } 
            ),
            SpeedDialChild(
              child: Icon(Ionicons.md_cart),
              backgroundColor:Theme.of(context).primaryColor,
              label: 'Adicionar Material',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: (){
                print("FUNÇÃO DE ADICIONAR MATERIAL");
              },
            ),
            SpeedDialChild(
              child: Icon(Ionicons.md_document),
              backgroundColor:Theme.of(context).primaryColor,
              label: 'Adicionar Documento',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: (){
                print("FUNÇÃO DE ADICIONAR DOCUMENTO");
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.photo_camera),
              backgroundColor:Theme.of(context).primaryColor,
              label: 'Adicionar Foto',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: (){
                print("FUNÇÃO DE ADICIONAR FOTO");
              },
            ),
           
          ],
        );
  }
}