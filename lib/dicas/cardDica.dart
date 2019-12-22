import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardDica extends StatelessWidget {
  const CardDica(
    this.imagem,
    this.titulo,
    this._id
  );
  final String imagem;
  final String titulo;
  final String _id;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.95,
            child:Hero(
              tag: this._id,
              child:CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: this.imagem,
              placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),
            ) ,
            ) ,
          ),
           Padding(
            padding: EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(this.titulo,style: TextStyle(fontWeight: FontWeight.bold)),
            )
            
          )
          
        ],
      )
      ,
    );
  }
}