import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_scaffold/componentes/botao.dart';
import 'package:flutter_scaffold/enderecos/cardendereco.dart';
import 'package:flutter_scaffold/formapagamento/cardcartao.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Enderecos extends StatefulWidget {
  Enderecos({Key key}) : super(key: key);

  @override
  _EnderecosState createState() => _EnderecosState();
}

class _EnderecosState extends State<Enderecos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final kGoogleApiKey = "AIzaSyBGq9bwrWAy-MYdK2O8UDZxoIC5Nhk5Miw";
  bool escaneandoEndereco = false;
  String nvNomeEndereco = "";
  int enderecoPreferencial = -1;
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> cartoes = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  List<dynamic> enderecosSalvos = [];
  final Map<String,String> cartao = {"nome":"Maria Eduarda de Almeida",
                                      "numero":"**** **** **** 2630",
                                      "imagem":'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s'
                                      };
  void carregarEnderecosSalvos() async {
    SharedPreferences prefs   =  await SharedPreferences.getInstance();
    String listaEnderecosJson =  prefs.getString("listaEnderecosJson") ?? "";
    enderecoPreferencial      =  prefs.getInt('enderecoPreferencial');
    if(listaEnderecosJson != ""){
      enderecosSalvos = jsonDecode(listaEnderecosJson);
      setState(() {
        
      });
    }
    }
     void removerEndereco(index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listaEnderecosJson = prefs.getString("listaEnderecosJson") ?? "";
     this.enderecosSalvos.removeAt(index);
    if(this.enderecosSalvos.length != 0){
      listaEnderecosJson = json.encode(this.enderecosSalvos);
      prefs.setString('listaEnderecosJson', listaEnderecosJson);
    }
    print("QUANTIDADE DE LISTA $listaEnderecosJson");
    setState(() {
      
    });
    }
    void modalRemoverEndereco(int index) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Endereco ${enderecosSalvos[index]["nome"]}"),
          content: new Text("Escolha:"),
          actions: <Widget>[
            // define os botões na base do dialogo

            new Center(
              child:FlatButton(
              child: new Text("Colocar Como Preferencial"),
              onPressed: () async {
                enderecoPreferencial = index;
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setInt('enderecoPreferencial', enderecoPreferencial);
                Navigator.of(context).pop();
                setState(() {
                  
                });
              },
            ) ,
            )
             ,
            new Center(
              child:FlatButton(
              child: new Text("Remover Endereco"),
              onPressed: () {
                removerEndereco(index);
                Navigator.of(context).pop();
              },
            ) ,
            ),
            Center(
              child:FlatButton(
              child: new Text("Nada"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ) ,
            )
            ,
          ],
        );
      },
    );
    }
  void modalSalvarEndereco(String end){
      showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Salvar o  Endereço"),
          content: new SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Nome"),
                onChanged: (s){
                  print("NOME $s");
                  setState(() {
                    nvNomeEndereco =s;
                  });
                },
              ),
              Text(end)
            ],
          ), 
          ),
          
          actions: <Widget>[
            
           
            Center(
              child:FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ) ,
            )
            ,
             new Center(
              child:FlatButton(
              child: new Text("Salvar"),
              onPressed: () async {
                enderecosSalvos.add({
                  "nome":nvNomeEndereco,
                  "endereco":end
                });
                setState(() {
                  
                });
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('listaEnderecosJson', jsonEncode(enderecosSalvos));
                Navigator.of(context).pop();
              },
            ) ,
            ),
          ],
        );
      },
    );

  }
  @override
  void initState() {
    // TODO: implement initState
    carregarEnderecosSalvos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Escolha o endereço de entregas/serviços",style: TextStyle(color: Colors.black,fontSize: 15),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             child:Column(
               children: <Widget>[
                    Padding(padding: EdgeInsets.all(4),),
                    Card(
                      child:InkWell(
                        onTap: (){
                          print("FUNÇÃO BUSCAR LOCALIZAÇÃO ATUAL");
                           setState(() {
                                         escaneandoEndereco = true;
                                       });
                             Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
                            geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
                                     .then((Position position) async {
                                      
                                      Location location = Location(position.latitude,position.longitude);
                                       print("LOCALIZACAO DO USUARIO $location");
                                       final coordenadas = Coordinates(position.latitude, position.longitude);
                                      List<Address>  endereco = await Geocoder.local.findAddressesFromCoordinates(coordenadas);
                                      Address first = endereco.first;
                                      print("ENDERECO ENCONTRADO ${first.featureName} ${first.addressLine}");
                                      setState(() {
                                        escaneandoEndereco = false;
                                      });
                                      modalSalvarEndereco(first.addressLine);
                                      
                                      

                                    });

                        },
                        child:SizedBox(
                        height: 50,
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,                      
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.near_me,color:Colors.black),
                            Padding(padding: EdgeInsets.all(5),),
                            Text("Localização atual",style:TextStyle(fontWeight: FontWeight.bold)),
                            (escaneandoEndereco == true)  ? 
                           Padding(
                             padding: EdgeInsets.only(left: 15,top: 5,bottom: 5),
                             child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),),
                           )  : Padding(padding: EdgeInsets.all(0), )
                          ],
                        ) ,
                      ) ,
                      )
                      ,
                    ),                    
                    Padding(padding: EdgeInsets.all(5),),
                    Expanded(
                      child:ListView(                                                                   
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(4),
                                  children:<Widget>[
                                   ...enderecosSalvos.asMap().map((index,endereco)=>MapEntry(index, 
                                   InkWell(
                                     onTap: (){modalRemoverEndereco(index);},
                                     child:CardEndereco(endereco["nome"], endereco["endereco"], enderecoPreferencial == index) ,
                                   )
                                   )).values.toList()
                                  ]) ,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,                      
                        child:SizedBox(
                          height: 50,
                          child: InkWell(
                        onTap: () async {
                          print("Função de adicionar um novo botão");
                          PlacesAutocomplete.show(
                                      hint: "Procurar",
                                      context: context,
                                      apiKey: kGoogleApiKey,
                                      mode: Mode.overlay, // Mode.fullscreen
                                      language: "pt",                                    
                                      radius: 10000,                        
                                      components: [new Component(Component.country, "br")]).then((Prediction p){
                                        //abrir modal para salvar a localização
                                        if(p != null){
                                        modalSalvarEndereco(p.description);

                                        }

                                      }).catchError((onError){
                                        print("ERRO GERADO NA PESQUISA $onError");
                                      });
                       
                          
                          
                         
                        },
                        child:Card(
                          child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add_location,color:Colors.black),
                                  Padding(padding: EdgeInsets.all(5),),
                                  Text("Insira um novo endereço",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                        ),
                        )
                        
                        
                        ,
                      )
                      ),
                      Padding(padding: EdgeInsets.all(2),)
                    
                    
               ],
             ));
         },
       ) ,
    );
  }
}