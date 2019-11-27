import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Maisdetalhes2 extends Component {

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
    <ScrollView data-layer="4597c719-ce83-44ff-b4d3-5c9dff7c6d5e" style={styles.maisdetalhes2}>
        <View data-layer="1c03e03a-a540-43f8-aac1-f685019ebcfc" style={styles.maisdetalhes2_grupo7}>
            <Svg data-layer="cb823b19-2519-494f-9bc8-cac6043f9304" style={styles.maisdetalhes2_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 55.576499938964844" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="8528e3bd-8a3a-4729-80fc-4214633c6a2d" style={styles.maisdetalhes2_grupo10}>
            <Svg data-layer="1afc6804-58c0-41dd-8c50-122773babf8e" style={styles.maisdetalhes2_grupo10_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="0ec0dfac-64a8-4e7e-854f-e812fe1bf7c8" style={styles.maisdetalhes2_maisdetalhes}>Mais detalhes</Text>
        <ReactImage data-layer="907ce640-b22b-4d84-a185-17b4724b47b1" source={require('./assets/seta.png')} style={styles.maisdetalhes2_seta} />
        <View data-layer="b3755395-dd51-4524-a7aa-6f64647e469a" style={styles.maisdetalhes2_grupo21}>
            <Svg data-layer="51956fdd-d4bb-4659-b656-282493ed0516" style={styles.maisdetalhes2_grupo21_caminho3b125bb6c} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="9c352546-b861-4bbb-9310-ffcf941410ea" style={styles.maisdetalhes2_historicodoservico}>Histórico do serviço</Text>
        <View data-layer="394ef6b8-751f-45c5-b300-d66bd94f2e80" style={styles.maisdetalhes2_retangulo51}></View>
        <Text data-layer="0a68a3cd-5b59-4591-89f7-07ee1920592f" style={styles.maisdetalhes2_profissionalrenatosilvaespecialidadegasistaservicoinstalacaodeaquecedordeaguaagasgn221120191647hsavaliacaodoservicoexcelenteavaliacaodoprofissionalprofis}>Profissional: Renato Silva
Especialidade: Gasista
Serviço: Instalação de aquecedor de água a gás GN
--------------------------------------------------------------------
22/11/2019 - 16:47 hs
Avaliação do serviço: Excelente
Avaliação do profissional: Profissional atencioso, rápido e claramente conhece sobre o seu trabalho. Deixou todo o ambiente de trabalho limpo.

--------------------------------------------------------------------
22/11/2019 - 16:09 hs
O cliente informou que o serviço foi concluído com sucesso.

--------------------------------------------------------------------
22/11/2019 - 16:04 hs
O profissional concluiu o serviço.

--------------------------------------------------------------------
22/11/2019 - 15:11 hs
O profissional iniciou a execução do serviço.

--------------------------------------------------------------------
21/11/2019 - 13:34 hs
Foi realizado o pagamento do serviço.

--------------------------------------------------------------------
21/11/2019 - 12:58 hs
Foi aceito o orçamento do profissional.

--------------------------------------------------------------------
21/11/2019 - 06:46 hs
Foi solicitado orçamento para o serviço.</Text>
    </ScrollView>
    );
  }
}

Maisdetalhes2.propTypes = {

}

Maisdetalhes2.defaultProps = {

}


const styles = StyleSheet.create({
  "maisdetalhes2": {
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
  "maisdetalhes2_grupo7": {
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
  "maisdetalhes2_grupo7_caminho6": {
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
  "maisdetalhes2_grupo10": {
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
  "maisdetalhes2_grupo10_caminho3": {
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
  "maisdetalhes2_maisdetalhes": {
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
    "width": 129,
    "height": 27,
    "left": 116,
    "top": 14
  },
  "maisdetalhes2_seta": {
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
  "maisdetalhes2_grupo21": {
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
  "maisdetalhes2_grupo21_caminho3b125bb6c": {
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
  "maisdetalhes2_historicodoservico": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 15,
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
    "width": 141,
    "height": 20,
    "left": 110,
    "top": 73
  },
  "maisdetalhes2_retangulo51": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 1)",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "borderTopWidth": 1,
    "borderTopColor": "rgba(112, 112, 112, 1)",
    "borderRightWidth": 1,
    "borderRightColor": "rgba(112, 112, 112, 1)",
    "borderBottomWidth": 1,
    "borderBottomColor": "rgba(112, 112, 112, 1)",
    "borderLeftWidth": 1,
    "borderLeftColor": "rgba(112, 112, 112, 1)",
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 315,
    "height": 510,
    "left": 22,
    "top": 97
  },
  "maisdetalhes2_profissionalrenatosilvaespecialidadegasistaservicoinstalacaodeaquecedordeaguaagasgn221120191647hsavaliacaodoservicoexcelenteavaliacaodoprofissionalprofis": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 11,
    "fontWeight": "400",
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
    "width": 303,
    "height": 504,
    "left": 28,
    "top": 103
  }
});