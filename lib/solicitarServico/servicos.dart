import 'package:basic_utils/basic_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Servicos extends StatefulWidget {
  Servicos({Key key}) : super(key: key);

  @override
  _ServicosState createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextStyle titulo = TextStyle(fontWeight: FontWeight.bold);  
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

             child:StreamBuilder<DocumentSnapshot>(
               stream: Firestore.instance.document('tiposservico/${servicos[1]}').snapshots(),
               builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                        if(snapshot.hasError) Text("Error: ${snapshot.error}");
                        switch (snapshot.connectionState) {
                            case ConnectionState.waiting: return Center(child: SizedBox(height: 50,width: 50,child:CircularProgressIndicator() ,),) ;
                            default:{
                              print("RESULTADO " + snapshot.data["opcoes"].toString());
                              List<dynamic> opcoes = snapshot.data["opcoes"];
                              return new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Center(child: Text("Escolha o Tipo de Serviço:",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                                        ) ,    
                                        Flexible(
                                        child: ListView.builder(
                                          itemCount: opcoes.length,
                                          itemBuilder: (context,i){
                                             return InkWell(
                                               onTap: (){
                                                 print("SERVICO ESCOLHIDA ${opcoes[i]}");
                                                 Navigator.of(context).pushNamed('/CriarServico',arguments:opcoes[i]);
                                               },
                                               child: Container(
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child:Text(StringUtils.capitalize(opcoes[i])) ,
                                              )
                                              ,
                                              decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 1
                                                ))
                                              ),
                                            ),
                                             )
                                             ;
                                            
                                            },
                                        ) ,
                                        )                                    
                                       
                                ],
                              );
                              
                            }

                        }
               } ,
             )
             
             );
         },
       ) ,
    );
  }
}