import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/ajudaProvider.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); 
  bool loadingMensagens = false;
  List<ChatMessage> mensagens = [];
  List<DocumentSnapshot> mensagensFirebase = [];
  StreamController<ChatMessage> mensagemController = StreamController();
  
  
  Future<void> carregarMensagens(String idChat) async {
    setState(() {
      loadingMensagens = true;
    });
    print("FUNÇÃO DE CARREGAMENTO DE MENSAGEM DO CHAT  $idChat");
    try {
      
      Firestore.instance.collection('chats/$idChat/mensagens').orderBy('createdAt').snapshots().listen((snapshot){
        mensagens = [];
         if((snapshot != null) && (snapshot.documents.length > 0 )){
                       mensagensFirebase = snapshot.documents;
                        mensagensFirebase.forEach((mensagem){
                          
                          mensagens.add(ChatMessage(                                             
                            text:mensagem.data['text'],
                            id:mensagem.data['id'],
                            createdAt:DateTime.parse(mensagem.data['createdAt'].toDate().toString()) ,
                            user:ChatUser(
                              uid: mensagem.data['user']['uid'],
                              name:mensagem.data['user']['name'],
                              avatar:mensagem.data['user']['avatar']
                            ), 
                                                  
                          ));
                        });
                        setState(() {
                          
                        });

                     }

      })
                                                     ;
                    
                     
                  setState(() {
                 //   mensagens = mensagens;
                    loadingMensagens = false;
                  });
    } catch (e) {
      print("ERRO NO CARREGAMENTO $e");
      setState(() {
        loadingMensagens = false;
      });

    }
    


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ID CHAT EM USUO  ${Provider.of<UsuarioProvider>(context,listen:false).idChatEmUso}");   
    carregarMensagens(Provider.of<UsuarioProvider>(context,listen:false).idChatEmUso);
    KeyboardVisibilityNotification().addNewListener(
    onChange: (bool visible) {
      print("checando teclado ativo $visible");
      if(visible){
        
                      
      }
    },
  );
  }
   @override
  Widget build(BuildContext context) {
    final ajudaProvider = Provider.of<AjudaProviderState>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();
    atualizarTela(){
      Timer(Duration(microseconds: 300),(){
                            _chatViewKey.currentState.scrollController
                                        ..animateTo(_chatViewKey.currentState.scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                          });
    }
    addMensagem(ChatMessage mensagem,String idChat){
     mensagens.add(mensagem);
    
    Firestore.instance.collection('chats/$idChat/mensagens').add({
      "text":mensagem.text,
      "createdAt":DateTime.now(),
      "user":{
        "uid":mensagem.user.uid,
        "name":mensagem.user.name,
        "avatar":mensagem.user.avatar
      },
      "id":mensagem.id
    }).catchError((onError){
      print("ERRO AO ENVIAR MENSAGEM $onError");

    });
  }
  
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
     //  resizeToAvoidBottomPadding: false,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).pop(),
         ),
         title: Text("Mensagens",style: TextStyle(color: Colors.black),),
         centerTitle: true,

       ),
       body:Builder(
         builder: (BuildContext context){
            return Container(
              height: MediaQuery.of(context).size.height - (MediaQuery.of(context).viewInsets.bottom + 90),
              child:DashChat(
                        user: usuarioProvider.getChatUser, 
                        messageContainerPadding: EdgeInsets.only(top:10,bottom:10),
                         key: _chatViewKey,
                        messages: mensagens,             
                        inputMaxLines: 10,                               
                        onSend: (ChatMessage mensagem) async {
                          print("MENSAGM ${mensagem.toJson()}");
                          addMensagem(mensagem,usuarioProvider.idChatEmUso);
                          
                        },
                      ) ,
            ) 
                   

            ;
         }
       ) ,
    );
  }
}