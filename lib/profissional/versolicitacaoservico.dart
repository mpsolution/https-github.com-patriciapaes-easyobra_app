import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/home/slider.dart';
import 'package:flutter_scaffold/provider/historicoProvider.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:provider/provider.dart';
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
class VerSolicitacaoServico extends StatefulWidget {
  VerSolicitacaoServico({Key key}) : super(key: key);

  @override
  _VerSolicitacaoServicoState createState() => _VerSolicitacaoServicoState();
}

class _VerSolicitacaoServicoState extends State<VerSolicitacaoServico> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController custoServico = TextEditingController();
  Map<String,String> status = {
        "data":"24/11/2019 - 16:43 hrs",
        "status":"Foi realizado o pagamento do serviço"
  };
  Historico h = new Historico("Pedro de Jesus", "Bombeiro Hidráulico", "Substituição de vaso Sanitário");
  


   @override
  Widget build(BuildContext context) {
    final historicoProvider = Provider.of<HistoricoProvider>(context);
    final usuarioProvider   = Provider.of<UsuarioProvider>(context);
    final DocumentSnapshot servico = ModalRoute.of(context).settings.arguments;

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
           return Padding(
             padding: EdgeInsets.all(15),
             child:Align(
             alignment: Alignment.topCenter,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.max,
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
                         Row(children: <Widget>[
                           Text("Cliente: ",style: TextStyle( fontWeight: FontWeight.bold),),
                           Text('<Oculto>')
                         ],),
                          Row(children: <Widget>[
                           Text("Localidade: ",style: TextStyle( fontWeight: FontWeight.bold),),
                           Text((servico['localidade'] != null) ? servico['localidade'] : 'Sem Localidade')
                         ],),
                           Row(children: <Widget>[
                           Text("Serviço: ",style: TextStyle( fontWeight: FontWeight.bold),),
                           Text((servico['tituloServico']))
                         ],),
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
                                  Text( formatDate(DateTime.parse(servico["dataCriado"].toDate().toString()),[dd,'/',mm ,'/', yy])),
                                  Text('Foi solicitado orçamento para o serviço')
                             ],
                           ) ,
                             ),  
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
                                  Text('Fotos do Serviço: ',style: TextStyle( fontWeight: FontWeight.bold),),
                             ],
                           ) ,
                             ),  
                             Padding(
                               padding: EdgeInsets.only(top:10),
                               child:(servico['fotos'].length > 0) ? SizedBox(
                                height: 150.0,
                                width: MediaQuery.of(context).size.width,                               
                                child: Carousel(
                                  autoplay: false,
                                  dotBgColor: Colors.transparent,
                                  images: [...servico['fotos'].map((foto){
                                    return   CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: foto,
                                            placeholder: (context, url) => Center(
                                                child: CircularProgressIndicator()
                                            ),
                                            errorWidget: (context, url, error) => new Icon(Icons.error),
                                          );
                                  })                                  ,
                                   
                                  ],
                                )
                              ) : Padding(padding: EdgeInsets.all(0)) ,
                               )
                          ,
                          Text("Descrição: ", style: TextStyle( fontWeight: FontWeight.bold),),
                          Text((servico['descricaoServico'] != null)  ? servico['descricaoServico'] : 'Sem Descrição'),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top:30) ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(right:5) ,
                                    child:Text("Informe  o \n Custo" ,overflow: TextOverflow.fade, style: TextStyle( fontWeight: FontWeight.bold),) ,
                                    )
                                    ,
                                     Container(
                                      height: 35,
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      decoration: BoxDecoration(
                                        border: Border.all(width:1,color:Colors.black)
                                      ),
                                      child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: custoServico,
                                      onChanged: (s){

                                      },
                                      decoration: InputDecoration(
                                       
                                        focusedBorder:InputBorder.none,
                                        border: InputBorder.none

                                      ),
                                    ),
                                    ),
                                    RaisedButton(
                                      color: Theme.of(context).primaryColor,
                                      onPressed: (){
                                      print("ENVIAR ORÇAMENT");
                                    },
                                    child: Text("Enviar" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),),
                                    )
                                  ],
                                )
                               
                                ,
                                Align(
                                  alignment: Alignment.centerRight,  
                                  child: Padding(
                                  padding: EdgeInsets.only(top:10),
                                  child: ButtonTheme(
                                  minWidth: MediaQuery.of(context).size.width * 0.59,
                                  child:RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  onPressed: ()async{
                                    print("FAZER CONTATO");
                                    bool conseguiuCriarOuAcharChat = await usuarioProvider.procurarCriarChat(servico.documentID, servico['idCliente']);
                                    if(conseguiuCriarOuAcharChat){
                                      Navigator.of(context).pushNamed('/Chat');
                                    }
                                  },
                                  child: Text("Fazer Contato" ,style: TextStyle(color:Colors.white , fontWeight: FontWeight.bold),),
                                  ) ,
                                ),
                                  ) ,
                                )
                               
                                
                                
                              ],
                            ),
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