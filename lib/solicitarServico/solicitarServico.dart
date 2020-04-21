import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/criacaoServicoProvider.dart';
import 'package:flutter_scaffold/solicitarServico/cardCategoria.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


class SolicitarServico extends StatefulWidget {
  SolicitarServico({Key key}) : super(key: key);

  @override
  _SolicitarServicoState createState() => _SolicitarServicoState();
}

class _SolicitarServicoState extends State<SolicitarServico> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<AutoCompleteTextFieldState> chaveAutoComplete = GlobalKey();
  final Firestore db = new Firestore();
  List<dynamic>   opcoes = [];
  TextStyle    titulo = TextStyle(fontWeight: FontWeight.bold);
  List<String> reparos = ["Reparo","reparo","Teste2"];
  List<String> construcao = ["Construção","construcao","Teste4"];
  List<String> reforma   = ["Reforma","reforma","Teste6"];
  List<String> listagem = [

  ];
  void getOpcoesServicos() async {      
      db.collection('tiposservico')
        .getDocuments()
        .then((QuerySnapshot snapshot){
           snapshot.documents.forEach((servico){
            opcoes.addAll(servico["opcoes"]);
           });
           print('OPCOCES A SEREM SETADAS $opcoes');
           setState(() {
             
           });
        });

  }
  @override
  void initState() { 
    getOpcoesServicos();
    super.initState();
    
  }

   @override
  Widget build(BuildContext context) {
    final criacaoServicoProvider = Provider.of<CriacaoServicoState>(context);
    return Scaffold(
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
           return SingleChildScrollView(
             child: Container(
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               mainAxisSize: MainAxisSize.max,
               children: <Widget>[
                 SizedBox(
                   width: MediaQuery.of(context).size.width,
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
                              title:AutoCompleteTextField(
                                 key: chaveAutoComplete,
                                 decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'ex:Pintura,pintor,eletricista,construção,',
                                 ) ,
                                 itemBuilder: (context,item){
                                   return Padding(
                                     padding: EdgeInsets.all(5),
                                     child:Text(StringUtils.capitalize(item)) ,
                                   )
                                   ;
                                 },
                                 itemFilter: (item,query){
                                   return item
                                              .toLowerCase()
                                              .startsWith(query.toLowerCase());
                                 },
                                 itemSorter: (a,b){
                                   return a.compareTo(b);
                                 },
                                 itemSubmitted: (item){
                                   print("ITEM ESCOLHIDO $item");
                                   Navigator.of(context).pushNamed('/CriarServico',arguments:item);
                                 },
                                 suggestions: opcoes,
                              )                              
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
                             InkWell(
                               onTap: (){
                                 criacaoServicoProvider.setTipoServico("construcao");
                                 Navigator.of(context).pushNamed('/Servicos',arguments: construcao);
                                 },
                               child: CardCategoria("Construção", "https://thumbs.dreamstime.com/z/linha-civil-conceito-do-guindaste-de-constru%C3%A7%C3%A3o-%C3%ADcone-ilustra%C3%A7%C3%A3o-linear-vetor-s%C3%ADmbolo-sinal-132454234.jpg"),
                             ),
                             InkWell(
                               onTap: (){
                                 criacaoServicoProvider.setTipoServico("reforma");
                                 Navigator.of(context).pushNamed('/Servicos',arguments: reforma);
                                 },
                               child: CardCategoria("Reforma", "https://silasmaridodealuguel.files.wordpress.com/2015/08/1354672719_462262797_1-reformas-em-geral-andrade-de-araujo.jpg" ),
                             ),                             
                             InkWell(
                               onTap: (){
                                          criacaoServicoProvider.setTipoServico("reparo");
                                          Navigator.of(context).pushNamed('/Servicos',arguments: reparos);
                                 },
                               child: CardCategoria("Reparo", "https://st.depositphotos.com/1010146/4494/v/950/depositphotos_44941501-stock-illustration-home-repair-icon.jpg"),
                             ),                             
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
             ),
           )
            ;
         },
       ) ,
    );
  }
}