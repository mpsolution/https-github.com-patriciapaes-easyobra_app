import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/criacaoServicoProvider.dart';
import 'package:provider/provider.dart';

class VerOrcamentos extends StatefulWidget {
  VerOrcamentos({Key key}) : super(key: key);

  @override
  _VerOrcamentosState createState() => _VerOrcamentosState();
}

class _VerOrcamentosState extends State<VerOrcamentos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> VerOrcamentos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  String   rowSelecionada = "";
 
 
  @override
  Widget build(BuildContext context) {
    final criacaoServicoProvider = Provider.of<CriacaoServicoState>(context);    
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Orçamentos",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(      
             width: MediaQuery.of(context).size.width,
             child:Align(
               alignment: Alignment.topCenter,
               child:SingleChildScrollView(
               scrollDirection: Axis.vertical,              
               
               child:StreamBuilder(
                 stream: Firestore.instance.collection("SolicitacoesServicos").snapshots(),
                 builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                                    if(snapshot.hasError) Text("Error: ${snapshot.error}");
                                    switch(snapshot.connectionState){
                                      case ConnectionState.waiting : return new Padding(padding: EdgeInsets.only(top: 10),
                                          child: Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),)),
                                      ) ;
                                      default:  {
                                        List<DocumentSnapshot> solicitacoesServicos = [];
                                        snapshot.data.documents.forEach((element) { 
                                          if(element['tituloServico'] != null){
                                            solicitacoesServicos.add(element);
                                          }
                                        });
                                       return DataTable(    
                                                        columnSpacing: MediaQuery.of(context).size.width / 4,                                                
                                                        columns: [
                                                          DataColumn(label:Expanded(child:Text("Titulo") ,) ),
                                                          DataColumn(label:Expanded(child:Text("Tipo"),) ),
                                                          DataColumn(label:Expanded(child:Text("Data") ,) )
                                                        ],
                                                        rows:solicitacoesServicos.map<DataRow>((DocumentSnapshot itemrow){ 
                                                            return DataRow(
                                                            selected: ( rowSelecionada == itemrow.documentID ),                
                                                            cells: [                                                            
                                                            DataCell(Text(itemrow["tituloServico"]),onTap: (){
                                                                                                      print("Linha selecionada"+ itemrow.toString());
                                                                                                                                                                                                          
                                                                                                      this.setState((){
                                                                                                      rowSelecionada = itemrow.documentID;
                                                                                                    });
                                                                                                    Navigator.pushNamed(context, '/VerSolicitacaoServico',arguments:itemrow);
                                                                                                    //criacaoServicoProvider.setIdPrestadorServicoValorServico(itemrow['idPrestador'],double.parse(itemrow['valor']) );
                                                                                                    }),
                                                            DataCell(Text(itemrow["tipoServico"]),onTap: (){print("Linha selecionada"+ itemrow.toString());
                                                                                                    
                                                                                                    this.setState((){
                                                                                                      rowSelecionada = itemrow.documentID;
                                                                                                    });
                                                                                                   
                                                                                                    Navigator.pushNamed(context, '/VerSolicitacaoServico',arguments: itemrow);
                                                                                                    //criacaoServicoProvider.setIdPrestadorServicoValorServico(itemrow['idPrestador'],double.parse(itemrow['valor']) );
                                                                                                    }),
                                                            DataCell(Text( formatDate(DateTime.parse(itemrow["dataCriado"].toDate().toString()),[dd,'/',mm ,'/', yy])),onTap: (){
                                                                                                    print("Linha selecionada"+ itemrow.toString() + " Row Selecionada" + this.rowSelecionada.toString());
                                                                                                    
                                                                                                    this.setState((){
                                                                                                      rowSelecionada = itemrow.documentID;                                                           
                                                                                                    });
                                                                                                    Navigator.pushNamed(context, '/VerSolicitacaoServico',arguments: itemrow);
                                                                                                    //criacaoServicoProvider.setIdPrestadorServicoValorServico(itemrow['idPrestador'],double.parse(itemrow['valor']) );
                                                                                                    })
                                                          ]);}).toList(),
                                                      );} 
                                    }


                 }
               )
               ,
             )  ,
             ),             
             );
         },
             
             )
             
             
                       
         
       
    );
  }
}