import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao(
    this.cor,
    this.nome
  );
  final Color cor;
  final String nome;
  @override
  Widget build(BuildContext context) {
    return Align(
               alignment: Alignment.bottomCenter,
               child: RaisedButton(    
                           onPressed: (){},
                           color: cor,                            
                           child: Text(nome,style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)
                           ),
                         ),
             );
  }
}