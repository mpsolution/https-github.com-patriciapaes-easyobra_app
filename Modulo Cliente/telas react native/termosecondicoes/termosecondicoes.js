import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Termosecondicoes extends Component {

  constructor(props) {
      super(props);
      this.state = {
          
      };
  }


  handlePress(target, owner) {
    if (this.props.onPress) {
        let name;
        let id;
        let index = -1;
        if (target.search("::") > -1) {
            const varCount = target.split("::").length;
            if (varCount === 2) {
                name = target.split("::")[0];
                id = target.split("::")[1];
            } else if (varCount === 3) {
                name = target.split("::")[0];
                index = parseInt(target.split("::")[1]);
                id = target.split("::")[2];
            }
        } else {
            name = target;
        }
        this.props.onPress({ type: 'button', name: name, index: index, id: id, owner: owner });
    }
  }

  handleChangeTextinput(name, value) {
      let id;
      let index = -1;
      if (name.search('::') > -1) {
          const varCount = name.split("::").length;
          if (varCount === 2) {
              name = name.split("::")[0];
              id = name.split("::")[1];
          } else if (varCount === 3) {
              name = name.split("::")[0];
              index = name.split("::")[1];
              id = name.split("::")[2];
          }
      } else {
          name = name;
      }
      let state = this.state;
      state[name.split('::').join('')] = value;
      this.setState(state, () => {
          if (this.props.onChange) {
              this.props.onChange({ type: 'textinput', name: name, value: value, index: index, id: id });
          }
      });
  }

  render() {
    
    return (
    <ScrollView data-layer="bccbf6a5-4ee6-46a8-b21e-656a6fab99b2" style={styles.termosecondicoes}>
        <View data-layer="0c4a1538-8fdb-4c01-bffb-a4139892a870" style={styles.termosecondicoes_grupo7}>
            <Svg data-layer="336d4cea-b3d1-44a0-af58-da9e90b61c31" style={styles.termosecondicoes_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 55.57647705078125" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="112de1b2-5620-46e3-86a0-c8d05b6115e5" style={styles.termosecondicoes_grupo10}>
            <Svg data-layer="dbccd172-5567-4115-82aa-0fb15dc86150" style={styles.termosecondicoes_grupo10_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="c2a40d74-0c05-4adf-a7ff-831455ba39af" style={styles.termosecondicoes_easyobra}>Easy Obra</Text>
        <ReactImage data-layer="11900ea0-c921-40c9-a6ce-c3fe8686acd6" source={require('./assets/seta.png')} style={styles.termosecondicoes_seta} />
        <View data-layer="6364866d-02d5-4804-8365-b62ff0afe7bf" style={styles.termosecondicoes_grupo21}>
            <Svg data-layer="04d491fd-a861-45f4-974a-adff57aa66df" style={styles.termosecondicoes_grupo21_caminho3f397965e} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="ceb5f755-f4fb-4aee-aeeb-8ffc076f6ab9" style={styles.termosecondicoes_grupo54}>
            <Text data-layer="d0a0c1dc-65c5-434c-9b45-37943049bb40" style={styles.termosecondicoes_grupo54_termosecondicoesgeraisdosservicosdeintermediacaodigitalultimaatualizacao25dejunhode20181voceeumapessoafisicaouumapessoajuridicadedicadaaprestacaodeservicosdetransporteenossomosauberdobrasiltecnologialtdaso}>TERMOS E CONDIÇÕES GERAIS DOS SERVIÇOS DE INTERMEDIAÇÃO
DIGITAL
Última atualização: 25 de junho de 2018
1. "Você" é uma pessoa física ou uma pessoa jurídica dedicada à prestação de
Serviços de Transporte, e "nós" somos a Uber do Brasil Tecnologia Ltda., sociedade
de responsabilidade limitada, estabelecida no Brasil, com sede na Avenida
Juscelino Kubitscheck, nº 1909, 12º, 13º, 14º andares, salas 121,141 e 152, São
Paulo/SP, inscrita no Cadastro Nacional de Pessoas Jurídicas do Ministério da
Fazenda (CNPJ/MF) sob n. 17.895.646/0001-87. Estes Termos regem seu acesso e
uso da nossa tecnologia e serviços ou quaisquer tecnologias e serviços licenciados
a nós (os "Serviços") de intermediação de serviços de transporte sob demanda para
Usuários(as) do aplicativo móvel da Uber ("Usuários(as)") na região em que você
está se cadastrando para dirigir, seja qual for, no território da República Federativa
do Brasil. Ao utilizar o aplicativo de motorista da Uber ("Aplicativo de Motorista"),
você poderá receber solicitações e serviços relacionados, permitindo que pessoas e
empresas como você forneçam serviços de transporte à Usuários(as) ("Viagens").
O acesso aos nossos Serviços inclui o Aplicativo de Motorista e nosso software, site
da internet, serviços de pagamento e diversos serviços de suporte. NÓS SOMOS
FORNECEDORES DE SERVIÇOS DE TECNOLOGIA, NÃO UMA EMPRESA DE
TRANSPORTE, NEM OPERAMOS COMO AGENTES PARA O TRANSPORTE DE
PASSAGEIROS. Ao clicar em "Sim, eu concordo", você se vincula a estes Termos.

Caso exista indivíduos que pretendam utilizar o Aplicativo de Motorista diretamente
vinculados à sua conta, você garante que eles concordam em ser vinculados por
estes Termos antes de utilizá-lo (e como parte dos Serviços, eles receberão estes
Termos e um Adendo de Motorista no Aplicativo de Motorista, os quais eles deverão
aceitar antes que possam ser conectados a Viagens). Para facilitar a leitura, nosso
uso de "Você" nestes Termos inclui quaisquer motoristas diretamente vinculados à
sua conta.
2. Realizando Viagens . Você poderá abrir o Aplicativo de Motorista quando
desejar, mas deverá ficar online para receber solicitações de Viagens. Quando você
estiver logado no Aplicativo de Motorista, ativo e nas imediações de Usuários(as),
oportunidades de Viagens poderão aparecer no Aplicativo de Motorista. Se você
decidir aceitar uma solicitação (ou se nós ou uma de nossas afiliadas aceitar uma
solicitação em seu nome), o local de partida do Usuário em questão será
disponibilizado. O(A) Usuário(a) também receberá informações para sua
identificação, incluindo seu primeiro nome, fotografia, localização, informação do
veículo, o nome da sua empresa (se houver), assim como qualquer outra
informação que você tenha fornecido voluntariamente através do Aplicativo de
Motorista. O(A) Usuário(a) nunca receberá seu real número de telefone, salvo se
autorizado por Você. Ao invés disso, você e o(a) Usuário(a) poderão contatar um ao
outro em relação a uma Viagem específica, através de um número de telefone
anônimo. É proibido entrar em contato com um(a) Usuário(a) ou utilizar suas
informações pessoais de qualquer outra forma e por qualquer razão que não
relacionada àquela Viagem específica. Você exclusivamente poderá escolher a
maneira mais efetiva e segura de chegar ao destino, e, exceto pela utilização de
nossos Serviços, você, como um trabalhador autônomo, deverá fornecer (às suas
próprias custas) todo o equipamento, ferramentas e outros materiais necessários
para fazê-lo. Ao realizar Viagens, você deverá obedecer todas e quaisquer leis
aplicáveis.</Text>
        </View>
    </ScrollView>
    );
  }
}

Termosecondicoes.propTypes = {

}

Termosecondicoes.defaultProps = {

}


const styles = StyleSheet.create({
  "termosecondicoes": {
    "opacity": 1,
    "position": "relative",
    "backgroundColor": "rgba(255, 255, 255, 1)",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 360,
    "height": 640,
    "left": 0,
    "top": 0
  },
  "termosecondicoes_grupo7": {
    "opacity": 0.4000000059604645,
    "position": "absolute",
    "backgroundColor": "transparent",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 360,
    "height": 53.83,
    "left": 0,
    "top": 0
  },
  "termosecondicoes_grupo7_caminho6": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 363.5,
    "height": 57.33,
    "left": -1.5,
    "top": -1.5
  },
  "termosecondicoes_grupo10": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "transparent",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 360,
    "height": 15,
    "left": 0,
    "top": 626
  },
  "termosecondicoes_grupo10_caminho3": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 360,
    "height": 15,
    "left": 0,
    "top": 0
  },
  "termosecondicoes_easyobra": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 20,
    "fontWeight": "700",
    "fontStyle": "normal",
    "fontFamily": "segoe-ui",
    "textAlign": "left",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 93,
    "height": 27,
    "left": 108,
    "top": 14
  },
  "termosecondicoes_seta": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 25,
    "height": 16.29,
    "left": 12,
    "top": 19.26
  },
  "termosecondicoes_grupo21": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "transparent",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 360,
    "height": 15,
    "left": 0,
    "top": 53
  },
  "termosecondicoes_grupo21_caminho3f397965e": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 360,
    "height": 15,
    "left": 0,
    "top": 0
  },
  "termosecondicoes_grupo54": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "transparent",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 318,
    "height": 550,
    "left": 20,
    "top": 73
  },
  "termosecondicoes_grupo54_termosecondicoesgeraisdosservicosdeintermediacaodigitalultimaatualizacao25dejunhode20181voceeumapessoafisicaouumapessoajuridicadedicadaaprestacaodeservicosdetransporteenossomosauberdobrasiltecnologialtdaso": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(42, 42, 42, 1)",
    "fontSize": 8,
    "fontWeight": "700",
    "fontStyle": "normal",
    "fontFamily": "segoe-ui",
    "textAlign": "left",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 318,
    "height": 550,
    "left": 0,
    "top": 0
  }
});