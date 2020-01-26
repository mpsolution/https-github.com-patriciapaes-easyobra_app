import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/meusprojetos/carddocumento.dart';
import 'package:flutter_scaffold/provider/projetoProvider.dart';
import 'package:provider/provider.dart';

class MeusProjetos extends StatefulWidget {
  MeusProjetos({Key key}) : super(key: key);

  @override
  _MeusProjetosState createState() => _MeusProjetosState();
}

class _MeusProjetosState extends State<MeusProjetos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();  
  bool criandoProjeto = false;
  @override
  Widget build(BuildContext context) {    
    final projetoProvider = Provider.of<ProjetoProviderState>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          "Meus Projetos",
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.98,
                    child: RaisedButton(    
                           onPressed: (){
                             print("FUNÇÃO DE ADICIONAR DOCUMENTO");
                             setState(() {
                               criandoProjeto = true;
                             });
                             projetoProvider.dialogCriarProjeto(context, firebaseUser);
                             setState(() {
                               criandoProjeto = false;
                             });
                           },
                           color: Theme.of(context).primaryColor,                            
                           child: Text("Criar Novo Projeto",style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)
                           ),
                         ),
                  ) ,
      body: Builder(
        builder: (BuildContext context) {
          return Container(
              child: Column(
            children: <Widget>[
              if(criandoProjeto) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),
              Expanded(
                child: StreamBuilder(
                  stream: projetoProvider.getProjetosStream(firebaseUser),
                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                     if(snapshot.hasError)  Text("Error: ${snapshot.error}");
                      switch(snapshot.connectionState){
                        case ConnectionState.waiting : return new Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(),
                          ),
                        );
                        default: return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(4),
                          itemBuilder: (context,i){
                            return InkWell(
                              onTap: (){
                                print("PROJETO SELECIONADO ${snapshot.data.documents[i]["nome"]}");
                                projetoProvider.setNomeProjetoSelecionado(snapshot.data.documents[i]["nome"]);
                                Navigator.of(context).pushNamed('/Projeto');
                              },
                              child: CardDocumento(snapshot.data.documents[i]["nome"],i),
                            );

                          },
                      
                         );
                      }
                    
                  },
                )
                    
              ),
             
              Padding(
                padding: EdgeInsets.all(2),
              )
            ],
          ));
        },
      ),
    );
  }
}
