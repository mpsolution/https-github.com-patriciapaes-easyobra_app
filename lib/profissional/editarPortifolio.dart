import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/criacaoServicoProvider.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:provider/provider.dart';

class EditarPortifolio extends StatefulWidget {
  EditarPortifolio({Key key}) : super(key: key);

  @override
  _EditarPortifolioState createState() => _EditarPortifolioState();
}

class _EditarPortifolioState extends State<EditarPortifolio> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imagemBase = "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-3-avatar-2754579_120516.png";
  final List<int> EditarPortifolio = [1,2,3,6,8,6,7,8,9,10,11,12,13,16,18,16,17,18,19,20];
  int   rowSelecionada = 0;
  bool criandoServico = false;
  TextStyle tituloEstilo = TextStyle( 
    fontWeight: FontWeight.bold,
    fontSize: 18,
   );
  bool salvarEdicao = false;

 
 
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

     String urlFoto = ((usuarioProvider.usuario['photoUrl'] != null) && (usuarioProvider.usuario['photoUrl'] != '' ) ) ? usuarioProvider.usuario['photoUrl'] : imagemBase;
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         centerTitle: true,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Portifólio do Profissional",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Stack(
             children: <Widget>[
               ListView(
               scrollDirection: Axis.vertical,  
               padding: EdgeInsets.all(6),
               children: <Widget>[
                  if(criandoServico) LinearProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor ),),
                    //Card Dados profissional
                    Stack(
                      children: <Widget>[
                        Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child:Column(
                        children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Align(
                          alignment: Alignment.centerLeft,
                          child:Row(
                            children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(urlFoto),
                                ),
                                Padding(padding: EdgeInsets.all(8),),
                                Text(usuarioProvider.usuario['displayName'] ,style:TextStyle(fontWeight: FontWeight.bold)) ,
                            ],
                          )
                          
                        ),
                        ),
                    Padding(padding: EdgeInsets.all(6),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.9,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.content_paste,color:Colors.black),
                          Padding(padding: EdgeInsets.all(8),),
                          Text("Gosto do que faço e faço o melhor para os clientes")
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(6),),
                    //Localização
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.9,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.home,color:Colors.black),
                          Padding(padding: EdgeInsets.all(8),),
                          Text("Moro no Rio de Janeiro,Baixada Fluminense."),
                          Padding(padding: EdgeInsets.all(8),),
                         

                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(6),),
                    SizedBox(
                        width: MediaQuery.of(context).size.width *0.9,
                        child:  //tempo no app , qualificação no app , nivel no app
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("3.8 meses"),
                              Text("6.98"),
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
                    Positioned(
                      top: 0,
                      right: 0,
                      child:FloatingActionButton(
                        heroTag: 'editPrincial',
                      mini: true,
                      backgroundColor: Theme.of(context).primaryColor,                      
                      onPressed: (){
                        print("EDITAR PRINCIPAL");
                      },
                      child: Icon(Icons.edit , color:Colors.white , size: 20,),
                    ) ,
                    )
                    

                      ],
                    )
                    ,
                    
                    Padding(padding: EdgeInsets.all(6),),
                    Stack(
                      children: <Widget>[
                        Card(
                                child: Padding(padding: EdgeInsets.all(8),
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
                                                              child:Text("Curiosidades",style: tituloEstilo,) ,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(top:5),
                                                              child: Text("Toco Guitarra na mairoia das vezes como hobby"),
                                                              )
                                                            
                                                          ],
                                                        ) ,
                                                        )
                                                        ),  
                      
                            ],
                          ),
                      ),

                    ),
                     

                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Card(
                      child: Padding(
                        padding:EdgeInsets.all(8),
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
                                    child:Text("Outras Experiências" ,style:tituloEstilo) ,
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
                    

                      ],
                    ),
                    //Card elogios
                    Stack(
                      children: <Widget>[ 
                        Card(
                      child: Padding(padding: EdgeInsets.all(8),
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
                                                    child:Text("Elogios (12)" , style: tituloEstilo) ,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Padding(padding: EdgeInsets.all(6),),
                                                        Text("Ultimos 8", style:tituloEstilo)
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
                                                  Text("60 dias atrás"),
                                                  Text("Profissional nota 1000.Recomendo a todos"),  
                                                  Text("20 dias atrás") 
                                                  ],
                                              ) ,
                                              )
                                              ),
                          ],
                        ),
                      ),
                    ),
                    

                      ],
                    ),
                     Stack(
                       children: <Widget>[
                         Card(
                           child: ListView(
                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
                             padding: EdgeInsets.all(5),
                             children: <Widget>[
                               Text("Fotos:" , style: tituloEstilo),
                               GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                physics: NeverScrollableScrollPhysics(),
                                children:List.generate(30, (index){
                                  return CachedNetworkImage(
                                    imageUrl: imagemBase,
                                    fit: BoxFit.cover,
                                    placeholder: (context,url) => Center( 
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context,url,error) => Icon(Icons.error),
                                  );
                                }),
                                )

                             ],
                           ),
                         )
                         ,
                              


                       ],
                     )
                     
                    
                   
                    

                 ]
             ),
          

             ],
           );
         },
             
             )
             
             
                       
         
       
    );
  }
}