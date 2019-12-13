import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_scaffold/provider/produto.dart';


class Pedido extends StatefulWidget {
  @override
  _PedidoState createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  final List<Map<dynamic, dynamic>> products = [
    {'name': 'IPhone', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'},
    {'name': 'IPhone X 2', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 12', 'rating': 5.0, 'image': 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'},
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final DocumentSnapshot pedido = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        appBar: AppBar(
          leading:new IconButton(
               icon: new Icon(Icons.arrow_back, color: Colors.white),
               onPressed: () => Navigator.of(context).maybePop(),
              ), 
          
          title: Text('Status: ' + pedido['status'].toString()),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Container(
                            child:  new  GridView.count(                                      
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
                              children: List<Produto>.from(pedido['produtos'].map((produto)=> Produto.fromMap(produto))).map((produto) {
                                return Container(
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () {
                                        print('Card tapped.');
                                       // Navigator.pushNamed( context, '/products', arguments: produto);
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: (MediaQuery.of(context).size.width / 2 - 5),
                                            width: double.infinity,
                                            child:Hero( 
                                              tag:produto.id,  
                                              child:CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: produto.imagem,
                                              placeholder: (context, url) => Center(
                                                  child: CircularProgressIndicator()
                                              ),
                                              errorWidget: (context, url, error) => new Icon(Icons.error),
                                            ),)
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 2.0),
                                            child: ListTile(                                              
                                              title: Text(
                                                produto.nomeProduto,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16
                                                ),
                                              ),
                                              subtitle:SingleChildScrollView(
                                                 padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                                                child:Column(
                                              
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                  
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 2.0, bottom: 0),
                                                        child: Text(produto.qtd.toString()+' x ' + 'R\$'+produto.preco, style: TextStyle(
                                                          color: Theme.of(context).accentColor,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16
                                                        )),
                                                      )
                                                    ],
                                                  ),
                                                  
                                                  
                                                ],
                                              ),
                                              ) 
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                            
                            
                          );
          },
        ),
      ),
    );
  }
}
