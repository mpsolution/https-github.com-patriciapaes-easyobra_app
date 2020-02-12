import 'package:flutter/material.dart';
import 'package:flutter_scaffold/auth/auth.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:flutter_scaffold/cadastro.dart';
import 'package:flutter_scaffold/cart.dart';
import 'package:flutter_scaffold/categorise.dart';
import 'package:flutter_scaffold/dicas/dica.dart';
import 'package:flutter_scaffold/enderecos/enderecos.dart';
import 'package:flutter_scaffold/formapagamento/adicionarcartaocredito.dart';
import 'package:flutter_scaffold/formapagamento/pagamentos.dart';
import 'package:flutter_scaffold/home/home.dart';
import 'package:flutter_scaffold/indicacaoprofissional.dart';
import 'package:flutter_scaffold/login.dart';
import 'package:flutter_scaffold/meusgastos/meusgastos.dart';
import 'package:flutter_scaffold/meusorcamentos/meusorcamentos.dart';
import 'package:flutter_scaffold/meusorcamentos/orcamentos.dart';
import 'package:flutter_scaffold/meusorcamentos/portifoliodoprofissional.dart';
import 'package:flutter_scaffold/meusprojetos/meusprojetos.dart';
import 'package:flutter_scaffold/meusprojetos/projeto.dart';
import 'package:flutter_scaffold/meusservicos/meusservicos.dart';
import 'package:flutter_scaffold/minhascompras/minhascompras.dart';
import 'package:flutter_scaffold/pedido.dart';
import 'package:flutter_scaffold/pedidos.dart';
import 'package:flutter_scaffold/pedirajuda.dart';
import 'package:flutter_scaffold/product_detail.dart';
import 'package:flutter_scaffold/profissional/editarPortifolio.dart';
import 'package:flutter_scaffold/profissional/formPortifolio.dart';
import 'package:flutter_scaffold/provider/ajudaProvider.dart';
import 'package:flutter_scaffold/provider/criacaoServicoProvider.dart';
import 'package:flutter_scaffold/provider/historicoProvider.dart';
import 'package:flutter_scaffold/provider/projetoProvider.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:flutter_scaffold/settings.dart';
import 'package:flutter_scaffold/shop/shop.dart';
import 'package:flutter_scaffold/solicitarServico/criarServico.dart';
import 'package:flutter_scaffold/solicitarServico/historicoservico.dart';
import 'package:flutter_scaffold/solicitarServico/servicos.dart';
import 'package:flutter_scaffold/solicitarServico/solicitarServico.dart';
import 'package:flutter_scaffold/termosecondicoes/termosecondicoes.dart';
import 'package:flutter_scaffold/wishlist.dart';
import 'package:flutter_scaffold/chat/chat.dart';
import 'package:flutter_scaffold/chat/contatos.dart';
import 'package:flutter_scaffold/perfil/editarPerfil.dart';


import 'package:provider/provider.dart';
import './provider/carrinho.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<CarrinhoState>.value(value: CarrinhoState()),
                ChangeNotifierProvider<UsuarioProvider>.value(value: UsuarioProvider(),),
                ChangeNotifierProvider<HistoricoProvider>.value(value:HistoricoProvider()),
                ChangeNotifierProvider<ProjetoProviderState>.value(value: ProjetoProviderState(),),
                ChangeNotifierProvider<AjudaProviderState>.value(value:AjudaProviderState()),
                ChangeNotifierProvider<CriacaoServicoState>.value(value:CriacaoServicoState()),
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
          buttonColor: Colors.green,
          textSelectionColor: Colors.white,
          fontFamily: 'Lato'),
      initialRoute: '/Login',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/Cadastrar':(BuildContext context) => Cadastro(),
        '/auth': (BuildContext context) => Auth(),
        '/shop': (BuildContext context) => Shop(),
        '/categorise': (BuildContext context) => Categorise(),
        '/wishlist': (BuildContext context) => WishList(),
        '/cart': (BuildContext context) => CartList(),
        '/editarPerfil': (BuildContext context) => EditarPerfil(),
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
        '/Enderecos':(BuildContext context) => Enderecos(),
        '/MeusProjetos':(BuildContext context) => MeusProjetos(),
        '/Projeto': (BuildContext context) => Projeto(),
        '/Dica':(BuildContext context) =>Dica(),
        '/SolicitarServico':(BuildContext context) => SolicitarServico(),
        '/Servicos':(BuildContext context) => Servicos(),
        '/MeusGastos':(BuildContext context) => MeusGastos(),
        '/Login':(BuildContext context) => Login(),
        '/PedirAjuda':(BuildContext context) =>PedirAjuda(),
        '/IndicacaoProfissional':(BuildContext context) =>IndicacaoProfissional(),
        '/HistoricoServico':(BuildContext context)=>HistoricoServico(),
        '/TermoseCondicoes':(BuildContext context)=>TermoseCondicoes(),
        '/CriarServico':(BuildContext context)=>CriarServico(),
        '/Chat':(BuildContext context)=>Chat(),
        '/Contatos':(BuildContext context)=>Contatos(),
        '/Portifolio':(BuildContext context)=> EditarPortifolio(),
        '/FormPortifolio':(BuildContext context) => FormPortifolio()

      },
    ),
  ));
}
