import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';

class HistoricoProvider with ChangeNotifier{
  HistoricoProvider();
  String tipoHistorico = 'cliente';
  DocumentSnapshot servico;
  Map<String,dynamic> historico = {
    "nomePrestador":"",
    "especialidade":"",
    "servico"      :"",
    "cliente"      :null,
    "endereco"     :"",
    "telefone"     :"",
    'situacao'     :'',
    'idServico'    :'',   
    "historico"    :[]
  };
  
  void resetarHistorico(){
      tipoHistorico = 'cliente';
      historico = {
      "nomePrestador":"",
      "especialidade":"",
      "servico"      :"",
      "cliente"      :null,
      "endereco"     :"",
      "telefone"     :"",
      "situacao"     :"",
      'idServico'    :'',
      "historico"    :[]
    };
     servico = null;
  }

  void setHistoricoProfissional(Map<String,dynamic> h , DocumentSnapshot s) async {
    print("ESTA NA FUNÇÃO DE SETAR HISTORICO PARA O PROFISSIONAL");
    print("ESTA NA FUNÇÃO SETHISTORICO PROFISSIONAL");
    resetarHistorico();
    servico = s;
    tipoHistorico = 'profissional';
    String idCliente = ( (h['idCliente'] != null ) && (h['idCliente'] != '123456')) ? h["idCliente"] : "wNMbTDL2lTcEEhtr5FlIcBeTkgN2";
    print("ID DO CLIENTE $idCliente");
    DocumentSnapshot cliente = await  Firestore.instance.collection('usuarios').document(idCliente).get();
    print("PRESTADOR ENCONTRADO $cliente");
    historico['cliente'] = cliente['displayName'];
    historico["endereco"] = (cliente["endereco"] != null) ? cliente['endereco'] : 'Sem Endereco';
    historico["telefone"] = (cliente["phoneNumber"] != null) ? cliente['phoneNumber'] : 'Sem Telefone';
    historico['servico']  = h['tituloServico'];
    historico['idServico'] = s.documentID;
    historico['situacao'] = (s['situacao']  != null)  ? s['situacao'] : 'Aguardando Pagamento';
    if(h['historico'] != null){
        h['historico'].forEach((histo)=>historico['historico'].add({
        "data":formatDate(DateTime.parse(histo['data'].toDate().toString()), [dd,'/',mm ,'/', yy]),
        "status":histo['status']
        }));
    }    
    notifyListeners();
  }
   
  void setHistorico(Map<String,dynamic> h) async {
    print("ESTA NA FUNÇÃO SETHISTORICO ");
    resetarHistorico();
    String idPrestador = ( (h['idPrestador'] != null ) && (h['idPrestador'] != '123456')) ? h["idPrestador"] : "wNMbTDL2lTcEEhtr5FlIcBeTkgN2";
    print("ID DO PRESTADOR $idPrestador");
    DocumentSnapshot prestador = await  Firestore.instance.collection('usuarios').document(idPrestador).get();
    print("PRESTADOR ENCONTRADO $prestador");
    historico['nomePrestador'] = prestador['displayName'];
    historico["especialidade"] = (prestador["especialidade"] != null) ? prestador['especialidade'] : 'Sem especialidade';
    historico['servico']       = h['tituloServico'];
    historico['situacao']      = (h['situacao'] != null) ? h['situacao'] : 'Aguardando Pagamento';
    historico['idServico']     = h['idServico']; 
    if(h['historico'] != null){
        h['historico'].forEach((histo)=>historico['historico'].add({
        "data":formatDate(DateTime.parse(histo['data'].toDate().toString()), [dd,'/',mm ,'/', yy]),
        "status":histo['status']
        }));
    }
    
    notifyListeners();
    }
    void mudarSituacaoServico(String situacao) async {
      try {
        print("MUDAR SITUACAO PARA $situacao");
        print("ID DO SERVICO ${historico['idServico']}");
        await Firestore.instance.collection('servicos').document(historico['idServico']).updateData({
          'situacao':situacao
        });
        historico['situacao'] = situacao;

      } catch (e) {
        print("ERRO MUDAR SITUACAO $e");
      }
      
      notifyListeners();

    }

  Map<String,dynamic> get getHistorico => historico;
}