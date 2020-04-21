import 'package:flutter/material.dart';



class SalvarProjetoAction extends StatefulWidget {
  final bool carregando;
  SalvarProjetoAction({Key key , this.carregando}) : super(key: key);

  @override
  _SalvarProjetoActionState createState() => _SalvarProjetoActionState();
}

class _SalvarProjetoActionState extends State<SalvarProjetoAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: this.widget.carregando ?  CircularProgressIndicator() : Text("Salvar") ,
    );
  }
}