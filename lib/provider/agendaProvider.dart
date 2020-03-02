import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AgendaProviderState with ChangeNotifier {
  AgendaProviderState();
  String idAgenda = "";
  DateTime hoje  = DateTime.now();
  List<Map<DateTime,List>> eventosUsuario = [];
  Map<DateTime,List> eventosUsuarioMap = {};
  void atualizarEventosUsuario(List<Map<DateTime,List>> eventos) async {
    print("EESTA NA FUNCAO DE ATUALZIAR BD");
    print("EVENTOS A SEREM SALVOS $eventos");
    List<Map<String,List>> eventosDb = [];
    for (var i = 0; i < eventos.length; i++) {
      eventos[i].keys.forEach((dia) {
        eventosDb.add({
          dia.toIso8601String():eventos[i][dia]
        });
       });
    }
    await Firestore.instance.collection('agendas').document(idAgenda).updateData(
      {'eventos':eventosDb}
    );
    getListaEventos();
  }
  adicionarEventoUsuario(DateTime data, Map<String,String> evento)  {  
   print("ESTA NA FUNCAO DE CADASTRO DE EVENTO COM O EVENTO $evento") ;
    List eventosAtualizados = [];
    bool existeEventoNoDia = false;
    print("EVENTOS DO USUARIO NO MOMENTO $eventosUsuario");
      if(eventosUsuario.length > 0){
        print("ESTA INDO NO FOR");
        for (var i = 0; i < eventosUsuario.length; i++) {
              print("EXECUTANDO O FOT $i");
              eventosUsuario[i].keys.forEach((diaEventoUsuario) { 
                
                int diffDias = diaEventoUsuario.difference(data).inDays;
                if(diffDias == 0){
                  existeEventoNoDia = true;
                  eventosAtualizados = eventosUsuario[i][diaEventoUsuario];
                  eventosAtualizados.add(evento);
                  eventosUsuario[i][diaEventoUsuario] = eventosAtualizados;
                  atualizarEventosUsuario(eventosUsuario);
                  
                }
                
              });      
            }
            if(!existeEventoNoDia){
              eventosUsuario.add({
                data:[evento]
              });  
              atualizarEventosUsuario(eventosUsuario);
            }
            notifyListeners();
           
    }else{
      print("ESTA SEM O FOR");
      eventosUsuario.add({
        data:[evento]
      });
      atualizarEventosUsuario(eventosUsuario);
    
    }
    
    
    notifyListeners();
  }
  Future<List<Map<DateTime,List>>> getListaEventos() async {
    
    try {
      
      
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseUser usuario = await firebaseAuth.currentUser();
      QuerySnapshot agendas = await Firestore.instance.collection('agendas')
                        .where('idUsuario',isEqualTo: usuario.providerId)
                        .getDocuments();
      if(agendas.documents.length > 0){
          agendas.documents.forEach((agenda) { 
            print("AGENDA DADOS ${agenda.data}");
            var eventos = agenda.data['eventos'];
            eventos.forEach((e){
              e.keys.forEach((key){
                eventosUsuario.add({
                  DateTime.parse(key):e[key]
                });
              });
            });
            print("EVENTOS DO USUARIO APOS CARREGADOS $eventosUsuario");
            eventosUsuario.forEach((element) { 
              element.keys.forEach((key) { 
                eventosUsuarioMap[key] = element[key];
              });
            });
            print("EVENTOS DO USUARIO EM MAP $eventosUsuarioMap");
          
            idAgenda = agenda.documentID;
            notifyListeners();
        //    return agenda.data['eventos'];
        return [];
          });

      }else{
       DocumentReference agendaRef =  await Firestore.instance.collection('agendas').add({
          "idUsuario":usuario.providerId,
          "eventos":[]
        });
        if(agendaRef.documentID != null){
          idAgenda = agendaRef.documentID;
        }
        return [];
      }
      
      return []; 
    } catch (e) {
      print("HOUVE UM ERRO NA BUSCA DOS EVENTOS $e");
      return [];
    }
  }
  Future<bool> salvarEvento(Map<String,String> evento){

  }

  void alertaSalvo(BuildContext context){     

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Pedido de Agenda Feito"),
          content: new Text("Entraremos em contato com mais informações!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                
                Navigator.of(context).pushNamed('/');
              },
              )
          ],
        );
      },
    );
  
  }
  void adicionarEventoDialog(BuildContext context , DateTime dia){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        String titulo = '';
        String descricao = '';
        return AlertDialog(
          title: new Text("Adicionar Tarefa ${dia.day}/${dia.month}/${dia.year}"),
          content: 
             Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Titulo'
                  ),
                  onChanged: (s){
                    titulo = s;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Descricao'
                  ),
                  onChanged: (s){
                    descricao = s;
                  },
                ),

              ],
            )
            ,
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                
                Navigator.of(context).pop();
              },
              ),
            new FlatButton(
              child: new Text("Salvar"),
              onPressed: () async {
                print("BOTAO SALVAR APERTADO COM VARIAVEIS $titulo $descricao");
                bool resul = true;
            adicionarEventoUsuario(dia, {
                 'titulo':titulo,
                 'descricao':descricao
               });
               
               Navigator.of(context).pop();
             //  if(resul == true){
                 /**
                  * showDialog(context: context ,builder:(BuildContext context){
                 return AlertDialog(
                   title: Text("Salvo"),
                   content: Text('Agenda Salva'),
                   actions: <Widget>[
                     FlatButton(child: Text("OK"),onPressed: (){
                       Navigator.of(context).pop();
                     },)
                   ],
                 );
               });
                  */
                  
             //  Navigator.of(context).pop();

           //    }else{
                 /**showDialog(context: context ,builder:(BuildContext context){
                 return AlertDialog(
                   title: Text("Erro"),
                   content: Text('Nao foi possivel salvar'),
                   actions: <Widget>[
                     FlatButton(child: Text("OK"),onPressed: (){
                       Navigator.of(context).pop();
                     },)
                   ],
                 );
               });
                  * 
                  */
                  
  //               
          //     }
              
              },
              )
          ],
        );
      },
    );

  }
 
}