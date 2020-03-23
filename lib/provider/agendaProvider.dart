import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_scaffold/provider/usuarioProvider.dart';
import 'package:provider/provider.dart';
class AgendaProviderState with ChangeNotifier {
  var horarioController = new MaskedTextController(mask: '00:00',text: '00:00');
  final _formAgendaKey = GlobalKey<FormState>();
  AgendaProviderState();
  String idAgenda = "";
  String horario  = '';
  DateTime hoje  = DateTime.now();
  List<Map<DateTime,List>> eventosUsuario = [];
  Map<DateTime,List> eventosUsuarioMap = {};
  void atualizarEventosUsuario(List<Map<DateTime,List>> eventos) async {
    print("EESTA NA FUNCAO DE ATUALZIAR BD");
    print("EVENTOS A SEREM SALVOS $eventos");
    List<Map<String,List>> eventosDb = [];
    int tamanhoEventos = eventos.length;
    
    for (var i = 0; i < tamanhoEventos; i++) {
      
      eventos[i].keys.forEach((dia) {
        print('ESTA NO DIA ${dia.toIso8601String()} ADICONANDO OS EVENTOS ${eventos[i][dia]}');
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
        int tamanhoUsuarios = eventosUsuario.length;
        for (var i = 0; i < tamanhoUsuarios; i++) {
              print("EXECUTANDO O FOT $i");
              eventosUsuario[i].keys.forEach((diaEventoUsuario) { 
                
                int diffDias = diaEventoUsuario.difference(data).inDays;
                print("DIFERENCA EM DIAS DO EVENDO $diffDias");
                if(diffDias == 0){
                  existeEventoNoDia = true;
                  eventosAtualizados = List.from(eventosUsuario[i][diaEventoUsuario]) ;
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
      
      eventosUsuario = [];
      eventosUsuarioMap = {};
      
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseUser usuario = await firebaseAuth.currentUser();
      print("USUARIO NO GET AGENDA $usuario");
      QuerySnapshot agendas = await Firestore.instance.collection('agendas')
                        .where('idUsuario',isEqualTo: usuario.uid)
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
          "idUsuario":usuario.uid,
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
        return SingleChildScrollView(
          child:  AlertDialog(
          title: new Text("Adicionar Tarefa ${dia.day}/${dia.month}/${dia.year}"),
          content:  Form(
              key:_formAgendaKey,
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[                
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Titulo'
                  ),
                  validator: (s){
                    if(s.isEmpty){
                      return 'Digite um titulo';
                    }
                    return null;
                  },
                  onChanged: (s){
                    titulo = s;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Descricao'
                  ),
                  validator: (s){
                    if(s.isEmpty){
                      return 'Coloque uma descrição';
                    }
                    return null;
                  },
                  onChanged: (s){
                    descricao = s;
                  },
                ),
                TextFormField(
                  controller: horarioController,
                  decoration: InputDecoration(
                    hintText:'Horario'
                  ),
                  validator: (s){
                    if(s.isEmpty){
                      return 'Coloque um horario';
                      }                  
                      return null;
                      },

                  onChanged: (s){
                    horario = s;
                  },
                )

              ],
            )
              ),
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
                if(_formAgendaKey.currentState.validate()){
                    adicionarEventoUsuario(dia, {
                 'titulo':titulo,
                 'descricao':descricao,
                 'horario':horario
               });
                Navigator.of(context).pop();
                }
          
               
              
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
        ),
        )
        ;
      },
    );

  }
 
}