import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:flutter_scaffold/provider/carrinho.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    AuthBlock auth = Provider.of<AuthBlock>(context);
    final Carrinho = Provider.of<CarrinhoState>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<Map> opcoesMinhaConta = [
      {"icone": Icons.home, "nome": "Endereços", "link": "/Enderecos"},
      {"icone": Icons.home, "nome": "Termos e condições", "link": "/TermoseCondicoes"},
      {"icone": Icons.home, "nome": "Suporte", "link": "/PedirAjuda"},
      {"icone": Icons.home, "nome": "Indique o seu profissional", "link": "/IndicacaoProfissional"},
    ];
    final List<Map> opcoesMinhaPasta = [
      {
        "icone": Icons.home,
        "nome": "Meus Orçamentos",
        "link": "/MeusOrcamentos"
      },
      {"icone": Icons.home, "nome": "Meus Serviços", "link": "/MeusServicos"},
      {"icone": Icons.home, "nome": "Minhas Compras", "link": "/MinhasCompras"},
      {
        "icone": Icons.home,
        "nome": "Forma de Pagamento",
        "link": "/Pagamentos"
      },
      {"icone": Icons.home, "nome": "Meus Projetos", "link": "/MeusProjetos"},
      {"icone": Icons.home, "nome": "Contatos", "link": "/Contatos"},
      {"icone": Icons.home, "nome": "Portifolio", "link": "/Portifolio"},
      {"icone": Icons.home, "nome": "EditarPortifolio", "link": "/FormPortifolio"},


    ];
    String imagemBase ='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
    List<Widget> criarMenu(List<Map> opcoes) {
      return opcoes.map<Widget>((opcao) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1.0, color: Colors.black))),
          child: ListTile(
            leading: Icon(opcao['icone'], color: Theme.of(context).accentColor),
            title: Text(opcao['nome']),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, opcao['link']);
            },
          ),
        );
      }).toList();
    }

    List<Widget> widgetMinhaPasta = criarMenu(opcoesMinhaPasta);
    List<Widget> widgetMinhaConta = criarMenu(opcoesMinhaConta);

    return Column(
      children: <Widget>[
        if ((firebaseUser != null) && (firebaseUser == null))
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/drawer-header.jpg'),
            )),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage((usuarioProvider.getUsuarioLogado == null) ? imagemBase : usuarioProvider.getUsuarioLogado['photoUrl']),
            ),
            accountEmail: (firebaseUser.email != null)
                ? Text(firebaseUser.email.toString())
                : Text(''),
            accountName: (firebaseUser.displayName != null)
                ? Text('Olá  ' + firebaseUser.displayName.toString())
                : Text(''),
          ),
        InkWell(
          onTap: (){
              Navigator.pop(context);

            Navigator.of(context).pushNamed('/editarPerfil');
          },
          child: Container(
          margin: EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage((usuarioProvider.getUsuarioLogado == null) ? imagemBase : usuarioProvider.getUsuarioLogado['photoUrl']),
                        maxRadius: 40,
                      )),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(usuarioProvider.getUsuarioLogado['displayName']),
                          Row(
                            children: <Widget>[
                              Text("4.92"),
                              Icon(Icons.star, color: Colors.black)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Editar Perfil'),
                              Icon(Icons.settings, color: Colors.grey)
                            ],
                          )
                        ]),
                  )
                ],
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Créditos + Bônus"),
                      Text("R\$ 80,00"),
                      Icon(Icons.chevron_right, color: Colors.black),
                    ],
                  )),
            ],
          ),
        ),
        )
        ,
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Container(
                alignment: Alignment(-0.9, 0.5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black))),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Minha Pasta"),
                ),
              ),
              ...widgetMinhaPasta,
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Container(
                alignment: Alignment(-0.9, 0.5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black))),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Minha Conta"),
                ),
              ),
              ...widgetMinhaConta

              /**
              ListTile(
                leading: Icon(Icons.shopping_basket,
                    color: Theme.of(context).accentColor),
                title: Text('Pedidos'),                
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/ListaPedidos');
                },
              ),
             
               * 
               * ListTile(
                leading: Icon(Icons.shopping_basket,
                    color: Theme.of(context).accentColor),
                title: Text('Shop'),
                trailing: Text('New',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shop');
                },
              ),
               
              
              ListTile(
                leading:
                    Icon(Icons.category, color: Theme.of(context).accentColor),
                title: Text('Categorias'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categorise');
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.favorite, color: Theme.of(context).accentColor),
                title: Text('Favoritos'),
                trailing: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text('4',
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/wishlist');
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart,
                    color: Theme.of(context).accentColor),
                title: Text('Meu Carrinho'),
                trailing: (Carrinho.getQtdProdutosCarrinho > 0)? Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(Carrinho.getQtdProdutosCarrinho.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ):null,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              ListTile(
                leading: Icon(Icons.lock, color: Theme.of(context).accentColor),
                title: Text('Login'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/auth');
                },
              ),
              Divider(),
              ListTile(
                leading:
                    Icon(Icons.settings, color: Theme.of(context).accentColor),
                title: Text('Perfil'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app,
                    color: Theme.of(context).accentColor),
                title: Text('Logout'),
                onTap: () async {
                  await auth.logout();
                },
              )
              */
            ],
          ),
        )
      ],
    );
  }
}
