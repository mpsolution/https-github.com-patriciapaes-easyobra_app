import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final User user = User();
  String imagemBase    = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  String confirmPassword;
  File  _imageFile;
  Future<void> selecionarImagem(BuildContext context) async {
   
       
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: ()async {
                      print('FUNCAO DE SELECIONAR FOTO');
                      await selecionarImagem(context);
                    },
                    child:  (_imageFile == null)? Stack(
                    children: <Widget>[
                      
                      CachedNetworkImage(fit: BoxFit.contain,
                                     imageUrl: imagemBase,
                                     placeholder: (context, url) => Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                        errorWidget: (context, url, error) =>
                                                            new Icon(Icons.error),
                                                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child:Container(
                      margin: EdgeInsets.only(right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: new BorderRadius.circular(60),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white, size: 32,
                      ),
                    ) ,
                    )],
                  ): CircleAvatar(
                    child: Image.file(_imageFile),
                  ) ,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Entre seu nome';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          user.username = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Seu nome',
                        labelText: 'Nome',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Entre seu Telefone';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          user.telefone = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Entre seu telefone',
                        labelText: 'Telefone',
                      ),
                    ),
                  ),
                  /**
                   * Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            user.password = value;
                          });
                        },
                        onChanged: (text) {
                          user.password = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          labelText: 'Password',
                        ),
                        obscureText: true),
                  ),
                   *  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Confirm Password';
                      } else if (user.password != confirmPassword) {
                        return 'Password fields dont match';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      confirmPassword = text;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Same Password',
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                  ),
                   */                  
                 
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Consumer<AuthBlock>(builder:
                          (BuildContext context, AuthBlock auth, Widget child) {
                        return RaisedButton(
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          child: auth.loading && auth.loadingType == 'register' ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ) : Text('Cadastre-Se'),
                          onPressed: () {
                            if (_formKey.currentState.validate() && !auth.loading) {
                              _formKey.currentState.save();
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              auth.register(user);
                            }
                          },
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
