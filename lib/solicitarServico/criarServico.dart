import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/criacaoServicoProvider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';  
class CriarServico extends StatefulWidget {
  CriarServico({Key key}) : super(key: key);

  @override
  _CriarServicoState createState() => _CriarServicoState();
}

class _CriarServicoState extends State<CriarServico> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool criandoServico     = false;
  String       descricao  = '';
  String       titulo     = '';
  List<File> fotos        = [];
  File imagem;
  bool _dialVisible = true;
  Future getImage(  String s)async{
    print("FUNÇÃO DEPEGAR IMAGEM SELECIONADA");
    var imagem = await ImagePicker.pickImage(source:(s == "galeria") ? ImageSource.gallery : ImageSource.camera);
    fotos.add(imagem);
    print("QUANTIDADE DE FOTOS ${fotos.length}");
    setState(() {
      
    });
  
  }
  void servicoCriadoDialog() {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Serviço Criado"),
          content: new Text("Serviço criado com sucesso aguarde orçamentos!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                
                Navigator.of(context).pushNamed('/');
              },
              )
          ],
        );
      },
    );
  }
  
  
    Future<String> uploadFile(file) async {    
       StorageReference storageReference = FirebaseStorage.instance    
           .ref()    
           .child('fotosServicos/${Path.basename(file.path)}}');    
       StorageUploadTask uploadTask = storageReference.putFile(file);    
       await uploadTask.onComplete;    
       print('File Uploaded');    
       return storageReference.getDownloadURL().then((fileURL) {    
         return  fileURL; 
       });    
     }  
  Future<void> criarServico(String tipoServico,String categoria) async {
              FirebaseUser cliente                  = await FirebaseAuth.instance.currentUser();
             // String       idCliente                = cliente.providerId;
              String       idCliente                = (cliente.providerData != null)? cliente.uid : '123456';
              String       tituloServico            = titulo;
              String       descricaoServico         = descricao;
              List<String> fotosParaServico         = [];
              for (var foto in fotos) {
                String url = await uploadFile(foto);
                 fotosParaServico.add(url);
                
              }              
              CollectionReference dbSolicitacoesServicos = Firestore.instance.collection('SolicitacoesServicos');
             Map<String,dynamic>  servico = await  Firestore.instance.runTransaction((Transaction tx) async {
                dbSolicitacoesServicos.add({
                    "idCliente":idCliente,
                    "tipoServico":tipoServico,
                    "tituloServico":tituloServico,
                    "descricaoServico":descricaoServico,
                    "fotos":fotosParaServico,
                    "categoria":categoria,
                    "dataCriado":DateTime.now(),
                    

                }).then((salvo){
                  dbSolicitacoesServicos.add({
                    "idServico":salvo.documentID
                  });
                });   
               });
               print("SERVICO SALVO $servico");
               setState(() {
                 criandoServico = false;
               });
               servicoCriadoDialog();
  }
 
  void removerFoto(File foto) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Foto:"),
          content: new Text("Deseja Remover a Foto?"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Sim"),
              onPressed: () {
                fotos.removeWhere((f) => f == foto);
                setState(() {
                  
                });
                Navigator.of(context).pop();
              },
              ),
              new FlatButton(
              child: new Text("Não"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
   @override
  Widget build(BuildContext context) {
    final criacaoServicoProvider = Provider.of<CriacaoServicoState>(context);
    String       tipoServico  = ModalRoute.of(context).settings.arguments;    
    
   
    TextStyle    styleTitulo  = TextStyle(fontSize: 18);
    
    
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Criar Serviço",style: TextStyle(color: Colors.black),),

       ),
       floatingActionButton:SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 5,
          child: Icon(Icons.photo_camera),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: _dialVisible,
          // If true user is forced to close dial manually 
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,         
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.photo_library),
              backgroundColor: Colors.red,
              label: 'Galeria',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () =>getImage("galeria")
            ),
            SpeedDialChild(
              child: Icon(Icons.photo_camera),
              backgroundColor: Colors.blue,
              label: 'Camera',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => getImage("camera"),
            ),
           
          ],
        ),
         bottomNavigationBar: Padding(
           padding: EdgeInsets.all(8),
           child: RaisedButton(
             
             onPressed:(!criandoServico)  ?  () async {
               print("ATIVAR FUNÇÃO DE CRIAR SERVIÇO"); 
               setState(() {
                 criandoServico = true;
               });     
               await criarServico(tipoServico,criacaoServicoProvider.getTipoServico);         
             } : null,
             color: Theme.of(context).primaryColor,
             textColor: Colors.white,
             child:  Text("Criar Serviço"),
           ),
         ),

         
       body:Builder(
         builder: (BuildContext context){
           return Container(
             child:Padding(
               padding: EdgeInsets.only(top: 5,left: 15,right: 15,bottom: 5),
               child: CustomScrollView(
                 slivers:<Widget>[
                   SliverList(delegate: SliverChildListDelegate(
                   [
                     if(criandoServico) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),
                     TextField(
                          decoration: InputDecoration(
                           labelText: "Titulo"
                          ),
                          onChanged: (s){
                            setState(() {
                              titulo = s;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text("Categoria : ${criacaoServicoProvider.tipoServico}",style: styleTitulo,),
                        )
                        , 
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text("Tipo : $tipoServico",style: styleTitulo,),
                        )
                        , 
                       
                        TextField(
                          maxLines: null,
                          keyboardType:TextInputType.multiline,
                          onChanged: (s){
                            setState(() {
                              descricao = s;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Descrição:",
                            ),
                            ),
                            Padding(
                          padding: EdgeInsets.only(top:5),
                          child:  Text("Fotos:",style: styleTitulo,) ,
                        )
                      ,

                   ]
                 ),),
                 SliverGrid(
                   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
                   delegate:SliverChildListDelegate(
                     [
                       
                      
                                    ...fotos.map<Widget>((foto)=>InkWell(
                                      onTap: (){
                                        removerFoto(foto);
                                      },
                                      child:Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1,color: Colors.black)
                                              ),child: Padding(
                                                padding: EdgeInsets.all(2),
                                                child:Image.file(
                                                    foto,
                                                    fit: BoxFit.contain,
                                                    ),
                                              ),
                                              ) ,
                                    )

                                             )
                                    

                     ]
                   ) ,
                 )]
                 
                ,
               ),
             )
             
             );
         },
       ) ,
    );
  }
}