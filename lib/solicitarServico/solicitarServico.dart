import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/solicitarServico/cardCategoria.dart';

class SolicitarServico extends StatefulWidget {
  SolicitarServico({Key key}) : super(key: key);

  @override
  _SolicitarServicoState createState() => _SolicitarServicoState();
}

class _SolicitarServicoState extends State<SolicitarServico> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextStyle titulo = TextStyle(fontWeight: FontWeight.bold);
  String _busca;
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
         title: Text("Solicitar Serviço",style: TextStyle(color: Colors.black),),

       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               mainAxisSize: MainAxisSize.max,
               children: <Widget>[
                 SizedBox(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height * 0.25,
                   child:Card(
                   child:Padding(
                     padding: EdgeInsets.all(20),
                     child:Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                        Text("Acesso Rápido",style: titulo,),
                        Text("Digite aqui o serviço que você procura"),
                        Card(child: ListTile(
                              title: TextFormField(
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Por Favor digite algo para buscar';
                                }
                                print('VALOR Da Busca' + value);
                                return null;
                              },
                              onSaved: (value) {
                                setState(() {
                                  _busca = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'ex:Pintura,pintor,eletricista,construção,',
                              ),
                            ),
                          ) ,)
                       
                        ],) ,
                   ) ,
                 ) ,),
                 Padding(padding: EdgeInsets.only(top: 10),),
                 SizedBox(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height * 0.6,
                   child: Card(
                     child: Padding(
                       padding: EdgeInsets.all(10),
                       child:Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
                         Text("Acesso por Categoria",style: titulo,),
                         Padding(padding: EdgeInsets.only(top: 5)),
                         Text("Selecione a categoria do Serviço que você procura"),
                         Padding(padding:EdgeInsets.only(top: 5),),
                         Expanded(
                           child: GridView.count(
                           crossAxisCount: 2,
                           children: <Widget>[
                             CardCategoria("Construção", "https://thumbs.dreamstime.com/z/linha-civil-conceito-do-guindaste-de-constru%C3%A7%C3%A3o-%C3%ADcone-ilustra%C3%A7%C3%A3o-linear-vetor-s%C3%ADmbolo-sinal-132454234.jpg"),
                             Card(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: <Widget>[
                                   CachedNetworkImage(
                                     height: 100,
                                     width: 100,
                                     fit: BoxFit.contain,
                                     imageUrl:"https://silasmaridodealuguel.files.wordpress.com/2015/08/1354672719_462262797_1-reformas-em-geral-andrade-de-araujo.jpg" ,
                                     placeholder: (context,url)=>SizedBox(width: 50,height: 50,child: CircularProgressIndicator(),),
                                     errorWidget: (context,url,error)=>Icon(Icons.error),
                                     ),
                                     Text("Reforma",style:titulo)
                                     ],
                               ),
                             ),
                             CardCategoria("Reparo", "https://st.depositphotos.com/1010146/4494/v/950/depositphotos_44941501-stock-illustration-home-repair-icon.jpg"),
                             
                           ],
                         ),
                         )
                         

                       ],
                     ) ,
                     )
                     ,
                   ),
                 )
                 

               ],
             )
             );
         },
       ) ,
    );
  }
}