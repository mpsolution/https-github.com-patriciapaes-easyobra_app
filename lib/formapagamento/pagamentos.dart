import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/componentes/botao.dart';
import 'package:flutter_scaffold/formapagamento/cardcartao.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pagamentos extends StatefulWidget {
  Pagamentos({Key key}) : super(key: key);

  @override
  _PagamentosState createState() => _PagamentosState();
}

class _PagamentosState extends State<Pagamentos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  String imagemVisa = 'https://notinostore.com.br/wp-content/uploads/2019/04/visa-5-logo-png-transparent.png';
  String imagemMasterCard = "https://dicadeaposta.com/wp-content/uploads/2018/04/mastercard-deposito-sites-de-apostas.png";
  final List<int> cartoes = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  final Map<String,String> cartao = {"nome":"Maria Eduarda de Almeida",
                                      "numero":"**** **** **** 2630",
                                      "imagem":'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s'
                                      };
  List<dynamic>  listaCartoes = [];
   Map<dynamic,dynamic> cartaoPreferencial = {"cardNumber":"",
                                              "expiryDate":"",
                                              "cardHolderName":"",
                                              "cvvCode":""};
  Future<void> carregarCartoes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listaCartoesJson = prefs.getString('listaCartoesJson') ?? "";
   // print("LISTA SALVA $listaCartoesJson ");
    if(listaCartoesJson != ""){
      listaCartoes = jsonDecode(listaCartoesJson);
      print("LISTA DECODIFICADA $listaCartoes");
    }
    carregarCartaoPreferencial();

  }
  void carregarCartaoPreferencial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartaoPreferencialJson = prefs.getString("cartaoPreferencialJson") ?? "";
    if(cartaoPreferencialJson != ""){
      cartaoPreferencial = jsonDecode(cartaoPreferencialJson);
     
    }
   // print(" PRIMEIRA LETRA DO CARTAO PREFERENCIAL " +  cartaoPreferencial["cardNumber"].toString().substring(0,1));
     setState(() {
        
      });


  }
  void removerCartao(index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listaCartoesJson;
     this.listaCartoes.removeAt(index);
    if(this.listaCartoes.length != 0){
      listaCartoesJson = json.encode(this.listaCartoes);
      prefs.setString('listaCartoesJson', listaCartoesJson);
    }
    print("QUANTIDADE DE LISTA $listaCartoesJson");
    setState(() {
      
    });


  }
void modalRemoverCartao(int index) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Funcoes Cartao"),
          content: new Text("Escolha:"),
          actions: <Widget>[
            // define os botões na base do dialogo

            new Center(
              child:FlatButton(
              child: new Text("Colocar Como Preferencial"),
              onPressed: () async {
                cartaoPreferencial = this.listaCartoes[index];
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('cartaoPreferencialJson', jsonEncode(cartaoPreferencial));
                Navigator.of(context).pop();
                setState(() {
                  
                });
              },
            ) ,
            )
             ,
            new Center(
              child:FlatButton(
              child: new Text("Remover Cartao"),
              onPressed: () {
                removerCartao(index);
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
   
  
  @override
  void initState()  {
    // TODO: implement initState
    
    carregarCartoes();
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
         title: Text("Pagamentos",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             child:Column(
               children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(2),),
                        Text("Preferencial:")
                      ],
                    ),                   
                   (cartaoPreferencial["cardHolderName"] != "") ? CardCartao(cartaoPreferencial["cardHolderName"],cartaoPreferencial["cardNumber"],(cartaoPreferencial["cardNumber"].toString().substring(0,1) == "2") ? imagemMasterCard : imagemVisa,-1,this.listaCartoes) : Text(''),
                    Padding(padding: EdgeInsets.all(5),),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(2),),
                        Text("Outros:")
                      ],
                    ),
                    Expanded(
                      child:ListView(                                                                   
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(4),
                                  children:<Widget>[
                                   ...listaCartoes.asMap().map((index,c){
                                     print("CARTAO QUE ESTA NO MAPRENDER $c");
                                     return MapEntry(index, 
                                     InkWell(
                                       onTap: (){
                                            modalRemoverCartao(index);
                                       },
                                        child:CardCartao(c["cardHolderName"] ?? "",c["cardNumber"] ?? "",(identical(c["cardNumber"].toString().substring(0,1), "2")) ? imagemMasterCard : imagemVisa,index,this.listaCartoes)) ,
                                     )
                                     ; }).values.toList()
                                  ]) ,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          print("Função de adicionar um novo botão");
                          Navigator.pushNamed(context, '/AdicionarCartao').then((novoCartao){
                            if(novoCartao){
                              print("FUNCAO DE VOLTA ATIVADA");
                              carregarCartoes();
                            }
                          });
                        },
                        child: Text("Adicionar Novo Cartão",style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
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