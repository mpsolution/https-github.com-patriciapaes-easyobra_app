import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/ajudaProvider.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:provider/provider.dart';

class Contatos extends StatefulWidget {
  Contatos({Key key}) : super(key: key);

  @override
  _ContatosState createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  List<DocumentSnapshot> opcoes = [];
  bool carregandoContatos = false;
  List<DocumentSnapshot> contatosOriginais = [];
  List<DocumentSnapshot> contatos = [];
  bool salvandoAjuda = false;
  String pesquisar = '';
  
  

  Future<void> carregarContatos(String idUsuario) async {
    setState(() {
      carregandoContatos = true;
    });
    /**
     *
     * 
     */
    print("FUNÇÃO DE CARREGAMENTO DE OPCOES AJUDA PROFISSIONAL");
     try {
      QuerySnapshot snapshot = await Firestore.instance.collection('chats')
                                                       .where('usuarios',arrayContains: idUsuario) 
                                                       .getDocuments();                  
      
                  contatosOriginais = contatos   = snapshot.documents;
                  setState(() {
                   carregandoContatos = false;
                  
                  });
    } catch (e) {
      print("ERRO NO CARREGAMENTO $e");
      setState(() {
        carregandoContatos = false;
      });

    }
    
    


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ID do usuario  ${Provider.of<UsuarioProvider>(context,listen:false).usuario.documentID}");
    try {
      carregarContatos(Provider.of<UsuarioProvider>(context,listen:false).usuario.documentID);
    } catch (e) {
      print("ERRO AO CARREGAR CONTATOS $e");
      setState(() {
        carregandoContatos = false;
      });
    }
    
  }
   @override
  Widget build(BuildContext context) {
    final ajudaProvider = Provider.of<AjudaProviderState>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).pop(),
         ),
         title: Text("Contatos",style: TextStyle(color: Colors.black),),
         centerTitle: true,

       ),
       body:Builder(
         builder: (BuildContext context){
            return Padding(
              padding: EdgeInsets.all(10),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  onChanged: (s){
                    pesquisar = s;
                    if(s.length == 0){
                      setState(() {
                        contatos = contatosOriginais;
                      });
                    }else{
                    List<DocumentSnapshot> contatosFiltrados = [];
                    contatosOriginais.forEach((contato){
                      contato['dadoUsuarios'].forEach((usuario){
                        if(usuario['uid'] !=  usuarioProvider.usuario.documentID){
                          if(usuario['displayName'].toString().toLowerCase().contains(s.toLowerCase())){
                             contatosFiltrados.add(contato);
                         }
                        }
                      });
                      
                      setState(() {
                        contatos = contatosFiltrados;
                      });
                    });
                    }
                    
                  },
                  decoration: InputDecoration(
                    labelText:'Pesquisar'
                  ),
                ),
                Padding(
                  padding:EdgeInsets.all(5)
                  ),
                Expanded(
                  child: ListView.builder(
                  itemCount: contatos.length,
                  shrinkWrap: true,
                  itemBuilder: (context,i){
                    DocumentSnapshot chat = contatos[i];
                    Map<dynamic,dynamic> user;
                    chat['dadoUsuarios'].forEach((usuario){
                      if(usuario['uid'] != usuarioProvider.usuario.documentID){
                        user = usuario;
                      }
                    });
                    return InkWell(                     
                      onTap:(){
                        usuarioProvider.setIdChat(chat.documentID);
                        Navigator.pushNamed(context,'/Chat');
                      },
                      child:Card(
                      child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:(user != null) ? NetworkImage((user['photoUrl'] != null) ? user['photoUrl'] :  usuarioProvider.getImagemBase)  : NetworkImage( usuarioProvider.getImagemBase) ,
                                ),
                                title: (contatos[i]['titulo'] != null) ? Text(contatos[i]['titulo']) : (user != null) ?  Text(user['displayName']) : Text("Sem nome"),
                              ),
                    )
                    );
                  })
                )
                
                
              ],
            ) ,
          )
            ;
         }
       ) ,
    );
  }
}