import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CriacaoServicoState with ChangeNotifier {
  CriacaoServicoState();
  String       tipoServico         = "";
  String       servicoSelecionado  = "";
  String       iconeConstrucao     = "https://thumbs.dreamstime.com/z/linha-civil-conceito-do-guindaste-de-constru%C3%A7%C3%A3o-%C3%ADcone-ilustra%C3%A7%C3%A3o-linear-vetor-s%C3%ADmbolo-sinal-132454234.jpg";
  String       iconeReparo         = "https://st.depositphotos.com/1010146/4494/v/950/depositphotos_44941501-stock-illustration-home-repair-icon.jpg";
  String       iconeReforma        = "https://silasmaridodealuguel.files.wordpress.com/2015/08/1354672719_462262797_1-reformas-em-geral-andrade-de-araujo.jpg";
  String       idSolicitacaoServico= "";
  String       idPrestador          = "";
  double       valorServico         = 0;
  Map<String,dynamic>     servico         = {};

  List<String> tiposServicos       = [];
  
  Future<bool> aceitarOrcamento()async{
    bool salvou = false;
     //passos
    //criar um servico com idcliente,idprestador,no caminho servicos
   if(idPrestador == null) {
     return salvou;
   }
   if(idSolicitacaoServico == null){
     return salvou;
   }
   DocumentReference salvo = await  Firestore.instance.collection('servicos').add(
        {
          ...servico,
          "idPrestados":idPrestador,
          "valorServico":valorServico
        }
    );
    if( (salvo != null) && (salvo.documentID != null) ){
      salvou = true;
      Firestore.instance.collection('SolicitacoesServicos').document(idSolicitacaoServico).delete();
    }    
    return salvou;
    //apagar da solicitacoes de servicos a solicitacao criada
    //adicionar status

  }

  void setTipoServico(String servico){
    tipoServico = servico;
    notifyListeners();
  }
  void setServicoSelecionado(String servico){
    servicoSelecionado = servico;
    notifyListeners();
  }
  void setTiposServicos(List<String> servicos){
      tiposServicos = servicos;
      notifyListeners();
  }
  void setServico(Map<String,dynamic> s){
    servico = s;
   // notifyListeners();
    
  }
  void setIdSolicitacaoServico(String id){
    idSolicitacaoServico = id;
  //  notifyListeners();
  }
  void setIdPrestadorServicoValorServico(String id,double v){
    idPrestador = id;
    valorServico = v;
   // notifyListeners();
  }
  String        get getTipoServico        => tipoServico;
  String        get getServicoSelecionado => servicoSelecionado;
  String        get getIconeReparo        => iconeReparo;
  String        get getIconeConstrucao    => iconeConstrucao;
  String        get getIconeReforma       => iconeReforma;
  List<String>  get getTiposServicos      => getTiposServicos;



}