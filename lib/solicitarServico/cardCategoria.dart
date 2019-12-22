import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardCategoria extends StatelessWidget {
  CardCategoria(this.nome,this.imagem) ;
  final String nome;
  final String imagem;
  TextStyle titulo = TextStyle(fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    return Card(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: <Widget>[
                                   CachedNetworkImage(
                                     height: 100,
                                     width: 100,
                                     fit: BoxFit.contain,
                                     imageUrl:this.imagem ,
                                     placeholder: (context,url)=>SizedBox(width: 50,height: 50,child: CircularProgressIndicator(),),
                                     errorWidget: (context,url,error)=>Icon(Icons.error),
                                     ),
                                     Text(this.nome,style:titulo)
                                     ],
                               ),
                             );
  }
}