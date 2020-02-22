import 'package:basic_utils/basic_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_scaffold/provider/criacaoServicoProvider.dart';
import 'package:provider/provider.dart';

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
    final criacaoServicoProvider = Provider.of<CriacaoServicoState>(context);
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
         title: Text("Meus Orçamentos",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             width: MediaQuery.of(context).size.width,
             child:StreamBuilder<QuerySnapshot>(
               stream:Firestore.instance.collection('SolicitacoesServicos').where('idCliente',isEqualTo:(firebaseUser.providerData != null)? firebaseUser.uid : "123456").snapshots(),
               builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                 if(snapshot.hasError) Text("Error: ${snapshot.error}");
                 switch(snapshot.connectionState){
                   case ConnectionState.waiting : return new Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),));
                   default:
                    return (snapshot.data.documents.length == 0) ? Center(child: Text("Crie Um Serviço Para Receber Orçamentos."),) :  new  ListView( 
               padding: EdgeInsets.all(4),
               children: <Widget>[
                 ...snapshot.data.documents.map<Widget>((DocumentSnapshot orcamento)=>
                  SizedBox(
               width: double.infinity,
               height: 160,
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
                   buildInfoCard(orcamento)
                   ,
                   //Botoes
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[
                       ButtonTheme(
                         minWidth: MediaQuery.of(context).size.width * 0.27,
                         height: 25,
                         child: RaisedButton(                           
                           color: Colors.green,
                           shape: RoundedRectangleBorder(
                             borderRadius:BorderRadius.circular(5),
                            
                           ),
                           onPressed: (){
                              print("FORMATO DOS ORÇAMENTOS ${orcamento.documentID}");
                              print("ORCAMENTOS DO SERVICO ${orcamento.data} ");
                              Navigator.pushNamed(context,'/Orcamentos',arguments: orcamento.documentID);
                              criacaoServicoProvider.setServico(orcamento.data);
                              criacaoServicoProvider.setIdSolicitacaoServico(orcamento.documentID);
                           },
                           child:Text("Ver Orçamentos",style: TextStyle(color: Colors.white,fontSize: 11),) ,
                         ),
                       ),
                      
                       ButtonTheme(
                         minWidth: MediaQuery.of(context).size.width * 0.27,
                         height: 25,
                         child: RaisedButton(                           
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             borderRadius:BorderRadius.circular(5),
                             side:BorderSide(color: Colors.black)
                           ),
                           onPressed: (){
                             print("IR PARA A AJUDA");
                             Navigator.of(context).pushNamed('/PedirAjuda');
                           },
                           child:Text("Pedir Ajuda",style: TextStyle(color: Colors.green , fontSize: 11),) ,
                         ),
                       ),
                       ButtonTheme(
                         minWidth: MediaQuery.of(context).size.width * 0.27,
                         height: 25,
                         child: RaisedButton(                           
                           color: Colors.red,
                           shape: RoundedRectangleBorder(
                             borderRadius:BorderRadius.circular(5),
                           ),
                           onPressed: (){
                               print("Cancelar");
                           },
                           child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:<Widget>[
                                        Icon(Icons.close,color: Colors.white,size: 15,),
                                        Padding(padding: EdgeInsets.only(left:5)),
                                        Text("Cancelar",style: TextStyle(color: Colors.white,fontSize: 11),) 
                                    ],                           
                                  )  ,
                         ),
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
    Widget buildInfoCard( DocumentSnapshot orcamento){
      String qtdRespostas = 'Sem Respostas';
      String menorValor   = '-----';
      if(orcamento['orcamentos'] != null){
        qtdRespostas = (orcamento['orcamentos'].length == 1 ) ? '1 Resposta' : "${orcamento['orcamentos'].length} Respostas";
        double menorValorDouble = double.parse(orcamento['orcamentos'][0]['valor'].replaceAll('R\$','').replaceAll(',','.'))  ;
        menorValor = orcamento['orcamentos'][0]['valor'];
        orcamento['orcamentos'].forEach((orcamentoValor){
          menorValor = (menorValorDouble > double.parse(orcamentoValor['valor'].replaceAll('R\$','').replaceAll(',','.')) ) ? orcamentoValor['valor'] : menorValor;
        });
      }
      return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[                       
                       Text(StringUtils.capitalize(orcamento["tituloServico"]) ,style:TextStyle(fontWeight: FontWeight.bold)),
                       Text(StringUtils.capitalize(orcamento["categoria"])),
                       Text(formatDate(DateTime.parse(orcamento["dataCriado"].toDate().toString()),[dd,'/',mm ,'/', yy])),
                       Text(qtdRespostas),
                       Text(menorValor),                       
                        
                     ],
                   );

    }
}