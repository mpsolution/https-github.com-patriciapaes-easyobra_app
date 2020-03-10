import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/historicoProvider.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
  bool ativandoChat = false;

 Widget topoHistorico(Map<String,dynamic> h){
   if(h['cliente'] == null){
     return Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text("Profissional: "+h['nomePrestador']),
         Text("Especialidade: "+h['especialidade']),
         Text("Serviço: "+h['servico']),         
       ],
     );
   }else{
      return Column(        
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text("Cliente: "+h['cliente']),
         Text("Endereço: "+h['endereco']),
         Text("Telefone: "+h['telefone']),
         Text("Serviço: "+h['servico']),         
       ],
     );
   }
 }
   @override
  Widget build(BuildContext context) {
    final historicoProvider = Provider.of<HistoricoProvider>(context);
    final usuarioProvider   = Provider.of<UsuarioProvider>(context);

    h.addStatus(status);
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         centerTitle: true,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Mais Detalhes",style: TextStyle(color: Colors.black),),),
       body:Builder(
         builder: (BuildContext context){
           return Padding(             padding: EdgeInsets.all(15),
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
                         topoHistorico(historicoProvider.historico),
                         if(historicoProvider.historico['cliente'] != null) Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: <Widget>[
                             RaisedButton( color: Theme.of(context).primaryColor, 
                                          onPressed: (historicoProvider.historico['telefone'] == 'Sem Telefone') ? null : (){
                                            print("FUNÇÃO LIGAR");
                                            String telefone = historicoProvider.historico['telefone'];
                                            launch("tel://" + telefone);
                                            }  ,  
                                          child: Text("Ligar",style:TextStyle(color:Colors.white),),
                                          ),
                             RaisedButton(  color: Theme.of(context).primaryColor, 
                                            onPressed: ()async {
                                              setState(() {
                                                ativandoChat = true;
                                              });
                                              print("FUNÇÃO MENSAGEM");
                                             bool criou = await usuarioProvider.procurarCriarChat(historicoProvider.servico.documentID, historicoProvider.servico['idCliente'], historicoProvider.servico);
                                             if(criou){
                                               Navigator.of(context).pushNamed('/Chat');
                                             }
                                             setState(() {
                                                ativandoChat = false;
                                              });
                                            } , 
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                  Text("Mensagem",style:TextStyle(color:Colors.white) ),
                                                  if(ativandoChat == true) Padding(
                                                    padding: EdgeInsets.only(left:5),
                                                    child: SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.white)),
                                                  ),
                                                  )
                                                   
                                                  
                                              ],
                                            )
                                            
                                             ),

                           ],
                         ),
                         ...historicoProvider.getHistorico['historico'].map<Widget>((status){
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