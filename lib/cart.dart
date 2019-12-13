import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_scaffold/provider/carrinho.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'blocks/auth_block.dart';



class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {

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
   Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logue-se Para efetuar o Pedido'),
          content: SingleChildScrollView(
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
          
          actions: <Widget>[
            FlatButton(
              child:Text('Cancelar') ,
              onPressed: () {
                Navigator.of(context).pop();
               // Navigator.pushNamed(context, '/auth');
              },
            ),
          ],
        );
      },
    );
  }

    return Scaffold(
        appBar: AppBar(
          title: Text('carrinho'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Container(
                  child: Text(carrinho.getQtdProdutosCarrinho.toString() + " Items no carrinho", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
              ),
            ),
            Flexible(
              child: ListView(
                  
                  children: carrinho.getProdutos.map((item) {
                      print(item.nomeProduto);
                      return Builder(
                        builder: (context){
                          return Dismissible(
                      // Each Dismissible must contain a Key. Keys allow Flutter to
                      // uniquely identify widgets.
                      key: Key(UniqueKey().toString()),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      onDismissed: (direction) {
                        if(direction == DismissDirection.endToStart) {
                          // Then show a snackbar.
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text(item.getNomeProduto + " Tirado do carrinho"), duration: Duration(seconds: 1)));
                        } else {
                          // Then show a snackbar.
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text(item.getNomeProduto + " Tirado do carrinho"), duration: Duration(seconds: 1)));
                        }
                        // Remove the item from the data source.
                        setState(() {
                          carrinho.removerProdutoCarrinho(item);
                        });
                      },
                      // Show a red background as the item is swiped away.
                      background: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                    ),

                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),

                          ],
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: ListTile(
                                trailing: Text('R\$ ${item.getPreco}'),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue
                                    ),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:(item.imagem == null)?  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80' : item.imagem,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()
                                      ),
                                      errorWidget: (context, url, error) => new Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  (item.getNomeProduto == null)?'':item.getNomeProduto,
                                  style: TextStyle(
                                      fontSize: 14
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 2.0, bottom: 1),
                                          child: Text('x '+ item.qtd.toString(), style: TextStyle(
                                            color: Theme.of(context).accentColor,
                                            fontWeight: FontWeight.w700,
                                          )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                        }
                      );
                    }).toList()
                  ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom :30.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text("TOTAL", style: TextStyle(fontSize: 16, color: Colors.grey),)
                          ),
                          Text("R\$"+carrinho.getTotalCarrinho.toString(),  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50, bottom: 10),
              child: ButtonTheme(
                buttonColor: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                height: 40.0,
                child: RaisedButton(
                  onPressed:  ()async {
                    if(firebaseUser == null) await _neverSatisfied();
                    if((firebaseUser != null) & (carrinho.getQtdProdutosCarrinho > 0) ){
                      int numeroTelefone = 21967614957;
                      String pedido      = await carrinho.fazerPedidoTexto();
                      String url = 'http://api.whatsapp.com/send?text='+pedido+'&phone=55'+numeroTelefone.toString();
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }

                      }
                    /**
                     * 
                     * 
                     */
                    
                  },
                  child: Text(
                    "Fazer Pedido",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
