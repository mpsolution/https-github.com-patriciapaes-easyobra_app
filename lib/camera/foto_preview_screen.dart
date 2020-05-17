import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:provider/provider.dart';

class FotoPreviewScreen extends StatefulWidget {
  
  String imagePath;
  FotoPreviewScreen( this.imagePath);

  @override
  _FotoPreviewScreenState createState() => _FotoPreviewScreenState( this.imagePath);
}

class _FotoPreviewScreenState extends State<FotoPreviewScreen> {
  
  String imagePath;
  _FotoPreviewScreenState( this.imagePath);

  Future<void> _onSuccess() async {
    Navigator.of(context).pop();
  }

  Future<void> _onFailure() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Aviso'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(''),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }


  void create(String imagePath){
    print("imagem path $imagePath ");
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    usuarioProvider.tempFotoPath = imagePath;
     int count = 0;
      Navigator.popUntil(context, (route) {
          return count++ == 2;
      });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text("Camera"),        
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Image.file(
                      File(widget.imagePath), fit: BoxFit.cover)
              ),
//            SizedBox(height: 10.0),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                    top: 20.0, left: 15.0, right: 15.0, bottom: 20.0),
                color: Colors.white,
                child: ButtonTheme(
                    minWidth: double.infinity,
                    height: 50.0,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.circular(60.0),
                        side: BorderSide(
                            color:  Theme.of(context).primaryColor),
                      ),
                      color:  Theme.of(context).primaryColor,
                      onPressed: () {
                        create(widget.imagePath);
                      },
                      textColor: Colors.white,
                      child: Text("Confirme a foto",
                          style: TextStyle(fontSize: 15)),
                    )),
              ),
            ],
          ),
        ),
      );
  }
}
