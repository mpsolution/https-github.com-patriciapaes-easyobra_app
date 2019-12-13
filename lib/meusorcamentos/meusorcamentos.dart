import 'package:flutter/material.dart';

class MeusOrcamentos extends StatefulWidget {
  MeusOrcamentos({Key key}) : super(key: key);

  @override
  _MeusOrcamentosState createState() => _MeusOrcamentosState();
}

class _MeusOrcamentosState extends State<MeusOrcamentos> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imagemBase = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
  final List<int> orcamentos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
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
         title: Text("Meus Orçamentos",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             child:ListView(
               padding: EdgeInsets.all(4),
               children: <Widget>[
                 ...orcamentos.map<Widget>((orcamento)=>
                  SizedBox(
               width: double.infinity,
               height: 150,
               child:Card(
               
               child: Row(
                 children: <Widget>[
                   Center(
                     child:CircleAvatar(
                     radius: 50,
                     backgroundColor: Colors.transparent,
                     backgroundImage: NetworkImage(imagemBase),
                   ),
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[
                       Text("Reparos / Manutenção",style:TextStyle(fontWeight: FontWeight.bold)),
                       Text("Material de pintura"),
                       Text("26 de Novembro de 2019"),
                       Text("9 Respostas  18hrs restantes"),
                       Text("Menor valor R\$340,00",style:TextStyle(fontWeight: FontWeight.bold,fontSize:12))
                     ],
                   ),
                   //Botoes
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[
                       InkWell(
                         onTap: (){
                           Navigator.pushNamed(context,'/Orcamentos');
                         },
                         child:Container(
                         width: 120,
                         height: 30,
                         child:Card(
                            
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                            ),
                            child:Center(
                              
                              child:Text("Ver Orçamentos",style: TextStyle(color: Colors.white),)                             
                            ) 
                          ),
                       ),
                       )
                       ,
                       Container(
                         width: 120,
                         height: 30,
                         child:Card(                            
                            shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.black,width: 1.0),
                            ),
                            child:Center(
                              child:Text("Pedir Ajuda",style: TextStyle(color: Colors.green),)                             
                            ) 
                          ),
                       ),
                       Container(
                         width: 120,
                         height: 30,
                         child:Card(                            
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                            ),
                            child:
                              InkWell(
                                onTap: (){
                                  print("Cancelar");
                                },
                                child:  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:<Widget>[
                                        Icon(Icons.close,color: Colors.white,),
                                        Text("Cancelar",style: TextStyle(color: Colors.white),) 
                                    ],                           
                                  ) ,
                              )
                              
                          ) ,
                       ),

                     ],
                   )

                 ],
               ),
             ) ,
             )
                 
                 ).toList()
               ],
             )
             
             
             
           );
         },
       ) ,
    );
  }
}