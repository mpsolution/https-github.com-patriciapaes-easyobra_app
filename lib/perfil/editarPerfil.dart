import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditarPerfil extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<EditarPerfil>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

    final GlobalKey<ScaffoldState> _scaffoldKey                         =  new GlobalKey<ScaffoldState>();
    File imagem;
    bool cpfOuCnpj                                                      = true;
    TextEditingController nomeControler                                 = TextEditingController();
    TextEditingController telefoneControler                             = TextEditingController();   
    var cepControler                                                    = new MaskedTextController(mask: '00000-00', text: '00000-00');
    var cepEmpresaControler                                             = new MaskedTextController(mask: '00000-00', text: '00000-00');
    var cpfControler                                                    = new MaskedTextController(mask: '000.000.000-00', text: '000.000.000-00');  
    var cnpjControler                                                   = new MaskedTextController(mask:'00.000.000/0000-00');
    TextEditingController enderecoControler                             = TextEditingController();
    TextEditingController ruaControler                                  = TextEditingController();
    TextEditingController numeroControler                               = TextEditingController();
    TextEditingController enderecoEmpresaControler                      = TextEditingController();
    TextEditingController ruaEmpresaControler                           = TextEditingController();
    TextEditingController numeroEmpresaControler                        = TextEditingController();
    TextEditingController razaoSocialControler                          = TextEditingController();
    TextEditingController inscricaoEstadualMunicipalControler           = TextEditingController();




   


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
    bool atualizando =false;

  Future getImage(  String s)async{
    print("FUNÇÃO DEPEGAR IMAGEM SELECIONADA");
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final result = await Navigator.of(context).pushNamed('/Camera');
    try {
          if(usuarioProvider.tempFotoPath != ''){
            imagem = new File(usuarioProvider.tempFotoPath);
          }
          
    } catch (e) {
      print("QUANTIDADE DE FOTOS $e");
    }
    usuarioProvider.tempFotoPath = '';
   
    
    setState(() {
      
    });
  
  }

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    nomeControler.text                             = usuarioProvider.usuario['displayName'];
    telefoneControler.text                         = (usuarioProvider.usuario['phoneNumber'] == null) ? "" : usuarioProvider.usuario['phoneNumber'];
    cepControler.text                              = (usuarioProvider.usuario['cep'] == null) ? "" : usuarioProvider.usuario['cep'];
    cnpjControler.text                             = (usuarioProvider.usuario['cnpj'] == null) ? "" : usuarioProvider.usuario['cnpj'];
    enderecoControler.text                         = (usuarioProvider.usuario['endereco'] == null) ? "" : usuarioProvider.usuario['endereco'];
    numeroControler.text                           = (usuarioProvider.usuario['numero'] == null) ? "" : usuarioProvider.usuario['numero'];
    enderecoEmpresaControler.text                  = (usuarioProvider.usuario['enderecoEmpresa'] == null) ? "" : usuarioProvider.usuario['enderecoEmpresa'];
    ruaControler.text                              = (usuarioProvider.usuario['rua'] == null) ? "" : usuarioProvider.usuario['rua'];
    ruaEmpresaControler.text                       = (usuarioProvider.usuario['ruaEmpresa'] == null) ? "" : usuarioProvider.usuario['ruaEmpresa'];
    numeroEmpresaControler.text                    = (usuarioProvider.usuario['numeroEmpresa'] == null) ? "" : usuarioProvider.usuario['numeroEmpresa'];
    razaoSocialControler.text                      = (usuarioProvider.usuario['razaoSocial'] == null) ? "" : usuarioProvider.usuario['razaoSocial'];
    inscricaoEstadualMunicipalControler.text       = (usuarioProvider.usuario['inscricaoEstadualMunicipal'] == null) ? "" : usuarioProvider.usuario['inscricaoEstadualMunicipal'];
    
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new InkWell(
           child: new Icon(Icons.arrow_back,color:Colors.black),
           onTap: () { 
             try {
             Navigator.of(context).maybePop();
               
             } catch (e) {
               print("ERRO $e");
             }
             },
         ),
         title: Text("Perfil",style: TextStyle(color: Colors.black),),
       ),
        body: new Container(
      color: Colors.white,
      
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 250.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                   
                   
                    
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  
                                ),
                                child: (imagem == null) ? ClipOval(
                                  child: CachedNetworkImage(
                                  fit:BoxFit.cover,
                                  imageUrl: usuarioProvider.usuario['photoUrl'],
                                  placeholder: (context,url)=>Center(
                                    child:SizedBox( 
                                      child: CircularProgressIndicator()
                                    ,) ,
                                    ),
                                  errorWidget: (context,url,error) => Icon(Icons.error),
                                  ),
                                )
                                  : Image.file(imagem),
                                ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: new InkWell(
                              onTap: (){
                                  getImage('galeria');
                              },
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 25.0,
                                  child: new Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                            )
                            ,
                      ]),
                    )
                  ],
                ),
              ),
               if(atualizando) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Informações Pessoais',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Nome',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(                                  
                                  controller: nomeControler,
                                  decoration: const InputDecoration(
                                    hintText: "Entre seu Nome",
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                     
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Telefone',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: telefoneControler,                                  
                                  decoration: const InputDecoration(
                                  hintText: "Entre seu telefone"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                               Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Pessoa Fisica:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          Checkbox(value: cpfOuCnpj, onChanged:_status ? null : (value){
                            setState(() {
                              cpfOuCnpj = value;
                            });
                          }),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                               Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Pessoa Juridica:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          Checkbox(value: !cpfOuCnpj, onChanged:_status ? null : (value){
                           print("FUNCAO MUDADA $value");
                            setState(() {
                              cpfOuCnpj = !value;
                            });
                          }),
                            ],
                          )
                          
                              
                        ],  
                      ),
                      //endereco pessoa
                     (cpfOuCnpj) ?  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'CPF:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                            Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: cpfControler,  
                                  keyboardType: TextInputType.number,                                
                                  decoration: const InputDecoration(
                                  hintText: "CPF"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'CEP:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: cepControler, 
                                  keyboardType: TextInputType.number,                                 
                                  decoration: const InputDecoration(
                                  hintText: "CEP"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Rua:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                            Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: ruaControler,                                  
                                  decoration: const InputDecoration(
                                  hintText: "Rua"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Endereco:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: enderecoControler,                                  
                                  decoration: const InputDecoration(
                                  hintText: "Endereco"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Numero:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: numeroControler,   
                                  keyboardType: TextInputType.number,                             
                                  decoration: const InputDecoration(
                                  hintText: "Numero"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ) :
                      //endereco empresa
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'CNPJ:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                            Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: cnpjControler,  
                                  keyboardType: TextInputType.number,                                
                                  decoration: const InputDecoration(
                                  hintText: "CNPJ"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'CEP Empresa:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: cepEmpresaControler, 
                                  keyboardType: TextInputType.number,                                 
                                  decoration: const InputDecoration(
                                  hintText: "CEP da Empresa"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Rua da Empresa:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                            Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: ruaEmpresaControler,                                  
                                  decoration: const InputDecoration(
                                  hintText: "Rua da Empresa"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Endereco da Empresa:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: enderecoEmpresaControler,                                  
                                  decoration: const InputDecoration(
                                  hintText: "Endereco da Empresa"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Numero da Empresa:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: numeroEmpresaControler,   
                                  keyboardType: TextInputType.number,                             
                                  decoration: const InputDecoration(
                                  hintText: "Numero da Empresa"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Inscrição Estadua/Municipal:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: inscricaoEstadualMunicipalControler,                                  
                                  decoration: const InputDecoration(
                                  hintText: "Inscricão Estadual/Municipal"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Razão Social:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          Padding(
                          padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: razaoSocialControler,                                  
                                  decoration: const InputDecoration(
                                  hintText: "Razao Social"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                     
                      
                      !_status ? Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Atualizar"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () async {
                  setState(()  {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    atualizando = true;
                    });
                  String fotoUrl = usuarioProvider.usuario['photoUrl'];
                  if(imagem != null){
                   fotoUrl = await usuarioProvider.uploadFile(imagem);
                  }
                 bool resultado = await usuarioProvider.atualizarUsuario({
                    'displayName':nomeControler.text,
                    "phoneNumber":telefoneControler.text,
                    "photoUrl":fotoUrl,
                    "cep":cepControler.text,
                    "cpf":cpfControler.text,
                    "cnpj":cnpjControler.text,
                    "endereco":enderecoControler.text,
                    "enderecoEmpresa":enderecoEmpresaControler.text,
                    "rua":ruaControler.text,
                    "ruaEmpresa":ruaEmpresaControler.text,
                    "numero":numeroControler.text,
                    "numeroEmpresa":numeroEmpresaControler.text,
                    "razaoSocial":razaoSocialControler.text,
                    "inscricaoEstadualMunicipal":inscricaoEstadualMunicipalControler.text,
                    });
                    if(resultado){
                      print("ATUALIZACAO FEITA COM SUCESSO");
                      _scaffoldKey.currentState.showSnackBar( 
                        SnackBar(
                          content: Text("Atualização Feita com Sucesso!")
                          )
                      );
                    }else{
                      print("ERRO NA ATUALIZACAO");
                      _scaffoldKey.currentState.showSnackBar( 
                        SnackBar(
                          content: Text("Erro na Atualização tente novamente mais tarde!")
                          )
                      );
                    }
                    setState(() {
                      atualizando = false;
                    });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancelar"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  if(usuarioProvider.usuario['phoneNumber'] == null){
                   telefoneControler.text = " ";
                  }else{
                    telefoneControler.text = usuarioProvider.usuario['phoneNumber'];
                  }
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                    nomeControler.text     = usuarioProvider.usuario['displayName'];
                    imagem = null;

                  
                   
                    
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    ) : new Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Atualizar"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancelar"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}