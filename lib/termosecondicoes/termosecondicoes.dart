import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermoseCondicoes extends StatefulWidget {
  TermoseCondicoes({Key key}) : super(key: key);

  @override
  _TermoseCondicoesState createState() => _TermoseCondicoesState();
}

class _TermoseCondicoesState extends State<TermoseCondicoes> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String urlTermoseCondicoes = "https://www.spotify.com/br/legal/end-user-agreement";
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Easy Obras",style: TextStyle(color: Colors.black),),

       ),
       body:Builder(
         builder: (BuildContext context){
           return Padding(
             padding: EdgeInsets.all(15),
             child:WebView(
               initialUrl: urlTermoseCondicoes,
               javascriptMode: JavascriptMode.unrestricted,),
           )
           ;
         },
       ) ,
    );
  }
}