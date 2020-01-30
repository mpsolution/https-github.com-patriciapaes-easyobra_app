import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import 'authservice/baseauth.dart';

class Cadastro extends StatefulWidget {
  Cadastro({Key key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String email         = "";
  String password      = "";
  String mensagem      = "";
  String nomeUsuario   = "";
  String confPassword  = "";
  
  bool   cadastrando       = false;
  final _formCadastro  = GlobalKey<FormState>();
  Autorizacao auth   = new Autorizacao();
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
        centerTitle: true,
      ),
      body:Padding(
        padding: EdgeInsets.all(15),
        child:Form(
                                          key: _formCadastro,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  hintText: 'Senha'
                                                ),
                                                onChanged: (s){
                                                  setState(() {
                                                    password = s.trim();
                                                  });
                                                },
                                                onSaved: (s){
                                                  setState(() {
                                                    password = s.trim();
                                                  });
                                                },
                                                validator: (s)=>s.isEmpty ? 'Senha Invalida' : null
                                              ),
                                              TextFormField(
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  hintText: 'Confirmar Senha'
                                                ),
                                                onChanged: (s){
                                                  setState(() {
                                                    confPassword = s.trim();
                                                  });
                                                },
                                                onSaved: (s){
                                                  setState(() {
                                                    confPassword = s.trim();
                                                  });
                                                },
                                                validator: (s){
                                                  if(s.length < 6){
                                                    return 'Senha deve conter 6 caracteres';
                                                  }
                                                  if(s.isEmpty){
                                                    return 'Senha não poder ser vazia';
                                                  }
                                                  if(s != password){
                                                    return 'Senha devem ser iguais';
                                                  }
                                                  return null;
                                                }
                                              ),
                                              (cadastrando) ?  Padding(
                                                                    padding: EdgeInsets.only(top: 5),
                                                                    child:SizedBox(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: Center(
                                                                      child: CircularProgressIndicator(),
                                                                    ),
                                                                  ) ,
                                                                  ) : Padding(padding: EdgeInsets.all(0),),
                                            Center(
                                              child:Text(mensagem,style:TextStyle(color: Colors.red)) ,
                                            ),
                                            Expanded(
                                              child:Align(alignment: Alignment.bottomCenter,
                                              child: ButtonTheme(
                                                minWidth: MediaQuery.of(context).size.width * 0.8,
                                                child: RaisedButton(
                                                  color: Theme.of(context).primaryColor,
                                                  onPressed: ()async {
                                                    setState(() {
                                                      cadastrando = true;
                                                      mensagem    = "";
                                                    });
                                                    if(_formCadastro.currentState.validate()){
                                                      String uid  = await auth.cadastrar(email, password)
                                                                              .catchError((onError){
                                                                                print("ERROR ENCONTRADO $onError ${onError.message}");
                                                                                setState(() {
                                                                                  mensagem = onError.message;
                                                                                  cadastrando = false;
                                                                                });
                                                                              });
                                                            if(uid != null){
                                                              print("CADASTRO FEITO COM SUCESSO");
                                                              setState(() {
                                                                cadastrando = false;
                                                              });
                                                             DocumentSnapshot usuario = await Firestore.instance.collection('usuarios').document(uid).get();
                                                            if(usuario.data != null){
                                                              print("USUARIO JÁ EXISTE NO BANCO DE DADOS $usuario");
                                                              usuarioProvider.setUsuario(usuario);
                                                             
                                                            }else{
                                                              print("USUARIO N EXISTE NO BANCO DE DAODS");
                                                             await  Firestore.instance.collection('usuarios')
                                                                                .document(uid)
                                                                                .setData({
                                                                                  "displayName":nomeUsuario,
                                                                                  "email":email,
                                                                                  "phoneNumber":'',
                                                                                  "photoUrl":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s",
                                                                                  "uid":uid
                                                                                }).catchError((onError){
                                                                                  print("ERRO AO SALVAR $onError");
                                                                                }); 
                                                              usuario = await Firestore.instance.collection('usuarios').document(uid).get();
                                                              print("USUARIO N EXISTE NO BANCO DE DAODS ${usuario['displayName']}");
                                                              usuarioProvider.setUsuario(usuario);
                                                             

                                                            }
                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context){
                                                                  return AlertDialog(
                                                                    title: Text("Cadastro"),
                                                                    content: Text("Cadastro Feito Com Sucesso"),
                                                                    actions: <Widget>[
                                                                      FlatButton(
                                                                        onPressed: (){
                                                                          print("FAZER FUNÇÃO DE CARREGAR USUARIO");
                                                                          Navigator.of(context).maybePop();
                                                                          Navigator.of(context)
                                                                                   .pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));

                                                                        },
                                                                        child: Text("OK"),
                                                                      )
                                                                    ],
                                                                  );
                                                                }
                                                              );
                                                            }
                                                    }
                                                    setState(() {
                                                      cadastrando = false;
                                                    });
                                                  },
                                                  child:Text("Cadastrar",style: TextStyle(color: Colors.white),) ,
                                                ),
                                              ),
                                            ) ,
                                            )
                                            ,
                                            Padding(padding: EdgeInsets.only(bottom: 20),)
                                              

                                            ],
                                          ),
                                )  ,
      ),
    );
  }
}