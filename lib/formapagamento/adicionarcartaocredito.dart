import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/componentes/botao.dart';

class AdicionarCartao extends StatefulWidget {
  AdicionarCartao({Key key}) : super(key: key);

  @override
  _AdicionarCartaoState createState() => _AdicionarCartaoState();
}

class _AdicionarCartaoState extends State<AdicionarCartao> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    print(creditCardModel);
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
       key: scaffoldKey,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading:  new IconButton(
           icon: new Icon(Icons.arrow_back,color:Colors.black),
           onPressed: () => Navigator.of(context).maybePop(),
         ),
         title: Text("Adicionar Cartao",style: TextStyle(color: Colors.black),),
       ),
       body:Builder(
         builder: (BuildContext context){
           return Container(
             child:Column(
               children: <Widget>[
                    CreditCardWidget(
                                    cardNumber: cardNumber,
                                    expiryDate: expiryDate,
                                    cardHolderName: cardHolderName,
                                    cvvCode: cvvCode,
                                    showBackView: isCvvFocused,
                                    cardBgColor: Colors.black,
                                    height: 175,
                                    textStyle: TextStyle(color: Colors.yellowAccent),
                                    width: MediaQuery.of(context).size.width,
                                    animationDuration: Duration(milliseconds: 1000),
                                  ),
                                     CreditCardForm(
                                          themeColor: Colors.red,
                                          onCreditCardModelChange: onCreditCardModelChange,
                                        ),
                  Align(alignment: Alignment.bottomCenter,
                  child:InkWell(
                    onTap: (){
                      print("FUNCAO ADICIONAR CARTAO");
                      
                    },
                    child:Botao(Colors.grey, "Adicionar Cartão") ,
                  ) ,)
                  
                  
                    
               ],
             ));
         },
       ) ,
    );
  }
}