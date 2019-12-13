import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final UserCredential userCredential = UserCredential();
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor entre seu numero de telefone com ddd!';
                        }
                        print('VALOR DO TELEFONE'+value);
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          userCredential.telefone = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Entre seu telefone',
                        labelText: 'Telefone',
                       
                      ),
                    ),
                  ),
                  /**
                   * TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        userCredential.telefone = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                   */                  
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Consumer<AuthBlock>(
                        builder:
                            (BuildContext context, AuthBlock auth, Widget child) {
                          return RaisedButton(
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            child: auth.loading && auth.loadingType == 'login' ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ) : Text('Logue-Se'),
                            onPressed: () {
                              // Validate form
                              if (_formKey.currentState.validate() && !auth.loading) {
                                // Update values
                                _formKey.currentState.save();
                                // Hit Api
                                auth.login(userCredential);
                              }
                            },
                          );
                        },
                      ),
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
