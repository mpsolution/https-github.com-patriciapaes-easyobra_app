import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_scaffold/componentes/cardServico.dart';
import 'package:flutter_scaffold/componentes/dialProjeto.dart';
import 'package:flutter_scaffold/provider/projetoProvider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Projeto extends StatefulWidget {
  Projeto({Key key}) : super(key: key);

  @override
  _ProjetoState createState() => _ProjetoState();
}

class _ProjetoState extends State<Projeto> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();  
  final _formNome = GlobalKey<FormState>();
  TextEditingController nomeControler = TextEditingController();
  String nome = '';
  double totalServico = 0;
  double totalDocumentos = 0;
  double totalProjeto = 0;
  List<Widget> tabs = [
          Tab(
               icon: Icon(Ionicons.md_people),
               text: "Serviços",               
             ),
             Tab(
               icon: Icon(Ionicons.ios_images),
               text: "Fotos",
             ),
             Tab(
               icon: Icon(Ionicons.md_document),
               text: "Documentos",
             ),
             Tab(
               icon: Icon(Ionicons.md_cash),
               text: "Gastos",
             ),
  ];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void alterarNomeDialog(BuildContext context){
      final projetoProvider = Provider.of<ProjetoProviderState>(context);
      nomeControler.text = projetoProvider.getNomeProjetoSelecionado;
     showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Editar nome'),
          content: Form(
            key: _formNome,
            child: TextFormField(
              controller: nomeControler,
              onChanged: (s){
                setState(() {
                  nome = s;
                });
              },
              decoration: InputDecoration(
                labelText: 'Escolha um novo Nome'
              ),
              validator: (s){
                if(s.isEmpty){
                  return 'Novo nome não pode ser vazio';
                }
                return null;
              },

            )
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("Cancelar"),
              ),
              FlatButton(
                onPressed: (){
                  print("FUNÇÃO DE MUDAR NOME");
                  if(_formNome.currentState.validate()){                    
                     projetoProvider.alterarNome(nome);
                     Navigator.of(context).pop();
                  }
                }, 
                child: Text('Salvar')
                )

            ],
        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
   final projetoProvider = Provider.of<ProjetoProviderState>(context);
   final firebaseUser = Provider.of<FirebaseUser>(context);
     
  
    return DefaultTabController(
      length: tabs.length,
      child:Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         centerTitle: true,
         leading: IconButton(
           icon: Icon(Icons.arrow_back,color:Colors.black),
           onPressed: ()=>Navigator.of(context).maybePop(),
         ),  
         actions: <Widget>[
           IconButton(
           icon: Icon(Icons.border_color,color:Colors.black),
           onPressed: (){
             print("FUNÇÃO DE EDITAR NOME");
             alterarNomeDialog(context);
           },
         )
         ],       
         title:Text("Projeto: ${projetoProvider.getNomeProjetoSelecionado}",style: TextStyle(color: Colors.black),),
         backgroundColor: Colors.white,
         bottom: TabBar(
           indicatorColor: Theme.of(context).primaryColor,
           labelColor: Colors.black,
           tabs: <Widget>[
             ...tabs
           ],
         ),
       ),
       floatingActionButton:DialProjeto() ,
       body: TabBarView(
         children: <Widget>[
           Container(
             child: Padding(
               padding: EdgeInsets.all(2),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   Expanded(
                     child:  StreamBuilder(
                       stream:projetoProvider.getServicosDoProjeto(),
                       builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                         if(snapshot.hasError) Text("Error: ${snapshot.error}");
                         switch(snapshot.connectionState){
                           case ConnectionState.waiting : return new Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),));
                           default:return ListView.builder(
                                      itemCount: snapshot.data.documents.length,
                                      itemBuilder: (context,int index){
                                        return Stack(
                                          children: <Widget>[
                                              CardServico(snapshot.data.documents[index],true),
                                              Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child:FloatingActionButton(
                                                  elevation: 5,
                                                  mini: true,
                                                  onPressed: (){
                                                    print("Remover servico do projeto");
                                                    projetoProvider.removerServicoProjeto(context, snapshot.data.documents[index]);
                                                  },
                                                  child: Icon(Icons.close,color: Colors.white,),
                                                  backgroundColor: Colors.red,
                                                ) ,
                                                )
                                          ],
                                        );
                                      },
                                    );

                         }
                         
                       },
                     )
                     
                    ,
                   )
                 ],
               ),
             ),
           ),
           GridView.builder(
             itemCount: (projetoProvider.projetoSelecionado['fotos'] != null) ? projetoProvider.projetoSelecionado['fotos'].length : 0,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
             padding: EdgeInsets.all(5),             
             itemBuilder: (BuildContext context,int index){              
               dynamic foto = projetoProvider.projetoSelecionado['fotos'][index];
               return Padding(padding: EdgeInsets.all(1),
               child:Column(
                 children: <Widget>[
                 SizedBox(
                   height:100,
                   width:150,
                   child:CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:foto,
                  placeholder: (context,url) =>Center(
                    child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),),
                  ),
                  errorWidget: (context,url,error) => Icon(Icons.error),
                )
                 )    ,
                Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       RaisedButton(
                         child: Text('Ver',style: TextStyle(color: Colors.white),),
                         color: Colors.blue,
                         onPressed: (){
                            launch(foto);                        
                         }
                         ),  
                         Padding(padding: EdgeInsets.only(left:2) )                      ,
                          RaisedButton(
                         child: Text('Excluir',style: TextStyle(color: Colors.white),),
                         color: Colors.red,
                         onPressed:( (foto != null)) ? (){
                           bool removido = false;
                           showDialog(
                             context: context,
                             builder: (BuildContext context){
                               return StatefulBuilder(
                                 builder: (context,setState){
                                   return AlertDialog(
                                     title: Text("Excluir?"),
                                     content:Text("Deseja realmente excluir a foto!"),
                                     actions: <Widget>[
                                       FlatButton(onPressed:(removido) ? null : () async {
                                         removido = await  projetoProvider.removerFoto(foto);
                                        setState(() {});
                                        Navigator.of(context).pop();
                                       }, child: (removido) ? CircularProgressIndicator() : Text("Excluir")),
                                         FlatButton(onPressed: ()  {
                                           Navigator.of(context).pop();
                                       }, child: Text("Cancelar")),                                       
                                     ],
                                   );
                                 }
                                 );
                             }
                           );
                          
                         } : null
                         ),
                     ],
                   )

                 ],
               )
               
               ) ;
             },
             ),
              GridView.builder(
             itemCount: (projetoProvider.projetoSelecionado['documentos'] != null) ? projetoProvider.projetoSelecionado['documentos'].length : 0,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
             padding: EdgeInsets.all(5),             
             itemBuilder: (BuildContext context,int index){  
               dynamic documento =  projetoProvider.projetoSelecionado['documentos'][index];           
               return Padding(padding: EdgeInsets.all(2),
               child:Container(
                 decoration: BoxDecoration(
                   border: Border.all(
                     width: 1,
                     color: Colors.black
                   )
                 ),
                 child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   (documento['titulo'] != null) ? Text("Titulo: ${documento['titulo']}") : 'Sem titulo',
                   Icon(Ionicons.md_copy, size: 40,),  
                   (documento['valor'] != null) ? Text("Valor: ${documento['valor']}") : 'Sem Valor',
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       RaisedButton(
                         child: Text('Baixar',style: TextStyle(color: Colors.white),),
                         color: Colors.blue,
                         onPressed: (){
                           if(documento['url'] != null){
                             launch(documento['url']);
                           }
                         }
                         ),
                        
                          RaisedButton(
                         child: Text('Excluir',style: TextStyle(color: Colors.white),),
                         color: Colors.red,
                         onPressed:((documento['url'] != null) && (documento['titulo'] != null) && (documento['valor'] != null)) ? (){
                           bool removido = false;
                           showDialog(
                             context: context,
                             builder: (BuildContext context){
                               return StatefulBuilder(
                                 builder: (context,setState){
                                   return AlertDialog(
                                     title: Text("Excluir?"),
                                     content:Text("Deseja realmente excluir o documento ${documento['titulo']}"),
                                     actions: <Widget>[
                                       FlatButton(onPressed:(removido) ? null : () async {
                                         removido = await  projetoProvider.removerDocumento(documento);
                                        setState(() {});
                                        Navigator.of(context).pop();
                                       }, child: (removido) ? CircularProgressIndicator() : Text("Excluir")),
                                         FlatButton(onPressed: ()  {
                                           Navigator.of(context).pop();
                                       }, child: Text("Cancelar")),
                                       
                                     ],
                                   );
                                 }
                                 );
                             }
                           );
                          
                         } : null
                         ),
                     ],
                   )

                 ],
               ),
               )           
               ) ;
             },
             ),
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Padding(padding: EdgeInsets.only(top:10)),
                (projetoProvider.projetoSelecionado['gastosTotais'] != null) ? Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[  
                     Text("Gasto Total:" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20)),
                     Text("R\$ ${ double.parse(projetoProvider.projetoSelecionado['gastosTotais'].toString()).toStringAsFixed(2) }", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20)),
                   ],
                 ) : Padding(padding: EdgeInsets.all(0)),
                    Padding(padding: EdgeInsets.only(top:10)),
                 (projetoProvider.projetoSelecionado['servicos'] != null)  ?Expanded(
                     child:  StreamBuilder(
                       stream:projetoProvider.getServicosDoProjeto(),
                       builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                         if(snapshot.hasError) Text("Error: ${snapshot.error}");
                         switch(snapshot.connectionState){
                           case ConnectionState.waiting : return new Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator(),));
                           default:return Column(
                             children: <Widget>[
                               Text("Serviços:" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20)),
                               Table(
                                 defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                 children: [...snapshot.data.documents.map<TableRow>((servico)=>
                                  TableRow(
                                    children: [
                                      TableCell(child: Center(child:Text("${servico['tituloServico']}")) ),
                                      TableCell(child: Center(child:Text("R\$ ${double.parse(servico['valorServico'].toString()).toStringAsFixed(2)}") ) ),
                                    ]
                                  )
                                 ).toList(),
                                 TableRow(
                                    children: [
                                      TableCell(child: Center(child:Text("Gastos Servicos:")) ),
                                      TableCell(child: Center(child:Text("R\$ ${double.parse(projetoProvider.projetoSelecionado['gastosServicos'].toString()).toStringAsFixed(2)}") ) ),
                                    ]
                                  )
                                 ],
                               )
                             ],
                             );

                         }
                         
                       },
                     )
                     
                    ,
                   ): Padding(padding:EdgeInsets.all(0)),
                  (projetoProvider.projetoSelecionado['documentos'] != null) ? Expanded(
                    child: Column(
                      children: <Widget>[
                        Text("Documentos:" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20)),
                        Table(
                                 defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                 children: [...projetoProvider.projetoSelecionado['documentos'].map<TableRow>((doc)=>
                                  TableRow(
                                    children: [
                                      TableCell(child: Center(child:Text("${doc['titulo']}")) ),
                                      TableCell(child: Center(child:Text("${doc['valor'].toString()}") ) ),
                                    ]
                                  )
                                 ).toList(),
                                (projetoProvider.projetoSelecionado['gastosDocumentos'] != null) ? TableRow(
                                    children: [
                                      TableCell(child: Center(child:Text("Gasto Documentos")) ),
                                      TableCell(child: Center(child:Text("R\$ ${double.parse(projetoProvider.projetoSelecionado['gastosDocumentos'].toString()).toStringAsFixed(2) }") ) ),
                                    ]
                                  ) : TableRow(
                                    children: [
                                      TableCell(child: Center(child:Text("")) ),
                                      TableCell(child: Center(child:Text("") ) ),
                                    ]
                                  ) 
                                 ],
                               )
                      ],
                    )
                    ) : Padding(padding:EdgeInsets.all(0))

                
               ],
             )

           
         ],
       ),
    ),
    )
     ;
  }
}