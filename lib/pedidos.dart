import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/carrinho.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'blocks/auth_block.dart';



class ListaPedidos extends StatefulWidget {
  @override
  _ListaPedidosState createState() => _ListaPedidosState();
}

class _ListaPedidosState extends State<ListaPedidos> {

  final List<Map<dynamic, dynamic>> products = [
    {'name': 'IPhone', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80', 'price': '200'},
    {'name': 'IPhone X 2', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', 'price': '200'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80', 'price': '200'},

  ];

  @override
  Widget build(BuildContext context) {
   final carrinho  = Provider.of<CarrinhoState>(context);
   final AuthBlock authBlock = Provider.of<AuthBlock>(context);
   final firebaseUser = Provider.of<FirebaseUser>(context);  
  
    return Scaffold(
        appBar: AppBar(
          title: Text('Pedidos'),
        ),
        body:(firebaseUser != null)?  
         StreamBuilder<QuerySnapshot>(
           stream:Firestore.instance.collection('pedidos').where('pedidoFeitoPor',isEqualTo: firebaseUser.uid.toString()).orderBy('dataPedido',descending:true ).snapshots(),
           builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
             if(snapshot.hasError) return new Text('Error: ${snapshot.error}');
             switch(snapshot.connectionState){
               case ConnectionState.waiting: return new Container(
                 alignment: Alignment.center,
                 child:CircularProgressIndicator());
               default:
                return new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Container(
                  child:(snapshot.data.documents.length == 1)?Text(snapshot.data.documents.length.toString() + " Pedido Feito", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)):Text(snapshot.data.documents.length.toString() + " Pedidos Feitos", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
              ),
            ),
            Flexible(
              child: ListView(
                  
                  children: snapshot.data.documents.map((DocumentSnapshot pedido) {
                      print(pedido);
                      return Builder(
                        builder: (context){
                          return InkWell(
                        onTap: () {
                          print('Card tapped.');
                          Navigator.pushNamed(
                            context, '/Pedido',
                            arguments: pedido);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child:Card(
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    ListTile(
                                trailing: Column( 
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,                                  
                                   children:<Widget>[
                                        Container(                                          
                                          child:Text('R\$ '+pedido['total'],style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        )
                                        
                                   ]),
                                   
                                isThreeLine: true,
                                title: Text(
                                 'Pedido id:' + pedido.documentID,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 2.0, bottom: 1),
                                          child: Text('Data Pedido: '+
                                                    DateTime.fromMillisecondsSinceEpoch(pedido['dataPedido']).day.toString()+'/'+
                                                    DateTime.fromMillisecondsSinceEpoch(pedido['dataPedido']).month.toString()+'/'+
                                                    DateTime.fromMillisecondsSinceEpoch(pedido['dataPedido']).year.toString(), 
                                          style: TextStyle(                                            
                                            fontWeight: FontWeight.w700,
                                          )),
                                        ),
                                        
                                      ],
                                    ),
                                    Row(children: <Widget>[
                                       Padding(
                                          padding: const EdgeInsets.only(top: 2.0, bottom: 1),
                                          child: Text('Qtd de Produtos: '+ pedido['qtdProdutos'], 
                                          style: TextStyle(                                            
                                            fontWeight: FontWeight.w700,
                                          )),
                                        ),
                                    ],)
                                  ],
                                ),
                              ),
                             ButtonTheme(
                                    buttonColor: Theme.of(context).primaryColor,
                                    minWidth: double.infinity,
                                    height: 40,
                                    child:RaisedButton(
                                      
                                      onPressed:  ()async {   
                                          print(pedido.documentID);               
                                        
                                      },
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                            Text('Status: ',
                                                  style: TextStyle(color: Colors.white,fontSize: 16)
                                                ),
                                            Text(
                                              pedido['status'],
                                              style: TextStyle(color: Colors.white, fontSize: 16),
                                            ),
                                            
                                        ],
                                      )
                                    ),
                                  ),

                                  ],
                                ) 
                              ) 
                            ),
                          ],
                        ),
                      );
                        }
                      );
                    }).toList()
                  ),
            ),           
            
          ],
        );
             }
           },

         )
          : Column(
          children: <Widget>[
            SingleChildScrollView(
                        child: ButtonTheme(
                            buttonColor: Colors.blueAccent,
                            minWidth: double.infinity,
                            height: 40,
                            child:RaisedButton(
                              
                              onPressed:  ()async {   
                                  await authBlock.logarFacebook();                 
                                
                              },
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                    Text(
                                      "Logar Com Facebook",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                    Icon(FontAwesomeIcons.facebook,color: Colors.white,)
                                ],
                              )
                            ),
                          ),
                        ),
          ],
        )
    );
  }
}
