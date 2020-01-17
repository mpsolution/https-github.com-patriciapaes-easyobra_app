import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardEndereco extends StatelessWidget {
  const CardEndereco(this.nome,
                    this.endereco,
                    this.enderecoEntrega                   
                  );
  final String nome;
  final String endereco; 
  final bool   enderecoEntrega;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: 90,
                                  child:Card(               
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,                 
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.1,
                                        
                                        child:   Center(
                                        child:Icon(Icons.location_on,color: enderecoEntrega? Colors.green : Colors.black,size: 30,),
                                      ),
                                      ),
                                    
                                      Flexible(
                                        child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text(nome,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                          Padding(padding: EdgeInsets.all(4),),
                                          Expanded(
                                            child:   Text(endereco,
                                                textAlign: TextAlign.justify,
                                                maxLines: 3,
                                               overflow: TextOverflow.clip ,style:TextStyle(fontWeight: FontWeight.bold,fontSize:12)),
                                          )
                                        
                                        ],
                                      ),
                                      )
                                      ,
                                      //Botoes
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.1,
                                          child: Align(
                                        alignment: Alignment.center,
                                        child:Icon(Icons.delete_forever,color:Colors.black , size: 30,),
                                      )  ,
                                        )
                                       ,
                                      Padding(padding: EdgeInsets.all(1),)
                                      
                                      

                                    ],
                                  ),
                                ) ,
                                );
  }
}