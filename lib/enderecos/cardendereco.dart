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
                                  width: double.infinity,
                                  height: 60,
                                  child:Card(               
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,                 
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Center(
                                        child:Icon(Icons.location_on,color: enderecoEntrega? Colors.green : Colors.black,),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text(nome,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                          Padding(padding: EdgeInsets.all(4),),
                                          Text(endereco,style:TextStyle(fontWeight: FontWeight.bold,fontSize:12))
                                        ],
                                      ),
                                      //Botoes
                                      
                                        Align(
                                        alignment: Alignment.centerLeft,
                                        child:Icon(Icons.delete_forever,color:Colors.black),
                                      ) ,
                                      Padding(padding: EdgeInsets.all(1),)
                                      
                                      

                                    ],
                                  ),
                                ) ,
                                );
  }
}