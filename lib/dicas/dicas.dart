import 'package:flutter/material.dart';
import 'package:flutter_scaffold/dicas/cardDica.dart';
import 'package:flutter_scaffold/provider/dicasProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_scaffold/models/dicaModel.dart';

class Dicas extends StatefulWidget {
  Dicas({Key key}) : super(key: key);

  @override
  _DicasState createState() => _DicasState();
}

class _DicasState extends State<Dicas> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  List<DicaModel> dicas = [];
  bool carregandoDicas = false;
  final List<int> orcamentos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  final Map<String,String> dica = {
    "imagem":"https://i.ytimg.com/vi/2TPHbSe0yvE/maxresdefault.jpg",
    "titulo":"Titulo da dica",
    "descricao":"Existem muitas variações disponíveis de passagens de Lorem Ipsum, mas a maioria sofreu algum tipo de alteração, seja por inserção de passagens com humor, ou palavras aleatórias que não parecem nem um pouco convincentes. Se você pretende usar uma passagem de Lorem Ipsum, precisa ter certeza de que não há algo embaraçoso escrito escondido no meio do texto. Todos os geradores de Lorem Ipsum na internet tendem a repetir pedaços predefinidos conforme necessário, fazendo deste o primeiro gerador de Lorem Ipsum autêntico da internet. Ele usa um dicionário com mais de 200 palavras em Latim combinado com um punhado de modelos de estrutura de frases para gerar um Lorem Ipsum com aparência razoável, livre de repetições, inserções de humor, palavras não características, etc"
  };
  void carregarDicas()async {
    setState(() {
      carregandoDicas = true;
    });
    dicas = await  Provider.of<DicasProvider>(context , listen: false).getDicas();
    setState(() {
      carregandoDicas = false;
    });
   
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDicas();

  }
  @override
Widget build(BuildContext context) {
    return Builder(
         builder: (BuildContext context){
           return Column(
             children: <Widget>[
               (carregandoDicas) ? Center(child:Padding(padding:EdgeInsets.only(top:10) , child: SizedBox(height:50,width:50 , child: CircularProgressIndicator(),))  ) : Padding(padding: EdgeInsets.all(0)),
               ...dicas.map<Widget>((dica){
                 return InkWell(
                   onTap: (){
                     print("Função para navegar para a dica");                     
                     Navigator.of(context).pushNamed('/Dica',arguments:{"_id":dica.titulo, 'imagem':dica.capa,'titulo':dica.titulo,'descricao':dica.conteudo});
                   },
                   child:CardDica((dica.capa == '') ?"https://i.ytimg.com/vi/2TPHbSe0yvE/maxresdefault.jpg" : dica.capa,(dica.titulo == '') ? "Titulo da noticia" : dica.titulo,dica.titulo) ,
                 );
                 
               }).toList()
             ],
           );
             
             
             
           
         },
       
    );
  }
}