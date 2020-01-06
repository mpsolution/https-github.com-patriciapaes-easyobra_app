import 'package:flutter/material.dart';
class Historico{
  List<Map<String,String>> estatos = [];
  String profissional;
  String especialidade;
  String nomeServico;
  Historico(this.profissional,this.especialidade,this.nomeServico);
  void addStatus(Map<String,String> status){
    this.estatos.add(status);
  }
  List<Map<String,String>> getEstatos(){
    return this.estatos;
  }
}
class HistoricoServico extends StatefulWidget {
  HistoricoServico({Key key}) : super(key: key);

  @override
  _HistoricoServicoState createState() => _HistoricoServicoState();
}

class _HistoricoServicoState extends State<HistoricoServico> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String,String> status = {
        "data":"24/11/2019 - 16:43 hrs",
        "status":"Foi realizado o pagamento do serviço"
  };
  Historico h = new Historico("Pedro de Jesus", "Bombeiro Hidráulico", "Substituição de vaso Sanitário");
  


   @override
  Widget build(BuildContext context) {
    h.addStatus(status);
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Mais Detalhes",style: TextStyle(color: Colors.black),),),
       body:Builder(
         builder: (BuildContext context){
           return Padding(
             padding: EdgeInsets.all(15),
             child:Align(
             alignment: Alignment.topCenter,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[                 
                 Padding(padding: EdgeInsets.only(top: 10),),
                 Text("Histórico do Serviço",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize:18)),
                 Container(
                   width: MediaQuery.of(context).size.width * 0.9,
                   height: MediaQuery.of(context).size.height * 0.75,
                   decoration: BoxDecoration(
                     border: Border.all(width: 1,color: Colors.black)
                   ),
                   child:Padding(
                     padding: EdgeInsets.all(10),
                     child: SingleChildScrollView(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text("Profissional: "+h.profissional),
                         Text("Especialidade: "+h.especialidade),
                         Text("Serviço: "+h.nomeServico),
                         ...h.getEstatos().map<Widget>((status){
                           return 
                             Padding(
                               padding: EdgeInsets.only(top:10),
                               child:Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                  Container(
                                    height: 1,width: MediaQuery.of(context).size.width ,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1,color: Colors.black)
                                    ),
                                    ),
                                  Text(status["data"]),
                                  Text(status["status"])
                             ],
                           ) ,
                             );
                           
                         })
                       ],
                     ),
                   ),
                   )
                   
                    ,
                 ),
                 
                 
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