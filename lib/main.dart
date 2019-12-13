import 'package:flutter/material.dart';
import 'package:flutter_scaffold/auth/auth.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:flutter_scaffold/cart.dart';
import 'package:flutter_scaffold/categorise.dart';
import 'package:flutter_scaffold/enderecos/enderecos.dart';
import 'package:flutter_scaffold/formapagamento/adicionarcartaocredito.dart';
import 'package:flutter_scaffold/formapagamento/pagamentos.dart';
import 'package:flutter_scaffold/home/home.dart';
import 'package:flutter_scaffold/meusorcamentos/meusorcamentos.dart';
import 'package:flutter_scaffold/meusorcamentos/orcamentos.dart';
import 'package:flutter_scaffold/meusorcamentos/portifoliodoprofissional.dart';
import 'package:flutter_scaffold/meusservicos/meusservicos.dart';
import 'package:flutter_scaffold/minhascompras/minhascompras.dart';
import 'package:flutter_scaffold/pedido.dart';
import 'package:flutter_scaffold/pedidos.dart';
import 'package:flutter_scaffold/product_detail.dart';
import 'package:flutter_scaffold/settings.dart';
import 'package:flutter_scaffold/shop/shop.dart';
import 'package:flutter_scaffold/wishlist.dart';
import 'package:provider/provider.dart';
import './provider/carrinho.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<CarrinhoState>.value(value: CarrinhoState()),
            ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock()) ,
                StreamProvider<FirebaseUser>.value(
                  value:FirebaseAuth.instance.onAuthStateChanged,
                )
                ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange[500],
          accentColor: Colors.lightBlue[900],
          fontFamily: 'Lato'),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/auth': (BuildContext context) => Auth(),
        '/shop': (BuildContext context) => Shop(),
        '/categorise': (BuildContext context) => Categorise(),
        '/wishlist': (BuildContext context) => WishList(),
        '/cart': (BuildContext context) => CartList(),
        '/settings': (BuildContext context) => Settings(),
        '/products': (BuildContext context) => Products(),
        '/ListaPedidos' : (BuildContext context) => ListaPedidos(),
        '/Pedido':(BuildContext context) =>Pedido(),
        '/MeusOrcamentos':(BuildContext context) => MeusOrcamentos(),
        '/MeusServicos':(BuildContext context) => MeusServicos(),
        '/MinhasCompras':(BuildContext context) => MinhasCompras(),
        '/Orcamentos':(BuildContext context) => Orcamentos(),
        '/PortifolioDoProfissional':(BuildContext context) => PortifolioDoProfissional(),
        '/Pagamentos':(BuildContext context)  => Pagamentos(),
        '/AdicionarCartao':(BuildContext context) => AdicionarCartao(),
        '/Enderecos':(BuildContext context) => Enderecos()
      },
    ),
  ));
}
