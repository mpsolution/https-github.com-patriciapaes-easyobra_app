import 'package:basic_utils/basic_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class MeusOrcamentos extends StatefulWidget {
  MeusOrcamentos({Key key}) : super(key: key);

  @override
  _MeusOrcamentosState createState() => _MeusOrcamentosState();
}

class _MeusOrcamentosState extends State<MeusOrcamentos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> orcamentos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
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
         title: Text("Meus Orçamentos",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             width: MediaQuery.of(context).size.width,
             child:StreamBuilder<QuerySnapshot>(
               stream:Firestore.instance.collection('SolicitacoesServicos').where('idCliente',isEqualTo:"123456").snapshots(),
               builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                 if(snapshot.hasError) Text("Error: ${snapshot.error}");
                 switch(snapshot.connectionState){
                   case ConnectionState.waiting : return new Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),));
                   default:
                    return new ListView(
               padding: EdgeInsets.all(4),
               children: <Widget>[
                 ...snapshot.data.documents.map<Widget>((DocumentSnapshot orcamento)=>
                  SizedBox(
               width: double.infinity,
               height: 150,
               child:Card(
               
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: <Widget>[
                   Center(
                     child:CircleAvatar(
                     radius: 50,
                     backgroundColor: Colors.transparent,
                     backgroundImage: NetworkImage(imagemBase),
                   ),
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[
                       Text(StringUtils.capitalize(orcamento["categoria"]),style:TextStyle(fontWeight: FontWeight.bold)),
                       Text(orcamento["tituloServico"]),
                       Text(formatDate(DateTime.parse(orcamento["dataCriado"].toDate().toString()),[dd,'/',MM ,'/', yy])),
                        (orcamento["qtdRespostas"] == null)?Text("0 Respostas Obtidas") : Text("${orcamento['qtdRespostas']} Respostas  "),
                        (orcamento["menorValor"] == null) ? Text("----")  :  Text("Menor valor R\$ ${orcamento['menorValor']}",style:TextStyle(fontWeight: FontWeight.bold,fontSize:12))
                     ],
                   ),
                   //Botoes
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[
                       InkWell(
                         onTap: (){
                           print("FORMATO DOS ORÇAMENTOS ${orcamento.documentID}");
                           Navigator.pushNamed(context,'/Orcamentos',arguments: orcamento.documentID);
                         },
                         child:Container(
                         width: 120,
                         height: 30,
                         child:Card(
                            
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                            ),
                            child:Center(
                              
                              child:Text("Ver Orçamentos",style: TextStyle(color: Colors.white),)                             
                            ) 
                          ),
                       ),
                       )
                       ,
                       Container(
                         width: 120,
                         height: 30,
                         child:Card(                            
                            shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.black,width: 1.0),
                            ),
                            child:Center(
                              child:Text("Pedir Ajuda",style: TextStyle(color: Colors.green),)                             
                            ) 
                          ),
                       ),
                       Container(
                         width: 120,
                         height: 30,
                         child:Card(                            
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                            ),
                            child:
                              InkWell(
                                onTap: (){
                                  print("Cancelar");
                                },
                                child:  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:<Widget>[
                                        Icon(Icons.close,color: Colors.white,),
                                        Text("Cancelar",style: TextStyle(color: Colors.white),) 
                                    ],                           
                                  ) ,
                              )
                              
                          ) ,
                       ),

                     ],
                   )

                 ],
               ),
             ) ,
             )
                 
                 ).toList()
               ],
             );
                 }
               }
             )
             
             
             
             
           );
         },
       ) ,
    );
  }
}