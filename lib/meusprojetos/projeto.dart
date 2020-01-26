import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_scaffold/provider/projetoProvider.dart';
import 'package:provider/provider.dart';

class Projeto extends StatefulWidget {
  Projeto({Key key}) : super(key: key);

  @override
  _ProjetoState createState() => _ProjetoState();
}

class _ProjetoState extends State<Projeto> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();  


  @override
  Widget build(BuildContext context) {
   final projetoProvider = Provider.of<ProjetoProviderState>(context);
   final firebaseUser = Provider.of<FirebaseUser>(context);

    return DefaultTabController(
      length: 4,
      child:Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         centerTitle: true,
         leading: IconButton(
           icon: Icon(Icons.arrow_back,color:Colors.black),
           onPressed: ()=>Navigator.of(context).maybePop(),
         ),
         title:Text("Projeto: ${projetoProvider.getNomeProjetoSelecionado}"),
         bottom: TabBar(
           tabs: <Widget>[
             Tab(
               icon: Icon(Ionicons.md_people),
               text: "Serviços",
             ),
             Tab(
               icon: Icon(Ionicons.md_cart),
               text: "Materiais",
             ),
             Tab(
               icon: Icon(Ionicons.md_document),
               text: "Documentos",
             ),
             Tab(
               icon: Icon(Ionicons.ios_images),
               text: "Fotos",
             ),
           ],
         ),
       ),
       
       body: TabBarView(
         children: <Widget>[
           Text("Serviços"),
           Text("Materias"),
           Text("Documentos"),
           Text("Fotos")
         ],
       ),
    ),
    )
     ;
  }
}