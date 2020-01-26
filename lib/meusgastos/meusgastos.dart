import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ClasseProjeto{
  String nome;
  String id;
  List<Map<String,String>> gastos;
  ClasseProjeto(this.nome,this.id,this.gastos);
  void editarNome(String n){this.nome = n;}
  void adicionarGasto(Map<String,String> gasto){this.gastos.add(gasto);}
  void removerGasto(String id){
    this.gastos.removeWhere((gasto)=>gasto["id"] == id);
  }
  String getTotalClasseProjeto(){
    print("FUNÇÃO GET TOTAL ATIVADA");
    int total = 0;
    gastos.forEach((gasto){
      print("esta no map");
      try {
        print("Tentou da parse no gasto"+gasto.toString());
        total += int.parse(gasto["valor"]);
      } catch (e) {
        print("ERRO EM DAR TO TOTAL EM "+gasto.toString());
        
      }
      });
    return total.toString();
  }
  }
class MeusGastos extends StatefulWidget {
  MeusGastos({Key key}) : super(key: key);

  @override
  _MeusGastosState createState() => _MeusGastosState();
}

class _MeusGastosState extends State<MeusGastos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextStyle titulo = TextStyle(fontWeight: FontWeight.bold); 
  static List<Map<String,String>> gastos = [
    {"id":"idaleatorio","nome":"Nome do gasto","tipo":"Tipo do gasto","data":"Data do gasto","valor":"1"}
  ]; 
  final ClasseProjeto classeProjeto = new ClasseProjeto("nome do ClasseProjeto","id",gastos); 
   @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: (){print("ATIVAR FUNÇÃO ADD GASTO");},
       ),
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Meus Gastos",style: TextStyle(color: Colors.black),),

       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             child:Padding(
               padding: EdgeInsets.all(10),
               child:Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     Text("ClasseProjeto: ",style: TextStyle(fontWeight: FontWeight.bold),),
                     Text(classeProjeto.nome),
                     Icon(FontAwesomeIcons.pen,color: Colors.black,size: 12,),
                     Icon(FontAwesomeIcons.trash,color:Colors.black,size:12)],
                 ),
                 SingleChildScrollView(
                   child:DataTable(
                   columns: [
                     DataColumn(label: Text("Tipo")),
                     DataColumn(label: Text("Nome")),
                     DataColumn(label: Text("Data")),
                     DataColumn(label: Text("Valor"))
                   ],
                   rows: classeProjeto.gastos.map<DataRow>((gasto)=>DataRow(
                     cells: [
                              DataCell(Text(gasto["tipo"])),
                              DataCell(Text(gasto["nome"])),
                              DataCell(Text(gasto["data"])),
                              DataCell(
                                Row(
                                  children: <Widget>[
                                    Text(gasto["valor"]),
                                    Padding(padding: EdgeInsets.only(left: 10),),
                                    Icon(FontAwesomeIcons.trash,color:Colors.black,size: 12,)
                                  ],
                                ),
                                onTap: (){
                                  classeProjeto.removerGasto(gasto["id"]);
                                  setState(() {});
                                }
                                
                                )
                            ]
                   )).toList(),
                 ) ,
                 ),
                 Padding(
                   padding: EdgeInsets.all(5),
                   child:Align(
                   alignment: Alignment.topRight,
                   child: Text("Total  R\$" + classeProjeto.getTotalClasseProjeto(),style: titulo,),
                 ) ,
                 )
                 ],
             ) ,
             )
             
             );
         },
       ) ,
    );
  }
}