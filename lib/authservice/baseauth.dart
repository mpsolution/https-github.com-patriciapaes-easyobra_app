import 'package:firebase_auth/firebase_auth.dart';

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
