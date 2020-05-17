import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_scaffold/componentes/salvarProjetoAction.dart';
import 'package:flutter_scaffold/provider/projetoProvider.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DialProjeto extends StatefulWidget {
  DialProjeto({Key key}) : super(key: key);

  @override
  _DialProjetoState createState() => _DialProjetoState();
}

class _DialProjetoState extends State<DialProjeto> {
  bool criandoProjeto = false;
  File foto;
  File arquivo;
  var valorController = new MoneyMaskedTextController(leftSymbol: 'R\$ ', precision: 2 ,decimalSeparator: '.',thousandSeparator: '');

  Future getImage(BuildContext context , ImageSource source )async{
      final projetoProvider = Provider.of<ProjetoProviderState>(context);
      final usuarioProvider = Provider.of<UsuarioProvider>(context);
     
    print("FUNÇÃO DEPEGAR IMAGEM SELECIONADA");
    if(source.toString() == 'ImageSource.gallery'){
      print("ESCOLHEU GALERIA");
      try{
          print("IMAGEM SOURCE USADA $source");
              foto = await ImagePicker.pickImage(source:source);
        }catch(error){
          print("DEU ERRO");
          print('error taking picture ${error.toString()}');
        }
    } 
    if(source.toString() == 'ImageSource.camera'){
      print("ESCOLHEU Camera");
      final result = await Navigator.of(context).pushNamed('/Camera');
      if(usuarioProvider.tempFotoPath != ''){
         foto = new File(usuarioProvider.tempFotoPath); 
      }
    }    
    if(foto == null) return;
    print("FOTO ADICIONADA");    
    setState(() {
      criandoProjeto = true;
    });
    bool resultado = await projetoProvider.addFotoProjeto(foto);
    print("RESULTADO DA OPREACAO DE ADD FOTO $resultado");
    setState(() {
      criandoProjeto = false;
    });
    usuarioProvider.tempFotoPath = '';
    showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title: Text("Foto Adicionada"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  
  }
  Future getFile(BuildContext context )async{
      final projetoProvider = Provider.of<ProjetoProviderState>(context);

    print("FUNÇÃO DEPEGAR ARQUIVO SELECIONADO");
    try{
          arquivo = await FilePicker.getFile(type: FileType.custom, allowedExtensions: ['pdf','doc','xls','txt'] ,);
    }catch(error){
      print("DEU ERRO");
      print('error taking picture ${error.toString()}');
    }
    if(arquivo == null) return;
    print("ARQUIVO SELECIONADO");    
    String titulo = "";
    String valor = "";    
    showDialog(
      context: context,
      builder:(BuildContext context ){
      return  StatefulBuilder(builder: (context,setState) {
           return AlertDialog(
          title: Text("Salvar Documento"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[             
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titulo'
                ),
                onChanged: (s){
                  titulo = s;
                },
              ),
              TextFormField(
                controller: valorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Valor'
                ),
                onChanged: (s){
                  valor = s;
                },
              ),
               Text("Se o documento não tiver valor digite 0"),
            ],
            
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: (criandoProjeto)  ? null : (){
                Navigator.of(context).pop();
              },
            ),
             FlatButton(
              child:SalvarProjetoAction(carregando: criandoProjeto,),
              onPressed: ()async{                
                setState(() {
                        criandoProjeto = true;
                      });
                      bool resultado = await projetoProvider.addArquivoProjeto(arquivo,titulo,valorController.text);
                      print("RESULTADO DA OPREACAO DE ADD FOTO $resultado");
                      if(resultado){
                        setState(() {
                        criandoProjeto = false;
                        titulo = "";
                        valor = "";
                        valorController.text = "R\$ 0.00";
                      });
                     Navigator.of(context).pop();                      
                      showDialog(
                        context: context,
                        builder:(BuildContext context){
                          return AlertDialog(
                            title: Text("Documento Adicionado"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        }
                      );

                      }else{
                           setState(() {
                        criandoProjeto = false;
                      });
                      showDialog(
                        context: context,
                        builder:(BuildContext context){
                          return AlertDialog(
                            title: Text("Erro"),
                            content: Text("Não foi possivel adicionar o arquivo ao projeto,tente mais tarde!"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        }
                      );
                      }
                      
              },
            )
          ],
        );

        });
       
      }
    );

    
  
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valorController.text = 'R\$ 0.00';
  }
  @override
  Widget build(BuildContext context) {
   final projetoProvider = Provider.of<ProjetoProviderState>(context);
   final firebaseUser    = Provider.of<FirebaseUser>(context);

    return SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 5,
          child: Icon(Icons.add),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: true,
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
              child: Icon(Ionicons.md_person_add),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Adicionar Serviço',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: (){
                print("FUNÇÃO DE ADICIONAR SERVIÇO");
                projetoProvider.adicionarServicoProjeto(context, firebaseUser);
              } 
            ),
            
            /**
             * SpeedDialChild(
              child: Icon(Ionicons.md_cart),
              backgroundColor:Theme.of(context).primaryColor,
              label: 'Adicionar Material',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: (){
                print("FUNÇÃO DE ADICIONAR MATERIAL");
              },
            ),
             * 
             */
            
            SpeedDialChild(
              child: Icon(Icons.photo_camera),
              backgroundColor:Theme.of(context).primaryColor,
              label: 'Adicionar Foto Galeria',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: ()async{
                print("FUNÇÃO DE ADICIONAR FOTO");
                await getImage(context,ImageSource.gallery);
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.photo_camera),
              backgroundColor:Theme.of(context).primaryColor,
              label: 'Adicionar Foto Camera',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: ()async{
                print("FUNÇÃO DE ADICIONAR FOTO");
                await getImage(context,ImageSource.camera);
              },
            ),
             SpeedDialChild(
              child: Icon(Icons.insert_drive_file),
              backgroundColor:Theme.of(context).primaryColor,
              label: 'Adicionar Documento',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: ()async{
                print("FUNÇÃO DE ADICIONAR Documento");
                await getFile(context);
              },
            ),
           
          ],
        );
  }
}
