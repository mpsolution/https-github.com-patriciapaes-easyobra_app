import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/criacaoServicoProvider.dart';
import 'package:provider/provider.dart';

class PortifolioDoProfissional extends StatefulWidget {
  PortifolioDoProfissional({Key key}) : super(key: key);

  @override
  _PortifolioDoProfissionalState createState() => _PortifolioDoProfissionalState();
}

class _PortifolioDoProfissionalState extends State<PortifolioDoProfissional> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> PortifolioDoProfissional = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  int   rowSelecionada = 0;
  bool criandoServico = false;

 
 
  @override
  Widget build(BuildContext context) {
    final criacaoServicoProvider = Provider.of<CriacaoServicoState>(context);

    
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Portifólio do Profissional",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(            
             child:Column(
               mainAxisSize: MainAxisSize.max,
               children: <Widget>[
              if(criandoServico) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),
               Padding(padding: EdgeInsets.all(4),),
               Align(
               alignment: Alignment.topCenter,
               child:SingleChildScrollView(
               scrollDirection: Axis.vertical,               
               child:Column(                 
                 children: <Widget>[
                    //Card Dados profissional
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child:Column(
                        children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Align(
                      alignment: Alignment.centerLeft,
                      child:Row(
                        children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(imagemBase),
                            ),
                            Padding(padding: EdgeInsets.all(5),),
                            Text("Alfredo Campos",style:TextStyle(fontWeight: FontWeight.bold)) ,
                        ],
                      )
                      
                    ),
                    ),
                    Padding(padding: EdgeInsets.all(4),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.9,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.content_paste,color:Colors.black),
                          Padding(padding: EdgeInsets.all(5),),
                          Text("Gosto do que faço e faço o melhor para os clientes")
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(4),),
                    //Localização
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.9,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.home,color:Colors.black),
                          Padding(padding: EdgeInsets.all(5),),
                          Text("Moro no Rio de Janeiro,Baixada Fluminense."),
                          Padding(padding: EdgeInsets.all(5),),
                         

                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(4),),
                    SizedBox(
                        width: MediaQuery.of(context).size.width *0.9,
                        child:  //tempo no app , qualificação no app , nivel no app
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("3.5 meses"),
                              Text("4.98"),
                              Icon(Icons.star,color:Colors.black),
                              Text("Profissional Nivel:"),
                              Text("Gold"),
                              Icon(Icons.memory)
                            ],
                          ),
                    ),
                        ],
                      ),
                      )
                      
                      
                    ),
                    
                    Padding(padding: EdgeInsets.all(4),),
                    Card(
                      child: Padding(padding: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                      SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,                    
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child:Text("Curiosidades") ,
                          ),
                          Text("Toco Guitarra na mairoia das vezes como hobby")
                        ],
                      ) ,
                      )
                      ),  
                      SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,                    
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child:Text("Outras Experiências") ,
                          ),
                          Text("Estou estudando Designer de Interiores.")
                        ],
                      ) ,
                      )
                      ),
                            ],
                          ),
                      ),
                    ),
                    //Card elogios
                    Card(
                      child: Padding(padding: EdgeInsets.all(5),
                        child: Column(
                          children: <Widget>[
                        SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.9,                    
                                        child: Align(
                                              alignment: Alignment.centerLeft,
                                                child:Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child:Text("Elogios (12)") ,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Padding(padding: EdgeInsets.all(4),),
                                                        Text("Ultimos 5")
                                                      ],
                                                    ),
                                                  ),
                                                  Text("Excelente pintor, com ótimas ideias e muito educado"),
                                                  Text("2 semanas atrás"),
                                                  Text("Excelente profissional e com ótimo papo"),
                                                  Text("3 Semanas atrás"),
                                                  Text("Muito Tranquilo,organizado e deixa tudo limpo."),
                                                  Text("1 mês atrás"),
                                                  Text("O melhor pintor que já trabalhou na minha casa"),
                                                  Text("40 dias atrás"),
                                                  Text("Profissional nota 1000.Recomendo a todos"),  
                                                  Text("20 dias atrás") 
                                                  ],
                                              ) ,
                                              )
                                              ),
                          ],
                        ),
                      ),
                    )
                     
                    
                    
                 ],
               )
             )  ,
             ), 
             Expanded(
               child:Align(
               alignment: Alignment.bottomCenter,
               child:ButtonTheme(
                 minWidth: MediaQuery.of(context).size.width * 0.9,
                 child:RaisedButton(
                           color: Theme.of(context).primaryColor,
                           onPressed: () async {
                             //funcao de salvamento
                             setState(() {
                               criandoServico  = true;
                             });
                             bool criouServico = await criacaoServicoProvider.aceitarOrcamento();
                             showDialog(
                               context: context,
                               builder: (BuildContext context){
                                 return (criouServico) ? AlertDialog(
                                   title: Text("Serviço"),
                                   content: Text("Orçamento aceito,faça o acompanhanto pelo menu Meus Serviços."),
                                   actions: <Widget>[
                                     FlatButton(
                                       child: Text("Ir Para Meus Servicos"),
                                       onPressed: (){
                                         Navigator.of(context).pop();
                                         Navigator.of(context).pushNamedAndRemoveUntil('/MeusServicos',ModalRoute.withName('/'));
                                       },
                                     ),
                                     FlatButton(
                                       child: Text("Ir Home"),
                                       onPressed: (){
                                         Navigator.of(context).pop();
                                         Navigator.of(context).pushNamed('/');
                                       },
                                     )
                                   ],
                                 ) :  AlertDialog(
                                   title: Text("Serviço"),
                                   content: Text("Houve um erro na criação do serviço,Tente novamente mais tarde"),
                                   actions: <Widget>[
                                     FlatButton(
                                       child: Text("Ok"),
                                       onPressed: (){
                                         Navigator.of(context).pop();
                                       },
                                     ),
                                     
                                   ],
                                 );
                               }
                             );
                              setState(() {
                                criandoServico = false;
                              });
                             
                           },
                           child: const Text(
                             'Aceitar',
                             style: TextStyle(fontSize: 20,color: Colors.white)
                           ),
                         ),
               ),
                
             ) ,
             )
               
               ],
             )
             
                         
             );
         },
             
             )
             
             
                       
         
       
    );
  }
}