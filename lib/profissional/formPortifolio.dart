import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FormPortifolio extends StatefulWidget {
  FormPortifolio({Key key}) : super(key: key);

  @override
  _FormPortifolioState createState() => _FormPortifolioState();
  
}

class _FormPortifolioState extends State<FormPortifolio> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController descricaoControler = TextEditingController();
  TextEditingController enderecoControler  = TextEditingController();
  TextEditingController curiosidadesControler = TextEditingController();
  TextEditingController experienciasControler = TextEditingController();
  bool atualizando = false;

  static String imagemBase = "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-3-avatar-2754579_120516.png";
  List<dynamic> fotos = [];
  List<File> nvsFotos = [];

   String _randomString(int length) {
   var rand = new Random();
   var codeUnits = new List.generate(
      length, 
      (index){
         return rand.nextInt(33)+89;
      }
   );
   
   return new String.fromCharCodes(codeUnits);
}
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
     DocumentSnapshot usuario = Provider.of<UsuarioProvider>(context,listen: false).usuario;
     if(usuario['portifolio'] != null){
       descricaoControler.text = usuario['portifolio']['descricao'];
       enderecoControler.text = usuario['portifolio']['endereco'];
       curiosidadesControler.text = usuario['portifolio']['curiosidades'];
       experienciasControler.text = usuario['portifolio']['experiencias'];
       fotos                      = new List<dynamic>.from(usuario['portifolio']['fotos']);
       
     }
  }
  Future getImage()async{
    print("FUNÇÃO DEPEGAR IMAGEM SELECIONADA");
    try {
      File imagem = await ImagePicker.pickImage(source:ImageSource.gallery);
    nvsFotos.add(imagem);
    print("QUANTIDADE DE FOTOS ${nvsFotos.length}");
    setState(() {
      
    });  
      
    } catch (e) {
      print("ERRO DE SALVAR A IMAGEM $e");
    }
    
  }
  @override
  Widget build(BuildContext context) {
  final usuarioProvider =  Provider.of<UsuarioProvider>(context);
  int qtdFotos = fotos.length;
  int qtdNvsFotos = nvsFotos.length;


    return Scaffold(
      resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       floatingActionButton: FloatingActionButton(
         backgroundColor: Theme.of(context).primaryColor,
         onPressed: (){
           print("FUNÇÃO DE ADD FOTOS");
           getImage();
         },
         child: Icon(Icons.photo,color: Colors.white),
         ),
      appBar: AppBar(
         backgroundColor: Colors.white,
         centerTitle: true,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Editar Portifolio",style: TextStyle(color: Colors.black),),
       ),
      body: Builder(
        builder: (BuildContext context){
          return  Form(
         child: ListView(
          padding: EdgeInsets.only(left:5,right:5,top:5),
         children: <Widget>[  
           if(atualizando) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),        
           Card(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
              children: <Widget>[
                Container(
             constraints: BoxConstraints(minWidth:MediaQuery.of(context).size.width ,minHeight: 25),
             width: MediaQuery.of(context).size.width,
             child:TextFormField(
               controller: descricaoControler,
               maxLines: null,             
             decoration: InputDecoration(
               hintText: 'Faça uma descrição da sua pessoa!',
               labelText: 'Descricao',
               
             ),
             
           ),
           ),
           Container(
             constraints: BoxConstraints(minWidth:MediaQuery.of(context).size.width ,minHeight: 25),
             width: MediaQuery.of(context).size.width,
             child:TextFormField(
              controller: enderecoControler,
            maxLines: null,
             decoration: InputDecoration(
               hintText: 'Seu endereco,rua e cidade',
               labelText: 'Endereço'
             ),
            
           ) ,
           ),
            Container(
             constraints: BoxConstraints(minWidth:MediaQuery.of(context).size.width ,minHeight: 25),
             width: MediaQuery.of(context).size.width,
             child:TextFormField(
               controller: curiosidadesControler,
            maxLines: null,
             decoration: InputDecoration(
               hintText: 'Descreva curiosidades sobre sua pessoa',
               labelText: 'Curiosidades'
             ),
             
           ) ,
           ),
            Container(
             constraints: BoxConstraints(minWidth:MediaQuery.of(context).size.width ,minHeight: 25),
             width: MediaQuery.of(context).size.width,
             child:TextFormField(
               controller: experienciasControler,
            maxLines: null,
             decoration: InputDecoration(
               hintText: 'Descreva suas experiencias',
               labelText: 'Experiencias'
             ),
             
           ) ,
           ),
           


              ],
            ),
              )
            , 
           ),
            ButtonTheme(
             minWidth: MediaQuery.of(context).size.width * 0.8,
             child: RaisedButton(
               color: Theme.of(context).primaryColor,
               onPressed: ()async{
                 setState(() {
                   atualizando = true;
                 });
                 print("SALVAR EDIÇÃo");
               bool atualizou = await  usuarioProvider.atualizarPortifolio({
                   'descricao':descricaoControler.text,
                   'endereco':enderecoControler.text,
                   'curiosidades':curiosidadesControler.text,
                   'experiencias':experienciasControler.text,
                   'fotos':fotos
                 },nvsFotos);
                 if(atualizou){
                   alertaSalvo(context);
                 }else{
                   alertaErro(context);
                 }
                 setState(() {
                   atualizando = false;
                 });
                 
               },
               child: Text("Salvar Portifolio",style:TextStyle(color: Colors.white)),
               ),
           ),  
           Padding(
             padding: EdgeInsets.all(5),
             child:Text("Fotos:",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20),) ,
             )      
            , 
            GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                physics: NeverScrollableScrollPhysics(),
                                children:[
                                  for (var i = 0; i < qtdNvsFotos; i++) Stack(
                                    children: <Widget>[
                                      Image.file(nvsFotos[i])
                                     ,
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: FloatingActionButton(
                                            heroTag: null,
                                            backgroundColor: Colors.red,
                                            mini: true,
                                            onPressed: (){
                                              print("remover foto");
                                              nvsFotos.removeAt(i);
                                              setState(() {
                                                
                                              });
                                            },
                                            child: Icon(Icons.close,color: Colors.white,),
                                            ),
                                        )
                                        ],
                                  ),
                                  for (var i = 0; i < qtdFotos; i++)  Stack(
                                    children: <Widget>[
                                      CachedNetworkImage(
                                    imageUrl: fotos[i],
                                    fit: BoxFit.cover,
                                    placeholder: (context,url) => Center( 
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context,url,error) => Icon(Icons.error),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: FloatingActionButton(
                                      heroTag: null,
                                      backgroundColor: Colors.red,
                                      mini: true,
                                      onPressed: (){
                                        print("remover foto");
                                        fotos.removeAt(i);
                                        setState(() {
                                         
                                        });
                                      },
                                      child: Icon(Icons.close,color: Colors.white,),
                                      ),
                                  )

                                    ],
                                  )
                                  
                                ]
                                
                               
                                ),
                               
             
         ],
       )
         )
          ;
        }
        ),
    )
     ;
  }
  void alertaErro(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Erro!"),
          content: new Text("Não foi possivel atualizar,tente novamente mais tarde!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                
                Navigator.of(context).maybePop();
              },
              )
          ],
        );
      },
    );

  }
  void alertaSalvo(BuildContext context){     

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Portifolio Atualizado!"),
          content: new Text("Portifolio atualizado com Sucesso!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                
               
                Navigator.of(context).maybePop();
              },
              )
          ],
        );
      },
    );
  
  }
}