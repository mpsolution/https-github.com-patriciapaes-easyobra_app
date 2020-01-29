import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_scaffold/componentes/cardServico.dart';
import 'package:flutter_scaffold/componentes/dialProjeto.dart';
import 'package:flutter_scaffold/provider/projetoProvider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class Projeto extends StatefulWidget {
  Projeto({Key key}) : super(key: key);

  @override
  _ProjetoState createState() => _ProjetoState();
}

class _ProjetoState extends State<Projeto> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();  
  List<Widget> tabs = [
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
  ];


  @override
  Widget build(BuildContext context) {
   final projetoProvider = Provider.of<ProjetoProviderState>(context);
   final firebaseUser = Provider.of<FirebaseUser>(context);

    return DefaultTabController(
      length: tabs.length,
      child:Scaffold(

       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         centerTitle: true,
         leading: IconButton(
           icon: Icon(Icons.arrow_back,color:Colors.black),
           onPressed: ()=>Navigator.of(context).maybePop(),
         ),
         title:Text("Projeto: ${projetoProvider.getNomeProjetoSelecionado}",style: TextStyle(color: Colors.black),),
         backgroundColor: Colors.white,
         bottom: TabBar(
           indicatorColor: Theme.of(context).primaryColor,
           labelColor: Colors.black,
           tabs: <Widget>[
             ...tabs
           ],
         ),
       ),
       floatingActionButton:DialProjeto() ,
       body: TabBarView(
         children: <Widget>[
           Container(
             child: Padding(
               padding: EdgeInsets.all(2),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   Expanded(
                     child:  StreamBuilder(
                       stream:projetoProvider.getServicosDoProjeto(),
                       builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                         if(snapshot.hasError) Text("Error: ${snapshot.error}");
                         switch(snapshot.connectionState){
                           case ConnectionState.waiting : return new Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),));
                           default:return ListView.builder(
                                      itemCount: snapshot.data.documents.length,
                                      itemBuilder: (context,int index){
                                        return Stack(
                                          children: <Widget>[
                                              CardServico(snapshot.data.documents[index],true),
                                              Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child:FloatingActionButton(
                                                  elevation: 5,
                                                  mini: true,
                                                  onPressed: (){
                                                    print("Remover servico do projeto");
                                                    projetoProvider.removerServicoProjeto(context, snapshot.data.documents[index]);
                                                  },
                                                  child: Icon(Icons.close,color: Colors.white,),
                                                  backgroundColor: Colors.red,
                                                ) ,
                                                )
                                          ],
                                        );
                                      },
                                    );

                         }
                         
                       },
                     )
                     
                    ,
                   )
                 ],
               ),
             ),
           ),
           Text("Materias"),
           Text("Documentos"),
           GridView.builder(
             itemCount: (projetoProvider.projetoSelecionado['fotos'] != null) ? projetoProvider.projetoSelecionado['fotos'].length : 0,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
             padding: EdgeInsets.all(5),
             
             itemBuilder: (BuildContext context,int index){              
               return Padding(padding: EdgeInsets.all(2),
               child:CachedNetworkImage(
                 fit: BoxFit.fill,
                 imageUrl:projetoProvider.projetoSelecionado['fotos'][index] ,
                 placeholder: (context,url) =>Center(
                   child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),),
                 ),
                 errorWidget: (context,url,error) => Icon(Icons.error),
               )
               ) ;
             },
             )
           
         ],
       ),
    ),
    )
     ;
  }
}