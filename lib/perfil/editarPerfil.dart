import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditarPerfil extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<EditarPerfil>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

     final GlobalKey<ScaffoldState> _scaffoldKey =  new GlobalKey<ScaffoldState>();
     File imagem;
    TextEditingController nomeControler     = TextEditingController();
    TextEditingController telefoneControler = TextEditingController();
   


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
    bool atualizando =false;

  Future getImage(  String s)async{
    print("FUNÇÃO DEPEGAR IMAGEM SELECIONADA");
    try {
          imagem = await ImagePicker.pickImage(source:(s == "galeria") ? ImageSource.gallery : ImageSource.camera);  
    } catch (e) {
      print("QUANTIDADE DE FOTOS $e");
    }
    
   
    
    setState(() {
      
    });
  
  }

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    nomeControler.text = usuarioProvider.usuario['displayName'];
    telefoneControler.text  = (usuarioProvider.usuario['phoneNumber'] == null) ? "" : usuarioProvider.usuario['phoneNumber'];
    
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new InkWell(
           child: new Icon(Icons.arrow_back,color:Colors.black),
           onTap: () { 
             try {
             Navigator.of(context).maybePop();
               
             } catch (e) {
               print("ERRO $e");
             }
             },
         ),
         title: Text("Perfil",style: TextStyle(color: Colors.black),),
       ),
        body: new Container(
      color: Colors.white,
      
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 250.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                   
                   
                    
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  
                                ),
                                child: (imagem == null) ?  CachedNetworkImage(
                                  fit:BoxFit.cover,
                                  imageUrl: usuarioProvider.usuario['photoUrl'],
                                  placeholder: (context,url)=>Center(
                                    child:SizedBox( 
                                      child: CircularProgressIndicator()
                                    ,) ,
                                    ),
                                  errorWidget: (context,url,error) => Icon(Icons.error),
                                  ) : Image.file(imagem),
                                ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: new InkWell(
                              onTap: (){
                                  getImage('galeria');
                              },
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 25.0,
                                  child: new Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                            )
                            ,
                      ]),
                    )
                  ],
                ),
              ),
               if(atualizando) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Informações Pessoais',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Nome',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  
                                  controller: nomeControler,
                                  decoration: const InputDecoration(
                                    hintText: "Entre seu Nome",
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,

                                ),
                              ),
                            ],
                          )),
                     
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Telefone',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: telefoneControler,
                                  
                                  decoration: const InputDecoration(
                                  hintText: "Entre seu telefone"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                     
                      
                      !_status ? Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Atualizar"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () async {
                  setState(()  {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    atualizando = true;
                    });
                  String fotoUrl = usuarioProvider.usuario['photoUrl'];
                  if(imagem != null){
                   fotoUrl = await usuarioProvider.uploadFile(imagem);
                  }
                 bool resultado = await usuarioProvider.atualizarUsuario({
                    'displayName':nomeControler.text,
                    "phoneNumber":telefoneControler.text,
                    "photoUrl":fotoUrl
                    });
                    if(resultado){
                      print("ATUALIZACAO FEITA COM SUCESSO");
                      _scaffoldKey.currentState.showSnackBar( 
                        SnackBar(
                          content: Text("Atualização Feita com Sucesso!")
                          )
                      );
                    }else{
                      print("ERRO NA ATUALIZACAO");
                      _scaffoldKey.currentState.showSnackBar( 
                        SnackBar(
                          content: Text("Erro na Atualização tente novamente mais tarde!")
                          )
                      );
                    }
                    setState(() {
                      atualizando = false;
                    });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancelar"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  if(usuarioProvider.usuario['phoneNumber'] == null){
                   telefoneControler.text = " ";
                  }else{
                    telefoneControler.text = usuarioProvider.usuario['phoneNumber'];
                  }
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    nomeControler.text     = usuarioProvider.usuario['displayName'];
                    imagem = null;

                  
                   
                    
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    ) : new Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Atualizar"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancelar"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}