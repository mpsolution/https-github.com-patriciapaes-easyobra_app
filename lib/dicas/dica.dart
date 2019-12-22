import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Dica extends StatefulWidget {
  Dica({Key key}) : super(key: key);

  @override
  _DicaState createState() => _DicaState();
}

class _DicaState extends State<Dica> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
 
  @override
  Widget build(BuildContext context) {
    final Map<String,String> dica = ModalRoute.of(context).settings.arguments;
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading: new IconButton(
           icon: Icon(Icons.arrow_back,color:Colors.black),
           onPressed: ()=>Navigator.of(context).maybePop(),
         ),
         title: Text("Dica",style:TextStyle(color: Colors.black)),
       ),
       body: Builder(
         builder: (BuildContext context){
           return SingleChildScrollView(
             child: Column(
               children:<Widget>[
               Padding(
                 padding:EdgeInsets.all(4) ,
                 child:SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Hero(
                    tag: dica["_id"],
                    child:CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: dica["imagem"],
                    placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),
                  ) ,
                  )                  
                  ,
                ),
               ), 
                          
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(dica["titulo"],style: TextStyle(fontWeight: FontWeight.bold),),
                  )                  
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(dica["descricao"],style: TextStyle(fontWeight: FontWeight.bold),),
                  )                  
                )
                ]
             ),
           );
         },
       ),
    );
  }
}