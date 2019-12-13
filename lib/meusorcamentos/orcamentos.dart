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
  int   rowSelecionada = 0;
 
 
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
         title: Text("Orçamentos",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(      
             
             child:Center(
               child:SingleChildScrollView(
               scrollDirection: Axis.vertical,
               
               child:DataTable(
               
               columns: [
                 DataColumn(label:Expanded(child:Text("Data") ,) ),
                 DataColumn(label:Expanded(child:Text("Nome"),) ),
                 DataColumn(label:Expanded(child:Text("Preço") ,) )
               ],
               rows:orcamentos.map<DataRow>((itemrow) => DataRow(
                   selected: ( rowSelecionada == itemrow ),                
                   cells: [
                   DataCell(Text("26/11/2019"),onTap: (){print("Linha selecionada"+ itemrow.toString() + " Row Selecionada" + this.rowSelecionada.toString());
                                                          this.setState((){
                                                            rowSelecionada = itemrow;                                                           
                                                          });
                                                          Navigator.pushNamed(context, '/PortifolioDoProfissional');
                                                          }),
                   DataCell(Text("Alfredo Gomes"),onTap: (){print("Linha selecionada"+ itemrow.toString());this.setState((){
                                                            rowSelecionada = itemrow;
                                                          });
                                                          Navigator.pushNamed(context, '/PortifolioDoProfissional');
                                                          }),
                   DataCell(Text("R\$970,00"),onTap: (){print("Linha selecionada"+ itemrow.toString());this.setState((){
                                                            rowSelecionada = itemrow;
                                                          });
                                                          Navigator.pushNamed(context, '/PortifolioDoProfissional');
                                                          })
                 ])).toList(),
             ) ,
             )  ,
             ),             
             );
         },
             
             )
             
             
                       
         
       
    );
  }
}