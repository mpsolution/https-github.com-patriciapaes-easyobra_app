import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/criacaoServicoProvider.dart';
import 'package:provider/provider.dart';

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
    final criacaoServicoProvider = Provider.of<CriacaoServicoState>(context);

  final String idServico     = ModalRoute.of(context).settings.arguments;
        String servico       ="SolicitacoesServicos";
   print("ID DO SERVICO $idServico em orcamentos");
    
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
               child:(idServico != null) ? StreamBuilder(
                 stream: Firestore.instance.collection(servico).document(idServico).snapshots(),
                 builder: (BuildContext context,AsyncSnapshot<DocumentSnapshot> snapshot){
                                    if(snapshot.hasError) Text("Error: ${snapshot.error}");
                                    switch(snapshot.connectionState){
                                      case ConnectionState.waiting : return new Padding(padding: EdgeInsets.only(top: 10),
                                          child: Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),)),
                                      ) ;
                                      default: return DataTable(    
                                                        columnSpacing: MediaQuery.of(context).size.width / 4,                                                
                                                        columns: [
                                                          DataColumn(label:Expanded(child:Text("Data") ,) ),
                                                          DataColumn(label:Expanded(child:Text("Nome"),) ),
                                                          DataColumn(label:Expanded(child:Text("Preço") ,) )
                                                        ],
                                                        rows:snapshot.data['orcamentos'].map<DataRow>((dynamic itemrow) => DataRow(
                                                            selected: ( rowSelecionada == itemrow['idPrestador'] ),                
                                                            cells: [
                                                            DataCell(Text(formatDate(DateTime.parse(itemrow["data"].toDate().toString()),[dd,'/',mm ,'/', yy])),onTap: (){
                                                                                                    print("Linha selecionada"+ itemrow.toString() + " Row Selecionada" + this.rowSelecionada.toString());
                                                                                                    
                                                                                                    this.setState((){
                                                                                                      rowSelecionada =itemrow['idPrestador'];                                                           
                                                                                                    });
                                                                                                    Navigator.pushNamed(context, '/PortifolioDoProfissional');
                                                                                                    criacaoServicoProvider.setIdPrestadorServicoValorServico(itemrow['idPrestador'],double.parse(itemrow['valor'].replaceAll('R\$','').replaceAll(',','.')) );
                                                                                                    }),
                                                            DataCell(Text(itemrow["nome"] , textAlign: TextAlign.center,),onTap: (){
                                                                                                      print("Linha selecionada"+ itemrow.toString());
                                                                                                                                                                                                          
                                                                                                      this.setState((){
                                                                                                      rowSelecionada = itemrow['idPrestador'];
                                                                                                    });
                                                                                                    Navigator.pushNamed(context, '/PortifolioDoProfissional');
                                                                                                    criacaoServicoProvider.setIdPrestadorServicoValorServico(itemrow['idPrestador'],double.parse(itemrow['valor'].replaceAll('R\$','').replaceAll(',','.')) );
                                                                                                    }),
                                                            DataCell(Text("${itemrow["valor"]}"),onTap: (){print("Linha selecionada"+ itemrow.toString());
                                                                                                    
                                                                                                    this.setState((){
                                                                                                      rowSelecionada = itemrow['idPrestador'];
                                                                                                    });
                                                                                                   
                                                                                                    Navigator.pushNamed(context, '/PortifolioDoProfissional');
                                                                                                    criacaoServicoProvider.setIdPrestadorServicoValorServico(itemrow['idPrestador'],double.parse(itemrow['valor'].replaceAll('R\$','').replaceAll(',','.')) );
                                                                                                    })
                                                          ])).toList(),
                                                      ) ;
                                    }


                 }
               ) : Padding(
                 padding: EdgeInsets.only(top: 20),
                 child: Center(
                 child: Text("Sem orçamentos!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
               ),
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