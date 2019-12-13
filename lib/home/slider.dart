import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  final List<String> imgList = [
    'https://wallpaperplay.com/walls/full/4/7/f/40761.jpg',
    'https://www.futebolstats.com.br/wp-content/uploads/2019/11/Levante-x-Barcelona.jpg',
    'https://static-wp-tor15-prd.torcedores.com/wp-content/uploads/2019/03/flamengo-x-ldu.jpg',
    'https://palmeirasnoticias.com.br/wp-content/uploads/2018/10/Palmeiras-x-Cear%C3%A1-696x392.jpg',
    'https://i.ytimg.com/vi/iGdAI7vSGi4/maxresdefault.jpg',
    'https://i.ytimg.com/vi/ZN_AROTQB8k/maxresdefault.jpg'
  ];
  int  _current = 0;
  Iterable<E> mapIndexed<E, T>(
    Iterable<T> items, E Function(int index, T item) f) sync* {
  var index = 0;

  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}
  
  @override
  Widget build(BuildContext context) {
  
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: StreamBuilder(
                stream: Firestore.instance.collection('banners').snapshots(),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError) return new Text('Houve algum erro');
                      if(snapshot.hasData) return new Stack(
                                children: <Widget>[
                            Center(
                              child:Stack(
                                children: <Widget>[
                                  CarouselSlider(
                                autoPlay: true,
                                pauseAutoPlayOnTouch: Duration(seconds: 10),
                                height: 350.0,
                                viewportFraction: 1.0,
                                onPageChanged: (index){
                                  setState(() {
                                    _current = index;
                                  });
                                },
                                items:snapshot.data.documents.map((DocumentSnapshot banner){
                                    return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: banner['imagem'],
                                            placeholder: (context, url) => Center(
                                                child: CircularProgressIndicator()
                                            ),
                                            errorWidget: (context, url, error) => new Icon(Icons.error),
                                          )
                                      );
                                    },
                                  );
                                  }).toList()
                              ),
                                  Positioned(
                                    bottom: 0.0,
                                    left:0.0,
                                    right:0.0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:mapIndexed(snapshot.data.documents,(index,DocumentSnapshot banner) =>  Container(
                                          width: 8.0,
                                          height: 8.0,
                                          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 2.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                                          ),
                                        )).toList() ,
                                    ),)
                                ],
                              )
                              
                                
              )
          ],
          );
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
