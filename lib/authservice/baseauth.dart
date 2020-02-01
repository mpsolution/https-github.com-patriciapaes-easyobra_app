import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:provider/provider.dart';

abstract class BaseAuth{
  Future<String> cadastrar(String email, String password);
  Future<String> logar(String email, String password);
  Future<void>   enviarVerificacaoEmail();
  Future<void>   deslogar();
  Future<bool>   emailEstaVerificado();
}
class Autorizacao implements BaseAuth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> logar(String email, String password ) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
      email:email,
      password: password
    );
    FirebaseUser user = result.user;
    return user.uid;
  }
  Future<bool> loginFacebook(BuildContext context)async{
    bool logado =false;
    final facebookLogin = FacebookLogin();
    final FacebookLoginResult result = await facebookLogin.logIn(['email','public_profile']);
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    switch(result.status){
      case FacebookLoginStatus.loggedIn:{
             print("LOGOU");
             AuthCredential authCredential =  FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);
             FirebaseUser user = (await _firebaseAuth.signInWithCredential(authCredential)).user;
             UserInfo userInfo = user.providerData[0];
             print("USUARIO LOGADO ${userInfo.displayName}");
             DocumentSnapshot usuarioBd = await Firestore.instance.collection('usuarios')
                                                                  .document(userInfo.uid)
                                                                  .get()
                                                                  .catchError((onError){
                                                                    print("ERROR AO PEGAR USUARIO NO BD $onError");
                                                                  });
            print("USUARIO CARREGADO DO BD ${usuarioBd.data}");
            if(usuarioBd.data == null){
              //Não tem usuario ainda no bd salvar
             await Firestore.instance.collection('usuarios')
                                .document(userInfo.uid)
                                .setData({
                                  "displayName":userInfo.displayName,
                                  "email":userInfo.email,
                                  "phoneNumber":userInfo.phoneNumber,
                                  "photoUrl":userInfo.photoUrl,
                                  "uid":userInfo.uid
                                });
                     usuarioBd = await Firestore.instance.collection('usuarios')
                                                         .document(userInfo.uid)
                                                         .get()
                                                         .catchError((onError){
                                                           print("ERROR AO PEGAR USUARIO NO BD $onError");
                                                         });
                    usuarioProvider.setUsuario(usuarioBd);
            }else{
              //Tem usuario no bd adicionar a variavel local de usuario
              usuarioProvider.setUsuario(usuarioBd);
              
            }

             return logado = true;

          
      }
      case FacebookLoginStatus.cancelledByUser:{
            print("CANCELOU A LOGAGEM");
            return logado = false;

       
      }
      case FacebookLoginStatus.error:{
          print("DEU ERRO NA LOGAGEM");
          return logado = false;

       
      }
     

    }
     return logado = false;
  }
  Future<String> cadastrar(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
    FirebaseUser user = result.user;
    return user.uid;
  }
  Future<void> deslogar() async {
    return _firebaseAuth.signOut();
  }
  Future<void> enviarVerificacaoEmail() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }
  Future<bool> emailEstaVerificado() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}
