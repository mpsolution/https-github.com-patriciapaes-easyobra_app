import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';

class HistoricoProvider with ChangeNotifier{
  HistoricoProvider();
  Map<String,dynamic> historico = {
    "nomePrestador":"",
    "especialidade":"",
    "servico"      :"",
    "historico"    :[]
  };

  void setHistorico(Map<String,dynamic> h) async {
    print("ESTA NA FUNÇÃO SETHISTORICO ");
    historico['historico'] = [];
    String idPrestador = ( (h['idPrestador'] != null ) && (h['idPrestador'] != '123456')) ? h["idPrestador"] : "wNMbTDL2lTcEEhtr5FlIcBeTkgN2";
    print("ID DO PRESTADOR $idPrestador");
    DocumentSnapshot prestador = await  Firestore.instance.collection('usuarios').document(idPrestador).get();
    print("PRESTADOR ENCONTRADO $prestador");
    historico['nomePrestador'] = prestador['displayName'];
    historico["especialidade"] = (prestador["especialidade"] != null) ? prestador['especialidade'] : 'Sem especialidade';
    historico['servico']       = h['tituloServico'];
    if(h['historico'] != null){
        h['historico'].forEach((histo)=>historico['historico'].add({
        "data":formatDate(DateTime.parse(histo['data'].toDate().toString()), [dd,'/',mm ,'/', yy]),
        "status":histo['status']
        }));
    }
    
    notifyListeners();
    }

  Map<String,dynamic> get getHistorico => historico;
}