import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/carrinho.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DocumentSnapshot args = ModalRoute.of(context).settings.arguments;
    final Carrinho  = Provider.of<CarrinhoState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Produto'),
      ),
      body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                width: double.infinity,
                  height: 260,
                  child: Hero(
                    tag: args.documentID,
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: args['imagem'],
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment(-1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Text(
                            args['nomeProduto'],
                            style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'R\$'+args['preco'],
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                //Text(
                                   // 'R\$190',
                                   // style: TextStyle(
                                    //  color: Colors.black,
                                     //   fontSize: 16,
                                   //     decoration: TextDecoration.lineThrough
                                 //   )
                               // ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SmoothStarRating(
                                    allowHalfRating: false,
                                    onRatingChanged: (v) {
                                    },
                                    starCount: 5,
//                                rating: product['rating'],
                                    size: 20.0,
                                    color: Colors.amber,
                                    borderColor: Colors.amber,
                                    spacing: -0.8
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                      '(0.00)',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child:InkWell(
                                  onTap: (){
                                    Carrinho.setDisplayText('1');
                                  },
                                  child: Text(
                                    'Descrição',
                                  style: TextStyle(color: Colors.black, fontSize: 20,  fontWeight: FontWeight.w600),
                                ),
                                ) 
                              )
                          ),
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  args['descricao'],
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              )
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                           Padding(
                                          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50, bottom: 10),
                                          child: ButtonTheme(
                                            buttonColor: Theme.of(context).primaryColor,
                                            minWidth: double.infinity,
                                            height: 40.0,
                                            child: RaisedButton(
                                              onPressed:  () async {
                                                Fluttertoast.showToast(
                                                    msg: "Produto Adicionado ao Carrinho!",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIos: 1,
                                                    backgroundColor: Theme.of(context).primaryColor,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0
                                                );
                                                Carrinho.adicionarProdutoCarrinho(args.documentID ,args['nomeProduto'], args['imagem'], args['preco'], args['descricao']);
                                              },
                                              child: Text(
                                                "Adicionar ao Carrinho",
                                                style: TextStyle(color: Colors.white, fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

      ),
    );
  }
}
