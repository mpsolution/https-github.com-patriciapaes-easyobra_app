import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
   'https://blogpilates.com.br/wp-content/uploads/2017/02/Pilates-e-Futebol-CAPA-730x456.gif',//futebol
   'https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg',//basquete
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStdASjNyfeRLzAqf12iFGgQ6E81Me1AuZo941WEIeB2kjzf9dV&s',//Volei
   'https://static3.tcdn.com.br/img/img_prod/311840/mouse_pad_flamengo_escudo_30001_1_20181123115647.jpg',//Flamengo
 ];
 final List<String> textCategorias =['Futebol','Basquete','Volei','Flamengo'];
 final List<Map> opcoesMenu = [
   {"nome":'Comprar Material',"imagem":"https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg"},
   {"nome":'Solicitar Profissional',"imagem":"https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg"},
   {"nome":'Calcular Material',"imagem":"https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg"},
   {"nome":'',"imagem":"https://img.bgxcdn.com/images/oaupload/ser1/banggood/images/57/93/9823beb3-f850-4f8f-9843-d717c6c8f4c8.jpg"},
    ];
 String _busca = "";
 


  @override
  Widget build(BuildContext context) {
   final carrinho  = Provider.of<CarrinhoState>(context);
   final firebaseUser = Provider.of<FirebaseUser>(context);
   String imagemBase    = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f5Tq7UJLc10WyFDBXoJKjlgnqmd8s6mRBxMfqj_NVLH5VEny&s';
     final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: CustomScrollView(
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverAppBar(
                // Provide a standard title.
                // title: Text('asdas'),
                // pinned: true,
                leading: Padding(
                  padding: EdgeInsets.only(top: 14.0, left: 8.0,right:8.0),
                  child:InkWell(
                    onTap: (){
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child:CircleAvatar(        
                    radius: 50,           
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        (firebaseUser != null)? firebaseUser.photoUrl.toString() : imagemBase
                        ),
                  ) ,
                  )
                   
                ),
                 
                actions: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                  padding: EdgeInsets.only(top: 14.0, left: 8.0,right:8.0),
                  child:IconButton(
                        icon: Icon(Icons.work),
                        onPressed: () {
                                Navigator.pushNamed(context, '/cart');
                        },
                      ),
                      ),
                      
                      (carrinho.getQtdProdutosCarrinho > 0)? Positioned(
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
                        ): Container()                     
                              ]
                            )
                  
                ],
                // Allows the user to reveal the app bar if they begin scrolling
                // back up the list of items.
                // floating: true,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace: HomeSlider(),
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: 300,
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 14.0, left: 8.0,right:8.0),
                        child:Card(
                            child: ListTile(
                                          leading: Icon(Icons.search),
                                          title: TextFormField(
                                          keyboardType: TextInputType.text,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Por Favor digite algo para buscar';
                                            }
                                            print('VALOR Da Busca'+value);
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
                                                        title:Center(
                                                          child:(opcao['nome'] != '')? Text(
                                                                opcao['nome'],
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.w700,
                                                                  fontSize: 16),
                                                            ):null
                                                        ) )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                        ),
                      )                     ,
                      Padding(
                        padding: EdgeInsets.only(top: 14.0, left: 8.0),
                        child: Text('Novidades',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        height: 240.0,
                        child:StreamBuilder<QuerySnapshot>(
                          stream:Firestore.instance.collection('produtos').snapshots(),
                          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError)
                                      return new Text('Error: ${snapshot.error}');
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting: return new CircularProgressIndicator();
                                      default:
                                        return new ListView(
                                                              scrollDirection: Axis.horizontal,
                                                              children: snapshot.data.documents.map((DocumentSnapshot i) {
                                                                return Builder(
                                                                  builder: (BuildContext context) {
                                                                    return Container(
                                                                      width: 140.0,
                                                                      child: Card(
                                                                        clipBehavior: Clip.antiAlias,
                                                                        child: InkWell(
                                                                          onTap: () {
                                                                            Navigator.pushNamed(
                                                                                context, '/products',
                                                                                arguments: i);
                                                                          },
                                                                          child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: <Widget>[
                                                                              SizedBox(
                                                                                height: 160,
                                                                                child: Hero(
                                                                                  tag: i.documentID,
                                                                                  child: CachedNetworkImage(
                                                                                    fit: BoxFit.cover,
                                                                                    imageUrl: i['imagem'],
                                                                                    placeholder: (context, url) =>
                                                                                        Center(
                                                                                            child:
                                                                                                CircularProgressIndicator()),
                                                                                    errorWidget:
                                                                                        (context, url, error) =>
                                                                                            new Icon(Icons.error),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              ListTile(
                                                                                title: Text(
                                                                                  i['nomeProduto'],
                                                                                  style: TextStyle(fontSize: 14),
                                                                                ),
                                                                                subtitle: Text('R\$ '+i['preco'],
                                                                                    style: TextStyle(
                                                                                        color: Theme.of(context)
                                                                                            .accentColor,
                                                                                        fontWeight:
                                                                                            FontWeight.w700)),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }).toList(),
                                                            );
                                    }
                                  },

                        )  
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/banner-1.png'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Text('Categorias',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, top: 8.0),
                            child: RaisedButton(
                                color: Theme.of(context).primaryColor,
                                child: Text('Ver Todas',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/categorise');
                                }),
                          )
                        ],
                      ),
                      Container(
                        child:
                         StreamBuilder(
                           stream: Firestore.instance.collection('categorias').snapshots(),
                           builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                             if(snapshot.error != null) return new Text('Houve um error');
                             if(snapshot.hasData) return GridView.count(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        crossAxisCount: 2,
                                        padding: EdgeInsets.only(
                                            top: 8, left: 6, right: 6, bottom: 12),
                                        children: snapshot.data.documents.map((DocumentSnapshot categoria) {
                                          return Container(
                                            child: Card(
                                              clipBehavior: Clip.antiAlias,
                                              child: InkWell(
                                                onTap: () {
                                                  
                                                  Navigator.pushNamed(context, '/shop',arguments:categoria );
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
                                                        imageUrl: categoria['imagem'],
                                                        placeholder: (context, url) => Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                        errorWidget: (context, url, error) =>
                                                            new Icon(Icons.error),
                                                      ),
                                                    ),
                                                    ListTile(
                                                        title: Text(
                                                      categoria['text'],
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 16),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                        );


                             return new CircularProgressIndicator();

                           }
                         )
                         
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/banner-2.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              )
            ]),
      ),
    );
  }
}
