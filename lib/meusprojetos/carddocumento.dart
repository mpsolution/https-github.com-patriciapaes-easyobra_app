import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDocumento extends StatelessWidget {
  const CardDocumento(
    this.nome,
    this.qtd,
  );
  final String nome;
  final int qtd;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
                child: Icon(
              Icons.folder,
              color: Colors.yellow,
              size: 30,
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(nome, style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.all(2),
                ),
                Text(
                    (qtd == 1)
                        ? (qtd.toString() + "  Documento atualmente")
                        : (qtd.toString() + "  Documentos Atualmente"),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(1),
            )
          ],
        ),
      ),
    );
  }
}
