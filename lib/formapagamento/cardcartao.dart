import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCartao extends StatelessWidget {
  const CardCartao(this.nome,
                    this.numerocartao,
                    this.imagemcartao
                  );
  final String nome;
  final String numerocartao;
  final String imagemcartao;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child:Card(               
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,                 
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Center(
                                        child:CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(imagemcartao),
                                      ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(nome,style:TextStyle(fontWeight: FontWeight.bold)),
                                          Padding(padding: EdgeInsets.all(4),),
                                          Text(numerocartao,style:TextStyle(fontWeight: FontWeight.bold,fontSize:12))
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