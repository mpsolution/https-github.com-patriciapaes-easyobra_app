import 'package:flutter/material.dart';
import 'package:flutter_scaffold/componentes/botao.dart';
import 'package:flutter_scaffold/enderecos/cardendereco.dart';
import 'package:flutter_scaffold/formapagamento/cardcartao.dart';

class Enderecos extends StatefulWidget {
  Enderecos({Key key}) : super(key: key);

  @override
  _EnderecosState createState() => _EnderecosState();
}

class _EnderecosState extends State<Enderecos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> cartoes = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  final Map<String,String> cartao = {"nome":"Maria Eduarda de Almeida",
                                      "numero":"**** **** **** 2630",
                                      "imagem":'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s'
                                      };
  
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
                        },
                        child:SizedBox(
                        height: 50,
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,                      
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.near_me,color:Colors.black),
                            Padding(padding: EdgeInsets.all(5),),
                            Text("Localização atual",style:TextStyle(fontWeight: FontWeight.bold))
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
                                   ...cartoes.map<Widget>((c)=>CardEndereco("Casa", "Rua São Clmenete 126 apt 201", false),).toList()
                                  ]) ,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,                      
                        child:SizedBox(
                          height: 50,
                          child: InkWell(
                        onTap: (){
                          print("Função de adicionar um novo botão");
                          showDialog(
                            context: context,
                            builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("Buscar Endereço:"),
                                  content: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Digite o endereço'
                                              ),
                                            )

                                    ],
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Fechar"),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );  
                            }
                          );
                         
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