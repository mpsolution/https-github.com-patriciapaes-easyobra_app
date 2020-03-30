import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Galeria extends StatelessWidget {
  const Galeria({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> fotos = ModalRoute.of(context).settings.arguments;    
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
        children:List.generate((fotos != null ) ? fotos.length : 0, (index) =>      CachedNetworkImage(
                          fit: BoxFit.cover,
                          placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                          imageUrl: fotos[index]
                          )
        )
        ),
    );
  }
}