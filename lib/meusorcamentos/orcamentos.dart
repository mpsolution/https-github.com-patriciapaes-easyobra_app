import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Orcamentos extends StatefulWidget {
  Orcamentos({Key key}) : super(key: key);

  @override
  _OrcamentosState createState() => _OrcamentosState();
}

class _OrcamentosState extends State<Orcamentos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> orcamentos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  String   rowSelecionada = "";
 
 
  @override
  Widget build(BuildContext context) {
  final String idServico     = ModalRoute.of(context).settings.arguments;
        String servico       ="SolicitacoesServicos/" + idServico+ '/orcamentos';

    
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
                 stream: Firestore.instance.collection(servico).snapshots(),
                 builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                                    if(snapshot.hasError) Text("Error: ${snapshot.error}");
                                    switch(snapshot.connectionState){
                                      case ConnectionState.waiting : return new Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),));
                                      default: return DataTable(    
                                                        columnSpacing: MediaQuery.of(context).size.width / 4,                                                
                                                        columns: [
                                                          DataColumn(label:Expanded(child:Text("Data") ,) ),
                                                          DataColumn(label:Expanded(child:Text("Nome"),) ),
                                                          DataColumn(label:Expanded(child:Text("Preço") ,) )
                                                        ],
                                                        rows:snapshot.data.documents.map<DataRow>((DocumentSnapshot itemrow) => DataRow(
                                                            selected: ( rowSelecionada == itemrow.documentID ),                
                                                            cells: [
                                                            DataCell(Text(itemrow["data"]),onTap: (){print("Linha selecionada"+ itemrow.toString() + " Row Selecionada" + this.rowSelecionada.toString());
                                                                                                    this.setState((){
                                                                                                      rowSelecionada = itemrow.documentID;                                                           
                                                                                                    });
                                                                                                    Navigator.pushNamed(context, '/PortifolioDoProfissional');
                                                                                                    }),
                                                            DataCell(Text(itemrow["nomePrestador"]),onTap: (){print("Linha selecionada"+ itemrow.toString());this.setState((){
                                                                                                      rowSelecionada = itemrow.documentID;
                                                                                                    });
                                                                                                    Navigator.pushNamed(context, '/PortifolioDoProfissional');
                                                                                                    }),
                                                            DataCell(Text("R\$${itemrow["valor"]}"),onTap: (){print("Linha selecionada"+ itemrow.toString());this.setState((){
                                                                                                      rowSelecionada = itemrow.documentID;
                                                                                                    });
                                                                                                    Navigator.pushNamed(context, '/PortifolioDoProfissional');
                                                                                                    })
                                                          ])).toList(),
                                                      ) ;
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