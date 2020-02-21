import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/ajudaProvider.dart';
import 'package:provider/provider.dart';

class PedirAjuda extends StatefulWidget {
  PedirAjuda({Key key}) : super(key: key);

  @override
  _PedirAjudaState createState() => _PedirAjudaState();
}

class _PedirAjudaState extends State<PedirAjuda> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> opcoesAjuda = ["Profissional não iniciou o serviço","Profissional não conclui o serviço","Outros"];
  String detalhes;
  int opcaoselecionada = -1;
  List<DocumentSnapshot> opcoes = [];
  bool carregandoOpcaoAjuda = false;
  DocumentSnapshot opcaoSelecionadaDados;
  bool salvandoAjuda = false;

  Future<void> carregarOpcoesAjuda() async {
    setState(() {
      carregandoOpcaoAjuda = true;
    });
    print("FUNÇÃO DE CARREGAMENTO DE OPCOES AJUDA PROFISSIONAL");
    try {
      QuerySnapshot snapshot = await Firestore.instance.collection('opcoesAjudaClienteProfissional')
                                                     .getDocuments();
                  opcoes   = snapshot.documents;
                  setState(() {
                    opcoes = opcoes;
                    carregandoOpcaoAjuda = false;
                  });
    } catch (e) {
      print("ERRO NO CARREGAMENTO $e");
      setState(() {
        carregandoOpcaoAjuda = false;
      });

    }
    


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarOpcoesAjuda();
  }
   @override
  Widget build(BuildContext context) {
    final ajudaProvider = Provider.of<AjudaProviderState>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);

    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).pop(),
         ),
         title: Text("Pedir Ajuda",style: TextStyle(color: Colors.black),),
         centerTitle: true,

       ),
       body:Builder(
         builder: (BuildContext context){
            return Padding(
              padding:EdgeInsets.all(10),
              child:Align(
                alignment: Alignment.topCenter,
                child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.max,
               children: <Widget>[
                  if(salvandoAjuda) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),
                 Text("Como podemos te ajudar?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),                 
                 Container(
                   width: MediaQuery.of(context).size.width * 0.8,
                   height: MediaQuery.of(context).size.height * 0.2,
                   decoration: BoxDecoration(
                     border: Border.all(width: 1,color: Colors.black)
                   ),
                   child:(!carregandoOpcaoAjuda) ? ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:opcoes.length,                    
                                      shrinkWrap: true,
                                      itemBuilder: (context,i){
                                        DocumentSnapshot opcao = opcoes[i];
                                        return AnimatedContainer(
                                            duration: Duration(milliseconds: 500),
                                            color: (i == opcaoselecionada) ? Colors.blue[200] : Colors.white,
                                            child:Padding(
                                              padding: EdgeInsets.all(5),
                                              child: InkWell(
                                              onTap: (){
                                                setState(() {
                                                  opcaoselecionada = i;
                                                  opcaoSelecionadaDados = opcao;
                                                });
                                              },
                                              child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text((opcao['nome'] != null) ? opcao['nome'] : ''),
                                            ),
                                            ),
                                            )
                                            
                                            ,
                                        );
                                      },
                                    ) : Center(
                                      child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                   
                    ,
                 ),
                 Padding(padding: EdgeInsets.only(top: 10),),
                 Text("Nos Informe mais detalhes:",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize:18)),
                 Container(
                   width: MediaQuery.of(context).size.width * 0.8,
                   height: MediaQuery.of(context).size.height * 0.2,
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     border: Border.all(width: 1,color: Colors.black)
                   ),
                   child: Align(
                     alignment: Alignment.topLeft,
                     child: TextField(
                       expands: true,
                       maxLines: null,
                       minLines: null,
                       decoration: InputDecoration(focusedBorder: InputBorder.none ,border: InputBorder.none),
                       onChanged: (s){
                         setState(() {
                           detalhes = s;
                         });
                       },
                     ),

                   ),
                 ),
                 SizedBox(
                   width: MediaQuery.of(context).size.width * 0.6,
                   height: 30,
                   child: RaisedButton(
                     onPressed: ()async{
                       bool salvo = false;
                       print("ATIVAR FUNÇÃO ENVIAR AJUDA");
                       setState(() {
                         salvandoAjuda = true;
                       });
                       if(opcaoselecionada != -1){
                         salvo = await   ajudaProvider.criarAjuda({
                         "detalhes":detalhes,
                          "tipo":(opcaoSelecionadaDados == null) ?{"erro":"erro"} : {...opcaoSelecionadaDados.data,"id":opcaoSelecionadaDados.documentID},
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
                 )
                 
               ],
             ),
              ),
            );
         }
       ) ,
    );
  }
}