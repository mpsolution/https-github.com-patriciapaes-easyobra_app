import 'package:flutter/material.dart';
import 'package:flutter_scaffold/dicas/cardDica.dart';

class Dicas extends StatefulWidget {
  Dicas({Key key}) : super(key: key);

  @override
  _DicasState createState() => _DicasState();
}

class _DicasState extends State<Dicas> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> orcamentos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  final Map<String,String> dica = {
    "imagem":"https://i.ytimg.com/vi/2TPHbSe0yvE/maxresdefault.jpg",
    "titulo":"Titulo da dica",
    "descricao":"Existem muitas variações disponíveis de passagens de Lorem Ipsum, mas a maioria sofreu algum tipo de alteração, seja por inserção de passagens com humor, ou palavras aleatórias que não parecem nem um pouco convincentes. Se você pretende usar uma passagem de Lorem Ipsum, precisa ter certeza de que não há algo embaraçoso escrito escondido no meio do texto. Todos os geradores de Lorem Ipsum na internet tendem a repetir pedaços predefinidos conforme necessário, fazendo deste o primeiro gerador de Lorem Ipsum autêntico da internet. Ele usa um dicionário com mais de 200 palavras em Latim combinado com um punhado de modelos de estrutura de frases para gerar um Lorem Ipsum com aparência razoável, livre de repetições, inserções de humor, palavras não características, etc"
  };
  @override
Widget build(BuildContext context) {
    return Builder(
         builder: (BuildContext context){
           return Column(
             children: <Widget>[
               ...orcamentos.map<Widget>((item){
                 return InkWell(
                   onTap: (){
                     print("Função para navegar para a dica");
                     Navigator.of(context).pushNamed('/Dica',arguments:{"_id":item.toString(), ...dica});
                   },
                   child:CardDica("https://i.ytimg.com/vi/2TPHbSe0yvE/maxresdefault.jpg", "Titulo da noticia",item.toString()) ,
                 );
                 
               }).toList()
             ],
           );
             
             
             
           
         },
       
    );
  }
}