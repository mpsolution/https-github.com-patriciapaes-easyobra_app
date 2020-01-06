import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IndicacaoProfissional extends StatefulWidget {
  IndicacaoProfissional({Key key}) : super(key: key);

  @override
  _IndicacaoProfissionalState createState() => _IndicacaoProfissionalState();
}

class _IndicacaoProfissionalState extends State<IndicacaoProfissional> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> opcoesAjuda = ["Profissional não iniciou o serviço","Profissional não conclui o serviço","Outros"];
  String detalhes;
  int opcaoselecionada = -1;
  String textoIndicacaoProfissional = "Se você possui aquele profissional que executa as pequenas e grandes obras com perfeição \nSe ele é super atencioso.\nSe ele é educado.\nSe ele é preocupado em fzer seu melhor.";

 
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
         title: Text("Indicação de Profissional",style: TextStyle(color: Colors.black),),

       ),
       body:Builder(
         builder: (BuildContext context){
           return Padding(
             padding: EdgeInsets.all(15),
             child:Align(
             alignment: Alignment.topCenter,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                        Icon(FontAwesomeIcons.heartbeat,color:Colors.black,), 
                        Text("Faça a indicação de seu melhor Profissional",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18),),
                   ],
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width * 0.85,
                   height: MediaQuery.of(context).size.height * 0.35,
                   child: Align(
                     alignment: Alignment.topCenter,
                     child: Text(textoIndicacaoProfissional),
                   ),
                 ),
                 Padding(padding: EdgeInsets.only(top: 10),),
                 Text("Dados do Profissional",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize:18)),
                 Container(
                   width: MediaQuery.of(context).size.width * 0.9,
                   height: MediaQuery.of(context).size.height * 0.3,
                   decoration: BoxDecoration(
                     border: Border.all(width: 1,color: Colors.black)
                   ),
                   child:Padding(
                     padding: EdgeInsets.all(10),
                     child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       Align(
                     alignment: Alignment.topLeft,
                     child: TextField(
                       decoration: InputDecoration(labelText: "Nome"),
                       onChanged: (s){
                         setState(() {
                           detalhes = s;
                         });
                       },
                     ),
                     ),
                       Align(
                     alignment: Alignment.topLeft,
                     child: TextField(
                       decoration: InputDecoration(labelText: "Email"),
                       onChanged: (s){
                         setState(() {
                           detalhes = s;
                         });
                       },
                     ),
                     ),
                       Align(
                     alignment: Alignment.topLeft,
                     child: TextField(
                       decoration: InputDecoration(labelText: "Telefone"),
                       onChanged: (s){
                         setState(() {
                           detalhes = s;
                         });
                       },
                     ),
                     ),

                     ],
                   ),
                   )
                   
                    ,
                 ),
                 Padding(padding: EdgeInsets.only(top: 5),),
                 SizedBox(
                   width: MediaQuery.of(context).size.width * 0.8,
                   height: 30,
                   child: RaisedButton(
                     onPressed: (){
                       print("ATIVAR FUNÇÃO ENVIAR AJUDA");
                     },
                     color: Colors.grey,
                     child: Text("Indicar Profissional",style:TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20)),
                   ),
                 )
                 
               ],
             ),
           ) ,
           )
           ;
         },
       ) ,
    );
  }
}