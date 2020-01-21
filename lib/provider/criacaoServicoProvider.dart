import 'package:flutter/material.dart';

class CriacaoServicoState with ChangeNotifier {
  CriacaoServicoState();
  String       tipoServico         = "";
  String       servicoSelecionado  = "";
  String       iconeConstrucao     = "https://thumbs.dreamstime.com/z/linha-civil-conceito-do-guindaste-de-constru%C3%A7%C3%A3o-%C3%ADcone-ilustra%C3%A7%C3%A3o-linear-vetor-s%C3%ADmbolo-sinal-132454234.jpg";
  String       iconeReparo         = "https://st.depositphotos.com/1010146/4494/v/950/depositphotos_44941501-stock-illustration-home-repair-icon.jpg";
  String       iconeReforma        = "https://silasmaridodealuguel.files.wordpress.com/2015/08/1354672719_462262797_1-reformas-em-geral-andrade-de-araujo.jpg";

  List<String> tiposServicos       = [];
  

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
  String        get getTipoServico        => tipoServico;
  String        get getServicoSelecionado => servicoSelecionado;
  String        get getIconeReparo        => iconeReparo;
  String        get getIconeConstrucao    => iconeConstrucao;
  String        get getIconeReforma       => iconeReforma;
  List<String>  get getTiposServicos      => getTiposServicos;



}