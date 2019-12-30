import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String imagemEasyObras = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgThnNt1DZl0ogUXbX7yz7ND3C1qDyfYytOOe6XD_qcucrfKhI&s";
  String email = "";
  @override
  Widget build(BuildContext context) {
     final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,      
      body:SafeArea(
        top: false,
        left: false,
        right: false,
        child:Align(
          alignment: Alignment.topCenter,
          child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[ 
              //Imagem Principal
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                height: 300,
                child: CachedNetworkImage(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit:BoxFit.contain,
                  imageUrl: imagemEasyObras,
                  placeholder: (context,url)=>Center(child: SizedBox(width: 50,height: 50,child:CircularProgressIndicator(),),),
                  errorWidget: (context,url,error)=>Icon(Icons.error),
                ),
              ),
              Text("Como deseja começar?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18),),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child:RaisedButton(
                color: Colors.blueAccent,
                elevation: 0,                
                onPressed: (){
                  print("Fazer login facebook");
                },
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                          Icon(FontAwesomeIcons.facebook,color:Colors.white),
                          Text("Logar Com o Facebook",style:TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
              ) ,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                    Text("OU",style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18))
                ],
              ),
              Text("Qual o seu email",style:TextStyle(color:Colors.grey,fontWeight:FontWeight.bold,fontSize:18)),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none
                  ),
                  onChanged: (s){
                    setState(() {
                      email = s;
                    });
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child:RaisedButton(
                color: Colors.grey[600],
                onPressed: (){
                  print("Fazer login com email");
                },
                child:Center(
                    child: Text("Entrar com o Email",style:TextStyle(color: Colors.white)),
                  ),
              ) ,
              )
              
            ],
          ),
        ),
        )
        
         )
    );
  }
}
