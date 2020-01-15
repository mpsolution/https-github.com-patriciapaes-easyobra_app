import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardCartao extends StatefulWidget {
  CardCartao(this.nome,
                    this.numerocartao,
                    this.imagemcartao,
                    this.index,
                    this.listaCartoes
                  );
   String nome;
   String numerocartao;
   String imagemcartao;
   int    index;
   List<dynamic> listaCartoes;

  @override
  _CardCartaoState createState() => _CardCartaoState();
}

class _CardCartaoState extends State<CardCartao> {
  
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
                                        child:CachedNetworkImage(
                                        height: 100,
                                        width: 150,
                                        fit:BoxFit.contain,
                                        imageUrl: widget.imagemcartao,
                                        placeholder: (context,url)=>Center(child: SizedBox(width: 50,height: 50,child: CircularProgressIndicator(),),),
                                        errorWidget: (context,url,error)=>Center(child: Icon(Icons.error),)
                                        
                                      ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(widget.nome,style:TextStyle(fontWeight: FontWeight.bold)),
                                          Padding(padding: EdgeInsets.all(4),),
                                          Text(widget.numerocartao,style:TextStyle(fontWeight: FontWeight.bold,fontSize:12))
                                        ],
                                      ),
                                      //Botoes
                                      (this.widget.index == -1)  ? Align(
                                        alignment: Alignment.centerLeft,
                                        child:Text(""),
                                      ) :
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child:Icon(Icons.delete_forever,color:Colors.black),
                                      )
                                         ,
                                      Padding(padding: EdgeInsets.all(1),)
                                      
                                      

                                    ],
                                  ),
                                ) ,
                                );
  }
}