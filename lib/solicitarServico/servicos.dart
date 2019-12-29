import 'package:flutter/material.dart';
class Servicos extends StatefulWidget {
  Servicos({Key key}) : super(key: key);

  @override
  _ServicosState createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextStyle titulo = TextStyle(fontWeight: FontWeight.bold);  
  String _busca;
   @override
  Widget build(BuildContext context) {
    List<String> servicos = ModalRoute.of(context).settings.arguments;
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text(servicos[0],style: TextStyle(color: Colors.black),),

       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             child:ListView.builder(
               itemCount: servicos.length,
               itemBuilder: (context,i){
                 if(i > 0) return Container(
                   child: Padding(
                     padding: EdgeInsets.all(5),
                     child:Text(servicos[i]) ,
                   )
                   ,
                   decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(
                       color: Colors.black,
                       width: 1
                     ))
                   ),
                 );
                 return Text("");
                 },
             )
             );
         },
       ) ,
    );
  }
}