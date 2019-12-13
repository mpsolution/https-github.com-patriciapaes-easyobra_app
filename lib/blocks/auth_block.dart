import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:flutter_scaffold/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthBlock extends ChangeNotifier {
  AuthBlock() {
    setUser();
  }
  AuthService _authService = AuthService();
  // Index
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Loading
  bool _loading = false;
  String _loadingType;
  bool get loading => _loading;
  String get loadingType => _loadingType;
  set loading(bool loadingState) {
    _loading = loadingState;
    notifyListeners();
  }
  set loadingType(String loadingType) {
    _loadingType = loadingType;
    notifyListeners();
  }
  // Loading
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool isUserExist) {
    _isLoggedIn = isUserExist;
    notifyListeners();
  }

  // user
  Map _user = {};
  Map get user => _user;
  setUser() async {
  
    _user = await _authService.getUser();
    isLoggedIn = _user == null ? false : true;
    notifyListeners();
  }
  Future<void> logarFacebook()async{
                  final facebookLogin = FacebookLogin();
                  var result = await facebookLogin.logIn(['email', 'public_profile']);

                    switch (result.status) {
                      case FacebookLoginStatus.loggedIn:
                        final facebookAuthCred = FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);
                        final user = await FirebaseAuth.instance.signInWithCredential(facebookAuthCred);
                       
                        print('NOME DE USUARIO ' + user.user.displayName.toString() + ' UID ' + user.user.uid.toString() + ' EMAIL ' + user.user.email.toString());
                        
                        // A variável user guarda as informações do usuário, como foto, nome, etc.
                        break;
                      case FacebookLoginStatus.cancelledByUser:
                        
                        print("Facebook login cancelled");
                         
                        break;
                      case FacebookLoginStatus.error:
                        print(result.errorMessage);
                        
                        break;
                    }
  }

  login(UserCredential userCredential) async {
    loading = true;
    loadingType = 'login';
    await _authService.login(userCredential);
    setUser();
    loading = false;
  }

  register(User user) async {
    loading = true;
    loadingType = 'register';
    await _authService.register(user);
    loading = false;
  }

  logout() async {
    await _authService.logout();
    isLoggedIn = false;
    notifyListeners();
  }
}
