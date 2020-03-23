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
           onPressed: () => Navigator.of(context).maybePop(),
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
                  SizedBox(
               width: double.infinity,
               height: 150,
               child:Card(               
               child: Row(
                 children: <Widget>[
                   Center(
                     child:CircleAvatar(
                     radius: 40,
                     backgroundColor: Colors.transparent,
                     backgroundImage: NetworkImage(imagemBase),
                   ),
                   ),
                   Padding(padding: EdgeInsets.all(8),),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     mainAxisSize: MainAxisSize.max,
                     children: <Widget>[
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                              Text(servico["tituloServico"],style:TextStyle(fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.all(8)),
                              Column(
                                children: <Widget>[
                                      Icon(Icons.check,color: Colors.green,),
                                      Text("Concluido",style:TextStyle(fontSize:7,color:Colors.green,fontWeight: FontWeight.bold))
                                ],
                              )
                             

                         ],
                       ),
                       Flexible(
                         child: Text(servico["descricaoServico"] , overflow: TextOverflow.fade,)
                         ),                       
                       Expanded(
                         child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisSize: MainAxisSize.max,
                         children: <Widget>[
                                    Text(formatDate(DateTime.parse(servico["dataCriado"].toDate().toString()),[dd,'/',mm ,'/', yy] )),
                                    Padding(padding: EdgeInsets.all(8),),
                                    Text("R\$${servico['valorServico']}",style:TextStyle(fontWeight: FontWeight.bold))
                         ],
                       ),
                       )
                       ,                       
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      "historico":servico['historico']
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
                   

                 ],
               ),
             ) ,
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