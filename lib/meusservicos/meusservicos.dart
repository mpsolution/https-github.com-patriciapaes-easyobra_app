import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_scaffold/provider/historicoProvider.dart';
import 'package:provider/provider.dart';


class MeusServicos extends StatefulWidget {
  MeusServicos({Key key}) : super(key: key);

  @override
  _MeusServicosState createState() => _MeusServicosState();
}

class _MeusServicosState extends State<MeusServicos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> orcamentos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  Widget buildStatus(String status){
    print("BUILD STATUS $status");
    if(status == 'Aguardando Pagamento') return Column(
                                children: <Widget>[
                                    Icon(Icons.autorenew,color: Colors.green,),
                                    Text('Aguardando Pagametno',style:TextStyle(fontSize:7,color:Colors.green,fontWeight: FontWeight.bold))
                                ],
                              );
    return Column(
                                children: <Widget>[
                                    Icon(Icons.check,color: Colors.green,),
                                    Text('Concluido',style:TextStyle(fontSize:7,color:Colors.green,fontWeight: FontWeight.bold))
                                ],
                              );
    
  }
  
  @override
  Widget build(BuildContext context) {
    final historicoProvider = Provider.of<HistoricoProvider>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);

    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).pop(),
         ),
         title: Text("Meus Serviços",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             child:StreamBuilder(
               stream: Firestore.instance.collection('servicos').where('idCliente',isEqualTo:(firebaseUser.providerData != null) ? firebaseUser.uid : '123456').snapshots(),
               builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                 if(snapshot.hasError) Text("Error : ${snapshot.error}");
                 switch(snapshot.connectionState){
                   case ConnectionState.waiting : return Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),),);
                   default:
                   return(snapshot.data.documents.length == 0) ? Center(child: Text("Sem Serviços Criados!"),) :
                    ListView(
               padding: EdgeInsets.all(4),
               children: <Widget>[
                 ...snapshot.data.documents.map<Widget>((DocumentSnapshot servico)=>
                  Column(
                    children: <Widget>[
                      SizedBox(
               width: double.infinity,
               height: 150,
               child:Card(                                
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,                 
                 children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child:Center(
                     child:CircleAvatar(
                     radius: 40,
                     backgroundColor: Colors.transparent,
                     backgroundImage: NetworkImage(imagemBase),
                   ),
                   )
                  ),                  
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.only(left:10),
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     mainAxisSize: MainAxisSize.max,
                     children: <Widget>[
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                              Text(servico["tituloServico"],style:TextStyle(fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.all(8)),
                              buildStatus(servico['status'])                             

                         ],
                       ),
                       Flexible(
                         child: Text(servico["descricaoServico"].toString().substring(0,(servico["descricaoServico"].toString().length > 30) ? 30 :servico["descricaoServico"].toString().length ) ,overflow: TextOverflow.ellipsis ,)
                         ),                       
                       Expanded(
                         child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisSize: MainAxisSize.max,
                         children: <Widget>[
                                    Text(formatDate(DateTime.parse(servico["dataCriado"].toDate().toString()),[dd,'/',mm ,'/', yy] )),
                                    Padding(padding: EdgeInsets.all(8),),
                                    Text("R\$${ double.parse(servico['valorServico'].toString()).toStringAsFixed(2)  }",style:TextStyle(fontWeight: FontWeight.bold))
                         ],
                       ),
                       ),                       
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         mainAxisSize: MainAxisSize.max,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                              ButtonTheme(
                                height: 30,
                                shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                  ) ,                                
                                child: RaisedButton(
                                  color:Theme.of(context).buttonColor ,
                                  onPressed: (){
                                    print("FUNÇÃO VER MAIS HISTORICO");
                                    historicoProvider.setHistorico({
                                      "idPrestador":servico['idPrestador'],
                                      "tituloServico":servico['tituloServico'],
                                      "historico":servico['historico'],
                                      'situacao':(servico['situacao'] != null) ? servico['situacao'] : 'Aguardando Pagamento',
                                      'idServico':servico.documentID
                                    });
                                    Navigator.of(context).pushNamed('/HistoricoServico');
                                    
                                  },
                                  child: Text("Ver Mais",style:TextStyle(color: Theme.of(context).textSelectionColor)),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 5),),
                              ButtonTheme(
                                height: 30,                                
                                shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.black,width: 1)
                                  ) ,
                                
                                child: RaisedButton(
                                  color:Theme.of(context).textSelectionColor ,
                                  onPressed: (){
                                    print("FUNÇÃO VER MAIS HISTORICO");
                                    Navigator.of(context).pushNamed('/PedirAjuda');
                                  },
                                  child: Text("Pedir Ajuda",style:TextStyle(color: Theme.of(context).buttonColor)),
                                ),
                              ),
                             
                         ],
                       )
                      
                     ],
                   ),
                  )
                   ,                   
                   

                 ],
               ),
             ) ,
             ),
            
                    ],
                  )
                  
                 
                 ).toList()
               ],
             );

                 }
               },
             )
            
             
             
             
           );
         },
       ) ,
    );
  }
}