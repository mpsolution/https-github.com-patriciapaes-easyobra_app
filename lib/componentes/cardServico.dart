import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/historicoProvider.dart';
import 'package:provider/provider.dart';

class CardServico extends StatelessWidget {
  const CardServico(
    this.servico,
    this.mini
  );

  final DocumentSnapshot servico;
  final bool mini;

  @override
  Widget build(BuildContext context) {
    String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
    final historicoProvider = Provider.of<HistoricoProvider>(context);
    return SizedBox(
               width: double.infinity,
               height: 150,
               child:Card(               
               child: Row(
                 children: <Widget>[
                  (mini) ?  Center(
                     child:CircleAvatar(
                     radius: 50,
                     backgroundColor: Colors.transparent,
                     backgroundImage: NetworkImage(imagemBase),
                   ),
                   ) : Padding(padding: EdgeInsets.all(0),),
                   Padding(padding: EdgeInsets.all(8),),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     mainAxisSize: MainAxisSize.max,
                     children: <Widget>[
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                              Text(servico["tituloServico"],style:TextStyle(fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.all(8)),
                              Column(
                                children: <Widget>[
                                      Icon(Icons.check,color: Colors.green,),
                                      Text("Concluido",style:TextStyle(fontSize:7,color:Colors.green,fontWeight: FontWeight.bold))
                                ],
                              )
                             

                         ],
                       ),
                      
                       Text(servico["descricaoServico"]),
                       Expanded(
                         child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisSize: MainAxisSize.max,
                         children: <Widget>[
                                    Text(formatDate(DateTime.parse(servico["dataCriado"].toDate().toString()),[dd,'/',mm ,'/', yy] )),
                                    Padding(padding: EdgeInsets.all(8),),
                                    Text("R\$${servico['valorServico']}",style:TextStyle(fontWeight: FontWeight.bold))
                         ],
                       ),
                       )
                       ,                       
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         mainAxisSize: MainAxisSize.max,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                              ButtonTheme(
                                minWidth: 120,
                                height: 30,
                                shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                  ) ,
                                
                                child: RaisedButton(
                                  color:Theme.of(context).buttonColor ,
                                  onPressed: (){
                                    print("FUNÇÃO VER MAIS HISTORICO");
                                    historicoProvider.setHistorico({
                                      "idPrestador":servico['idPrestador'],
                                      "tituloServico":servico['tituloServico'],
                                      "historico":servico['historico']
                                    });
                                    Navigator.of(context).pushNamed('/HistoricoServico');
                                    
                                  },
                                  child: Text("Ver Mais",style:TextStyle(color: Theme.of(context).textSelectionColor)),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 5),),
                              ButtonTheme(
                                minWidth: 120,
                                height: 30,                                
                                shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.black,width: 1)
                                  ) ,
                                
                                child: RaisedButton(
                                  color:Theme.of(context).textSelectionColor ,
                                  onPressed: (){
                                    print("FUNÇÃO VER MAIS HISTORICO");
                                    Navigator.of(context).pushNamed('/PedirAjuda');
                                  },
                                  child: Text("Pedir Ajuda",style:TextStyle(color: Theme.of(context).buttonColor)),
                                ),
                              ),
                             
                         ],
                       )
                      
                     ],
                   ),                   
                   

                 ],
               ),
             ) ,
             );
  }
}