import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Galeria extends StatelessWidget {
  const Galeria({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Fotos",style: TextStyle(color: Colors.black),),
       ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        children:List.generate(10, (index) =>      CachedNetworkImage(
                          fit: BoxFit.cover,
                          placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          imageUrl: 'https://s3.amazonaws.com/mapa-da-obra-producao/wp-content/uploads/2018/06/5-equipamentos-de-obras-que-vao-aumentar-a-produtividade-da-sua-equipe.jpg'
                          )
        )
        ),
    );
  }
}