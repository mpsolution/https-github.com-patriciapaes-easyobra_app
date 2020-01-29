import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_scaffold/authservice/baseauth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String imagemEasyObras = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgThnNt1DZl0ogUXbX7yz7ND3C1qDyfYytOOe6XD_qcucrfKhI&s";
  String email         = "";
  String password      = "";
  String mensagem      = "";
  String nomeUsuario   = "";
  String confPassword = "";
  bool   logando       = false;
  final _form          = GlobalKey<FormState>();
  final _formCadastro  = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,      
      body:SafeArea(
        top: false,
        left: false,
        right: false,
        child:Align(
          alignment: Alignment.topCenter,
          child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[ 
              //Imagem Principal
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                height: 300,
                child: Image.asset("assets/images/login/logo.png")                
              ),
              Text("Como deseja começar?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18),),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child:RaisedButton(
                color: Colors.blueAccent,
                elevation: 0,                
                onPressed: (){
                  print("Fazer login facebook");
                },
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                          Icon(FontAwesomeIcons.facebook,color:Colors.white),
                          Text("Logar Com o Facebook",style:TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
              ) ,
              ),
              
            
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child:RaisedButton(
                color: Colors.grey[600],
                onPressed: (){
                  print("Fazer login com email");
                  setState(() {
                    mensagem = "";
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return StatefulBuilder(
                        builder: (context,setState){
                          return AlertDialog(
                        title: Center(child:Text("Email e Senha")),
                        content:SizedBox(
                          height: MediaQuery.of(context).size.height * 0.32,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child:Form(
                            key: _form,
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(
                              Icons.mail,
                              color: Colors.grey,
                            )
                          ),
                          validator: (value) => (value.isEmpty || (!isEmail(value))) ? "Email Invalido" : null,
                          onSaved: (value){
                            setState(() {
                              email = value.trim();
                            });
                          },
                          onChanged: (value){
                            setState(() {
                              email = value.trim();
                            });
                          },
                        ) ,
                        TextFormField(
                          maxLines: 1,
                          obscureText: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "Senha",
                            icon: Icon(
                              Ionicons.ios_key,
                              color: Colors.grey,
                            )
                          ),
                          validator: (value) => (value.isEmpty) ? "Digite uma Senha" : null,
                          onSaved: (value){
                            setState(() {
                              password = value.trim();
                            });
                          },
                          onChanged: (value){
                            setState(() {
                              password = value.trim();
                            });
                          },
                        ) ,
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child:Center(
                          child:  Text(mensagem,style:TextStyle(color: Colors.red)),
                        ) ,
                        ),
                        (logando) ? (Center(child: SizedBox(height: 50,width: 50,child:CircularProgressIndicator(),),)) : Padding(padding: EdgeInsets.all(0),)
                        
                       

                          ],
                        ),
                          )
                           ,
                        )
                        ,
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Cancelar"),
                            onPressed: (){
                              
                              Navigator.of(context).maybePop();
                              setState(() {
                                mensagem = "";
                                email    = '';
                                password = '';
                                logando  = false;
                              });
                            },
                          ),
                          FlatButton(
                            child: Text('Logar'),
                            onPressed: () async {
                              setState(() {
                                mensagem = "";
                                logando  = true;
                              });
                              print("FAZER FUNÇÃO LOGAR COM EMAIL");
                              if(_form.currentState.validate()) {
                                  Autorizacao auth   = new Autorizacao();
                                  String userUid     = await auth.logar(email, password).catchError((onError){
                                    print("ERRO NO CATCH $onError");
                                  });
                                  print("USUARIO LOGADO $userUid");
                                  if(userUid == null){
                                    setState(() {
                                      mensagem = "Usuario não Encontrado";
                                      logando  = false;
                                    });
                                  }
                              }else{
                                setState(() {
                                  logando = false;
                                });
                              }
                              

                            //  Navigator.of(context).maybePop();
                            },
                          ),
                          
                        ],
                        
                      );
                        },
                      );

                    }
                  );
                },
                child:Center(
                    child: Text("Logar com Email e Senha",style:TextStyle(color: Colors.white)),
                  ),
              ) ,
              ),
              ButtonTheme(           
                minWidth:MediaQuery.of(context).size.width * 0.6 ,     
                child: RaisedButton(
                  color:Colors.grey[600],
                  onPressed: (){
                    print("Cadastrar-se");
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return StatefulBuilder(
                          builder: (context,setState){
                            return AlertDialog(
                              title: Center(child: Text("Cadastrar"),),
                              content: Expanded(
                                child: Form(
                                          key: _formCadastro,
                                          child: ListView(
                                            children: <Widget>[
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  hintText: "Nome de Usuario"
                                                ),
                                                onChanged: (s){
                                                  setState(() {
                                                    nomeUsuario = s;
                                                  });
                                                },
                                                onSaved: (s){
                                                  nomeUsuario = s;
                                                },
                                                validator: (s)=>(s.isEmpty) ? 'Digite um nome de Usuario' : null,
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  hintText: 'Email'
                                                ),
                                                onChanged: (s){
                                                  setState(() {
                                                    email = s;
                                                  });
                                                },
                                                onSaved: (s){
                                                  email = s;
                                                },
                                                validator: (s)=>(s.isEmpty || (!isEmail(s.trim()))) ? 'Email Invalido' : null,
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  hintText: 'Senha'
                                                ),
                                                onChanged: (s){
                                                  setState(() {
                                                    password = s;
                                                  });
                                                },
                                                onSaved: (s){
                                                  setState(() {
                                                    password = s;
                                                  });
                                                },
                                                validator: (s)=>s.isEmpty ? 'Senha Invalida' : null
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  hintText: 'Confirmar Senha'
                                                ),
                                                onChanged: (s){
                                                  setState(() {
                                                    password = s;
                                                  });
                                                },
                                                onSaved: (s){
                                                  setState(() {
                                                    password = s;
                                                  });
                                                },
                                                validator: (s)=> (s.isEmpty  || !(s == password))? 'Senha Invalida' : null
                                              )

                                            ],
                                          ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    );

                  },
                  child: Text("Cadastrar-Se",style:TextStyle(color: Colors.white)),

                ),
              )
              
            ],
          ),
        ),
        )
        
         )
    );
  }
}
