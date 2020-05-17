import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/projetoProvider.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IniciarDigitalizacao extends StatefulWidget {
  IniciarDigitalizacao({Key key}) : super(key: key);

  @override
  _IniciarDigitalizacaoState createState() => _IniciarDigitalizacaoState();
}

class _IniciarDigitalizacaoState extends State<IniciarDigitalizacao> {
  final _formKey = GlobalKey<FormState>();
  final List<String> dicas              = ['1. Pegue o documento.',
                                           '2. Selecione o projeto',
                                           '3. Enquadre todo o documento na câmera.',
                                           '4.Tire uma foto.',
                                           '5. Envia a foto'];
        List<String> nomesProjetos      = [''];
        int       projetoSelecionado = -1;
        File foto;
        bool criandoProjeto = false;

   Future getImage(BuildContext context )async{
      final projetoProvider = Provider.of<ProjetoProviderState>(context);
      final usuarioProvider = Provider.of<UsuarioProvider>(context);
      final result = await Navigator.of(context).pushNamed('/Camera');
      print("PATH DA IMAGEM ${usuarioProvider.tempFotoPath}");
      if (usuarioProvider.tempFotoPath != ''){
           File foto = new File(usuarioProvider.tempFotoPath);         
            if(foto == null) return;
            print("FOTO ADICIONADA");    
            setState(() {
              criandoProjeto = true;
            });
            bool resultado = await projetoProvider.addFotoProjeto(foto);
            print("RESULTADO DA OPREACAO DE ADD FOTO $resultado");
            usuarioProvider.tempFotoPath = '';
            setState(() {
              criandoProjeto = false;
            });
            showDialog(
              context: context,
              builder:(BuildContext context){
                return AlertDialog(
                  title: Text("Foto Adicionada"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("OK"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
            );

      }
      
     

    
  
  }
  void dialogCriarProjeto(BuildContext context){
      final projetoProvider = Provider.of<ProjetoProviderState>(context);
      final firebaseUser    = Provider.of<FirebaseUser>(context);
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
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("Cancelar")
                  ),
                FlatButton(
                  child: Text("Criar"),
                  onPressed: ()async {
                    if(_formKey.currentState.validate()){
                        setState(() {
                        criandoProjeto = true;
                          });
                        bool criado = await projetoProvider.criarProjeto({"nome":nomeNvProjeto,"fotos":[]}, firebaseUser);
                        setState(() {
                              criandoProjeto = false;
                            });
                        if(criado){
                          Navigator.of(context).pop();
                          projetoProvider.alertaProjetoSalvo(context);
                        }else{
                          Navigator.of(context).pop();
                          projetoProvider.alertaProjetoErro(context);
                        }

                    }
                   
                  },
                )
              ],
          );
        }
      );
     
  }
  @override
  Widget build(BuildContext context) {
    final projetoProvider = Provider.of<ProjetoProviderState>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);

    return  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              if(criandoProjeto) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(gradient:LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white,Colors.grey[100], Colors.grey]) ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ...dicas.map<Widget>((dica)=>Text(dica,style: TextStyle(fontSize: 20),)),],
                  ),
                ),
              ),
               Padding(padding: EdgeInsets.only(top: 30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Projeto",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 40,
                    child: StreamBuilder(
                    stream: projetoProvider.getProjetosStream(firebaseUser),
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                                    if(snapshot.hasError) Text("Error: ${snapshot.error}");
                                    switch(snapshot.connectionState){
                                      case ConnectionState.waiting : return new        Center(child: 
                                                                                       SizedBox(height: 50,width: 50,child:
                                                                                       CircularProgressIndicator(),),);
                                      default: {
                                             int escolha = -1;
                                             return SizedBox(
                                               
                                               width: MediaQuery.of(context).size.width * 0.5,
                                               child: Padding(
                                                 padding: EdgeInsets.only(left: 5,right: 5),
                                                 child: DropdownButton<int>(   
                                                   hint: SizedBox(
                                                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                                                        child: Text("Selecione o Projeto"),
                                                                                      ) ,                               
                                              value: (projetoSelecionado == -1) ? null : projetoSelecionado,
                                              icon: Icon(Icons.arrow_drop_down,color: Colors.grey,),
                                              iconSize: 20,
                                              onChanged: (nvValor){
                                                projetoProvider.setIdProjetoSelecionado(
                                                  snapshot.data.documents[nvValor].documentID
                                                );
                                                setState(() {
                                                  projetoSelecionado = nvValor;
                                                });
                                              },
                                              items:snapshot.data.documents.map<DropdownMenuItem<int>>((nomeProjeto){
                                                                                      escolha++;
                                                                                      return DropdownMenuItem<int>(value: escolha,child: SizedBox(
                                                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                                                        child: Text(nomeProjeto['nome']),
                                                                                      )
                                                                                      ,
                                                                                      );}
                                                                                        ).toList(),
                                            ),
                                               )
                                              ,
                                             )
                                              ;}
                                    }
                    },
                  ),
                  )
                  
                  ,
                 
                  InkWell(
                    onTap: () async {
                      print("Apertou add");
                      dialogCriarProjeto(context);
                    },
                    child: Icon(Icons.add_circle),
                  )],
              ),
              Padding(padding: EdgeInsets.only(top: 30),),
            Align(
              alignment: Alignment.bottomCenter,
              child:ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.98,
                child: RaisedButton(
                  onPressed: (projetoProvider.getIdProjetoSelecionado != null) ? () async {
                    print("FUNÇÃO TIRAR FOTO");
                    getImage(context);
                    
                  } : null,
                  color: Theme.of(context).primaryColor,
                  child: Text("Tirar Foto",style:TextStyle(color: Colors.white)),
                ),
              ) ,
            )
              
              
              

            ],
          
    );
  }
}