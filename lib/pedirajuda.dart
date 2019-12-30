import 'package:flutter/material.dart';

class PedirAjuda extends StatefulWidget {
  PedirAjuda({Key key}) : super(key: key);

  @override
  _PedirAjudaState createState() => _PedirAjudaState();
}

class _PedirAjudaState extends State<PedirAjuda> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> opcoesAjuda = ["Profissional não iniciou o serviço","Profissional não conclui o serviço","Outros"];
  String detalhes;
  int opcaoselecionada = -1;

 
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
         title: Text("Pedir Ajuda",style: TextStyle(color: Colors.black),),

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
                 Text("Como podemos te ajudar?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                 Container(
                   width: MediaQuery.of(context).size.width * 0.8,
                   height: MediaQuery.of(context).size.height * 0.4,
                   decoration: BoxDecoration(
                     border: Border.all(width: 1,color: Colors.black)
                   ),
                   child: ListView.builder(
                     itemCount:opcoesAjuda.length,
                     itemBuilder: (context,i){
                       String opcao = opcoesAjuda[i];
                       return AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          color: (i == opcaoselecionada) ? Colors.blue[200] : Colors.white,
                          child:Padding(
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                            onTap: (){
                              setState(() {
                                opcaoselecionada = i;
                              });
                            },
                            child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(opcao),
                          ),
                          ),
                          )
                           
                          ,
                       );
                     },
                   ),
                 ),
                 Padding(padding: EdgeInsets.only(top: 10),),
                 Text("Nos Informe mais detalhes",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize:18)),
                 Container(
                   width: MediaQuery.of(context).size.width * 0.8,
                   height: MediaQuery.of(context).size.height * 0.2,
                   decoration: BoxDecoration(
                     border: Border.all(width: 1,color: Colors.black)
                   ),
                   child: Align(
                     alignment: Alignment.topLeft,
                     child: TextField(
                       
                       decoration: InputDecoration(focusedBorder: InputBorder.none),
                       onChanged: (s){
                         setState(() {
                           detalhes = s;
                         });
                       },
                     ),

                   ),
                 ),
                 SizedBox(
                   width: MediaQuery.of(context).size.width * 0.6,
                   height: 30,
                   child: RaisedButton(
                     onPressed: (){
                       print("ATIVAR FUNÇÃO ENVIAR AJUDA");
                     },
                     color: Colors.grey,
                     child: Text("Enviar",style:TextStyle(color: Colors.white,fontWeight:FontWeight.bold)),
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