import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_scaffold/ajuda.dart';
import 'package:flutter_scaffold/dicas/dicas.dart';
import 'package:flutter_scaffold/pedirajuda.dart';
import 'package:flutter_scaffold/provider/carrinho.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';
import 'slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'https://imgcentauro-a.akamaihd.net/900x900/94181002/camisa-chelsea-iii-19-20-nike-masculina-img.jpg',
    'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTxgMSGK05ypgswpY9_ladIUNwLuzcXtUecAn45mmjWNpgh31yyGGPqllxR7i0c5WGW65pNUZ6i&usqp=CAE',
    'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRvTCtcYSaEKs3kj2UFthTPl5VpiJDTbgNYRGpQS95dAF_Mkic0&usqp=CAE',
    'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQVUV0eIbOr7PGZEVWc1wwSEaGvUpWc4mhSm6SBNnhQ7i9zkreM046nkXV1flOv_hA01zdvsYV9&usqp=CAE',
    'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSWEvcz8XRAjp_lpxEjs8hm6y7xdRYweA1GKYaFVa3ouKErO5PFqKsDOD3BKHwpgvTXHear07o&usqp=CAE',
    'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR7OenuNFY99481oDm3bi_Bs57Uprqq2tPYdhOGGMpAR5uBfyf9ypybR1OY-GqeHkhP5HmH7m-8&usqp=CAE',
  ];
  final List<String> imgOpcoes = [
    'https://blogpilates.com.br/wp-content/uploads/2017/02/Pilates-e-Futebol-CAPA-730x456.gif', //futebol
    'https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg', //basquete
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStdASjNyfeRLzAqf12iFGgQ6E81Me1AuZo941WEIeB2kjzf9dV&s', //Volei
    'https://static3.tcdn.com.br/img/img_prod/311840/mouse_pad_flamengo_escudo_30001_1_20181123115647.jpg', //Flamengo
  ];
  final List<String> textCategorias = [
    'Futebol',
    'Basquete',
    'Volei',
    'Flamengo'
  ];
  final List<Map> opcoesMenu = [
    {
      "nome": 'Comprar Material',
      "imagem":
          "https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg"
    },
    {
      "nome": 'Solicitar Profissional',
      "Link":"/SolicitarServico",
      "imagem":
          "https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg"
    },
    {
      "nome": 'Calcular Material',
      "imagem":
          "https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg"
    },
    {
      "nome": '',
      "imagem":"https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg",
      "Link":"/MeusGastos"
    },
  ];
  String _busca = "";
  int _selectedIndex = 0;
   List<Widget> _widgetOptions =[
              Dicas() ,
  ];
  void _onItemTapped(int index) {
    print("INDEX A SER SETADO " + index.toString());
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoState>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);
    String imagemBase =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: AppDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.grey,
        fixedColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color:Colors.grey),
        showUnselectedLabels: true,      
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.portrait),
            title: Text("Inicio")
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.brightness_7),
            title: Text("Dicas")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text("Fale coonesco")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            title: Text("Digitalização")
          )
        ],
      ),
      body:SafeArea(
        top: false,
        left: false,
        right: false,
        child:CustomScrollView(
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverAppBar(
                // Provide a standard title.
                // title: Text('asdas'),
                // pinned: true,
                leading: Padding(
                    padding: EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                    child: InkWell(
                      onTap: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage((firebaseUser != null)
                            ? firebaseUser.photoUrl.toString()
                            : imagemBase),
                      ),
                    )),

                actions: <Widget>[
                  Stack(children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                      child: IconButton(
                        icon: Icon(Icons.work),
                        onPressed: () {
                         // Navigator.pushNamed(context, '/cart');
                        },
                      ),
                    ),
                    (carrinho.getQtdProdutosCarrinho > 0)
                        ? Positioned(
                            right: 12,
                            top: 8,
                            child: new Container(
                              padding: EdgeInsets.all(2),
                              decoration: new BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 14,
                                minHeight: 14,
                              ),
                              child: Text(
                                carrinho.getQtdProdutosCarrinho.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : Container()
                  ])
                ],
                // Allows the user to reveal the app bar if they begin scrolling
                // back up the list of items.
                // floating: true,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace: (_selectedIndex == 0) ? HomeSlider() : null,
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight:(_selectedIndex == 0) ? 300 : 60,
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (_selectedIndex == 0) ? <Widget>[                      
                      Padding(
                        padding:
                            EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.search),
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
                                hintText: 'Buscar',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          padding: EdgeInsets.only(
                              top: 8, left: 6, right: 6, bottom: 12),
                          children: opcoesMenu.map((Map opcao) {
                            return Container(
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    print('OPCAO CLICADA ' + opcao['nome']);
                                    if(opcao["Link"] != null){
                                      Navigator.of(context).pushNamed(opcao['Link']);
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                70,
                                        width: double.infinity,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          imageUrl: opcao['imagem'],
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              new Icon(Icons.error),
                                        ),
                                      ),
                                      ListTile(
                                          title: Center(
                                              child: (opcao['nome'] != '')
                                                  ? Text(
                                                      opcao['nome'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 16),
                                                    )
                                                  : null))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ] : (_selectedIndex == 1) ? [Dicas()] : (_selectedIndex == 2) ? [Ajuda()] : null ,
                    
                  ),
                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              )
            ]),
      )
    );
  }
}
