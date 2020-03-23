import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_scaffold/models/dicaModel.dart';

class DicasProvider extends ChangeNotifier{
  DicasProvider();
  String urlDicas = 'https://easyobra.com.br/wp-json/wp/v2/posts';
  
  DicaModel criarDica(dynamic html){
    var document = parse(html['content']['rendered']);
    String titulo = html['title']['rendered'];
    String conteudo = parse(document.body.text).documentElement.text;
    String caminhoImagem = '';
    try {
      var imgElement = document.getElementsByTagName('img');
        caminhoImagem = imgElement[0].attributes['src'];
  
    } catch (e) {
      print("ERRO NA EM PEGAR IMAGME $e");
    }
    DicaModel nvDica = DicaModel(capa: caminhoImagem,titulo: titulo,conteudo: conteudo);
    print("NOVA DICA FEITA $nvDica");

    return nvDica;
  }

  Future<List<DicaModel>> getDicas()async{
   var dio = Dio();
   dio.transformer = FlutterTransformer();
  return dio.get(urlDicas, options: Options(responseType: ResponseType.json)).then((response) async{
     try {      
       print("respota ${response.data}") ;
       List<DicaModel> dicas = [];
       response.data.forEach((html){
         dicas.add( criarDica(html));
       });      
       print("qtd de dicas ${dicas.length} ");
       return dicas;
     } catch (e) {
       print("ERRO NO GETDICAS $e" );
       return [];
     }
   });

  }
}