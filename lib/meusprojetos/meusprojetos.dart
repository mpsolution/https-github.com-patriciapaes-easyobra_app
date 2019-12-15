import 'package:flutter/material.dart';
import 'package:flutter_scaffold/componentes/botao.dart';
import 'package:flutter_scaffold/meusprojetos/carddocumento.dart';

class MeusProjetos extends StatefulWidget {
  MeusProjetos({Key key}) : super(key: key);

  @override
  _MeusProjetosState createState() => _MeusProjetosState();
}

class _MeusProjetosState extends State<MeusProjetos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String imagemBase =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> cartoes = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];
  final Map<String, String> cartao = {
    "nome": "Banheiro Novo",
    "numero": "**** **** **** 2630",
    "imagem":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          "Meus Projetos",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
              child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(4),
                    children: <Widget>[
                      ...cartoes
                          .map<Widget>(
                            (c) => CardDocumento(cartao["nome"], c,),
                          )
                          .toList()
                    ]),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      print("Função de adicionar um novo botão");
                      Navigator.pushNamed(context, '/AdicionarCartao');
                    },
                    child: Botao(Colors.grey, "Adicionar Novo Documento"),
                  )),
              Padding(
                padding: EdgeInsets.all(2),
              )
            ],
          ));
        },
      ),
    );
  }
}
