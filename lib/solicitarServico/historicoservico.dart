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
   final historicoProvider = Provider.of<HistoricoProvider>(context , listen: false);
   List<String> situacoes = [
     'Aguardando Pagamento',
     'Servico Cancelado',
     'Pago',
     'Aguardando Inicio do Serviço',
     'Em Execução',
     'Finalizado',
     'Em Mediação',
     'Servico Concluido',
     'Pagamento em Disputa',
     'Pagamento Aprovado',
     'Pagamento Liberado',
   ];
   String situacao =( h['situacao'] != null) ? h['situacao'] : 'Servico Concluido';
   print("TIPO DE SITUACAO ${h['situacao']}");
   if(h['cliente'] == null){
     Widget row = Padding(padding: EdgeInsets.all(0) );
     if(situacao == 'Aguardando Pagamento'){
       row = Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          RaisedButton(
                                            color: Colors.red,
                                            onPressed: (){
                                              print("FUNCAO DE CANCELAR");
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context){
                                                  return AlertDialog(
                                                              title: new Text("Deseja Cancelar o Projeto"),
                                                              content: new Text("Não será possivel desfazer a ação!"),
                                                              actions: <Widget>[
                                                                // define os botões na base do dialogo
                                                                new FlatButton(
                                                                  child: new Text("Não"),
                                                                  onPressed: () {                
                                                                    Navigator.of(context).pop();
                                                                  },),
                                                                new FlatButton(
                                                                  child: new Text("Sim"),
                                                                  onPressed: () {          
                                                                    historicoProvider.mudarSituacaoServico('Servico Cancelado');      
                                                                    Navigator.of(context).pop();
                                                                  },)
                                                              ],
                                                            );
                                                }
                                                );
                                              
                                            },
                                            child: Text("Cancelar", style: TextStyle(color: Colors.white),),
                                            ),
                                         RaisedButton(
                                            color: Colors.blue,
                                            onPressed: (){
                                              print("FUNCAO PAGAR");
                                              historicoProvider.mudarSituacaoServico('Pago');
                                            },
                                            child: Text("Pagar", style: TextStyle(color: Colors.white),),
                                            ),   
                                        ],
                                      );
     }
     
     if(situacao == 'Servico Concluido'){
       row = Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          RaisedButton(
                                            color: Colors.red,
                                            onPressed: (){
                                              print("FUNCAO DE REPROVAR SERVICO");
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context){
                                                  return AlertDialog(
                                                              title: new Text("Deseja Reprovar A Execução do Serviço"),
                                                              content: new Text("Ao não aceitar a finalização do serviço,entrará em disputa o projeto"),
                                                              actions: <Widget>[
                                                                // define os botões na base do dialogo
                                                                new FlatButton(
                                                                  child: new Text("Não"),
                                                                  onPressed: () {                
                                                                    Navigator.of(context).pop();
                                                                  },),
                                                                new FlatButton(
                                                                  child: new Text("Sim"),
                                                                  onPressed: () {          
                                                                    historicoProvider.mudarSituacaoServico('Pagamento em disputa');      
                                                                    Navigator.of(context).pop();
                                                                  },)
                                                              ],
                                                            );
                                                }
                                                );
                                              
                                            },
                                            child: Text("Reprovar Serviço", style: TextStyle(color: Colors.white),),
                                            ),
                                         RaisedButton(
                                            color: Colors.blue,
                                            onPressed: (){
                                              print("FUNCAO APROVAR SERVIÇO");
                                              historicoProvider.mudarSituacaoServico('Servico Aprovado');
                                            },
                                            child: Text("Aprovar Serviço", style: TextStyle(color: Colors.white),),
                                            ),   
                                        ],
                                      );
     }
     if(situacao == 'Execucao Finalizada'){
       row = Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          RaisedButton(
                                            color: Colors.red,
                                            onPressed: (){                                              
                                              print("FUNCAO DE CANCELAR");
                                              showDialog(
                                                context: context,
                                                builder:(BuildContext context){
                                                     return AlertDialog(
                                                              title: new Text("Deseja Cancelar o Projeto"),
                                                              content: new Text("Não será possivel desfazer a ação!"),
                                                              actions: <Widget>[
                                                                // define os botões na base do dialogo
                                                                new FlatButton(
                                                                  child: new Text("Não"),
                                                                  onPressed: () {                
                                                                    Navigator.of(context).pop();
                                                                  },),
                                                                new FlatButton(
                                                                  child: new Text("Sim"),
                                                                  onPressed: () {          
                                                                    historicoProvider.mudarSituacaoServico('Servico Cancelado');
                                                                    Navigator.of(context).pop();
                                                                  },)
                                                              ],
                                                            );
                                                  } 
                                                );
                                            },
                                            child: Text("Recusar Execução", style: TextStyle(color: Colors.white),),
                                            ),
                                         RaisedButton(
                                            color: Colors.blue,
                                            onPressed: (){
                                              print("FUNCAO PAGAR");
                                              historicoProvider.mudarSituacaoServico('Pagamento Liberado');
                                            },
                                            child: Text("Aceitar Execução", style: TextStyle(color: Colors.white),),
                                            ),   
                                        ],
                                      );
     }
     
     return Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text("Profissional: "+h['nomePrestador']),
         Text("Especialidade: "+h['especialidade']),
         Text("Serviço: "+h['servico']),
         Text("Situação: ${(h['situacao'] == null) ? '--' : h['situacao'] }" ),         
         row
       ],
     );
   }else{
     Widget row = Padding(padding: EdgeInsets.all(0) );
      if(situacao == 'Pago'){
       row = Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[                                          
                                         RaisedButton(
                                            color: Colors.blue,
                                            onPressed: (){
                                              print("FUNCAO INICIAR TRABALHO");
                                              historicoProvider.mudarSituacaoServico('Em Execucao');
                                            },
                                            child: Text("Iniciar Trabalho", style: TextStyle(color: Colors.white),),
                                            ),   
                                        ],
                                      );
     }     
     if(situacao == 'Em Execucao'){
       row = Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[                                          
                                         RaisedButton(
                                            color: Colors.blue,
                                            onPressed: (){
                                              print("FUNCAO FINALIZAR TRABALHO");
                                              historicoProvider.mudarSituacaoServico('Execucao Finalizada');
                                            },
                                            child: Text("Finalizar Serviço", style: TextStyle(color: Colors.white),),
                                            ),   
                                        ],
                                      );
     } 
      return Column(        
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text("Cliente: "+h['cliente']),
         Text("Endereço: "+h['endereco']),
         Text("Telefone: "+h['telefone']),
         Text("Situação: ${(h['situacao'] == null) ? '--' : h['situacao'] }" ),     
         row         
       ],
     );
   }
 }
   @override
  Widget build(BuildContext context) {
    final historicoProvider = Provider.of<HistoricoProvider>(context);
    final usuarioProvider   = Provider.of<UsuarioProvider>(context);

   // h.addStatus(status);
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
                     child:  SingleChildScrollView(
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
                           print("status $status");
                           return                             
                             Padding(
                               padding: EdgeInsets.only(top:10),
                               child:
                               Column(
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
                                  Text(status["status"]),
                             ],
                           ) ,
                             );
                         }),
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