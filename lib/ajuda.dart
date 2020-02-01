import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/ajudaProvider.dart';
import 'package:provider/provider.dart';

class Ajuda extends StatefulWidget {
  Ajuda({Key key}) : super(key: key);

  @override
  _AjudaState createState() => _AjudaState();
}

class _AjudaState extends State<Ajuda> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();  
  String detalhes;
  int opcaoselecionada = -1;
  bool salvandoAjuda = false;
  DocumentSnapshot op;

  
  @override
Widget build(BuildContext context) {
    final ajudaProvider = Provider.of<AjudaProviderState>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);

    return Builder(
         builder: (BuildContext context){
           return Padding(padding: EdgeInsets.all(15),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                   if(salvandoAjuda) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),
                 Padding(
                   padding: EdgeInsets.only(bottom:5,top: 5),
                   child:Text("Vamos Tratar Sobre",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),) ,
                 )  ,
               
                 Container(
                   width: MediaQuery.of(context).size.width * 0.6,
                   height: MediaQuery.of(context).size.height * 0.3,
                   decoration: BoxDecoration(
                     border: Border.all(width: 1,color: Colors.black)
                   ),
                   child:StreamBuilder(
                     stream: ajudaProvider.opcoesAjuda(),
                     builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                                    if(snapshot.hasError) Text("Error: ${snapshot.error}");
                                    switch(snapshot.connectionState){
                                      case ConnectionState.waiting : return new Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),));
                                      default:return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:snapshot.data.documents.length,
                                      itemBuilder: (context,i){
                                        DocumentSnapshot opcao = snapshot.data.documents[i];
                                        return AnimatedContainer(
                                            duration: Duration(milliseconds: 500),
                                            color: (i == opcaoselecionada) ? Colors.blue[200] : Colors.white,
                                            child:Padding(
                                              padding: EdgeInsets.all(5),
                                              child: InkWell(
                                              onTap: (){
                                                setState(() {
                                                  opcaoselecionada = i;
                                                  op = opcao;
                                                });
                                              },
                                              child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(opcao['nome']),
                                            ),
                                            ),
                                            )
                                            
                                            ,
                                        );
                                      },
                                    );


                                    }

                     } ,
                   )
                   
                    ,
                 ),
                 Padding(padding: EdgeInsets.only(top: 10),),
                 Align(alignment: Alignment.center,child:Text("Nos Informe mais detalhes",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize:18)) ,)
                 ,
                 Align(
                   alignment: Alignment.center,
                   child: Container(
                   width: MediaQuery.of(context).size.width * 0.92,
                   height: MediaQuery.of(context).size.height * 0.3,
                   decoration: BoxDecoration(
                     border: Border.all(width: 1,color: Colors.black)
                   ),
                   child: Align(
                     alignment: Alignment.topLeft,
                     child: TextField(
                       
                       decoration: InputDecoration(focusedBorder: InputBorder.none,disabledBorder: InputBorder.none,border: InputBorder.none),
                       onChanged: (s){
                         detalhes = s;
                        
                       },
                     ),

                   ),
                 ),
                 )
                 ,
                 Padding(padding: EdgeInsets.only(top: 10),),
                 Align(
                   alignment: Alignment.bottomCenter,
                   child:SizedBox(
                   width: MediaQuery.of(context).size.width *0.92,
                   child: RaisedButton(
                     onPressed: () async {
                       bool salvo = false;
                       print("ATIVAR FUNÇÃO ENVIAR AJUDA");
                       setState(() {
                         salvandoAjuda = true;
                       });
                       if(opcaoselecionada != -1){
                      
                       salvo = await   ajudaProvider.criarAjuda({
                         "detalhes":detalhes,
                          "tipo":(op == null) ?{"erro":"erro"} : {...op.data,"id":op.documentID},
                          "idCliente":(firebaseUser != null)? firebaseUser.uid : "123456"
                        });}
                        setState(() {
                          salvandoAjuda = false;
                        });
                        if(salvo){
                          ajudaProvider.alertaSalvo(context);
                        }else{
                          ajudaProvider.alertaErro(context);
                        }
                      
                     },

                     color: Theme.of(context).primaryColor,
                     child: Text("Enviar",style:TextStyle(color: Colors.white,fontWeight:FontWeight.bold)),
                   ),
                 ) ,
                 )
                 
                 
               ],
             ) ,
           )
              ;
             
             
             
           
         },
       
    );
  }
}