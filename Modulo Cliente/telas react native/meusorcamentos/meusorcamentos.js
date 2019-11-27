import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Meusorcamentos extends Component {

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
    <ScrollView data-layer="27fcf7b4-6df2-4c55-886e-bdd7395c783e" style={styles.meusorcamentos}>
        <View data-layer="03574a06-cc51-45d5-94e0-bf0f614193c7" style={styles.meusorcamentos_grupo7}>
            <Svg data-layer="1def7003-ef01-40fc-a8ba-aecceed0c888" style={styles.meusorcamentos_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 55.57647705078125" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="b9d405e1-6e93-4ed4-8d46-29d7bab40866" style={styles.meusorcamentos_grupo10}>
            <Svg data-layer="141c9545-56c7-4838-9c54-11098affecc2" style={styles.meusorcamentos_grupo10_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="10dc3e14-4b00-41f0-a786-f2d0481f5828" style={styles.meusorcamentos_meusorcamentos0839684d}>Meus orçamentos</Text>
        <ReactImage data-layer="a511088b-c524-48b1-9493-d2051964379c" source={require('./assets/seta.png')} style={styles.meusorcamentos_seta} />
        <View data-layer="18e219aa-03b4-49af-8187-002b9c387f81" style={styles.meusorcamentos_grupo21}>
            <Svg data-layer="f1a82de8-3fd5-4075-8299-69bb19ac6301" style={styles.meusorcamentos_grupo21_caminho3999d8ade} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="8c873819-3069-4e7e-8665-91365d0af685" style={styles.meusorcamentos_retangulo5}></View>
        <Text data-layer="c7da7fd5-709a-4934-8aa1-77ece09354d5" style={styles.meusorcamentos_x26denovembrode2019}>26 de Novembro de 2019</Text>
        <Text data-layer="5c3b4111-c68c-4d10-a91e-4418d6f94eec" style={styles.meusorcamentos_menorvalorr}>Menor valor R$340,00</Text>
        <View data-layer="2aea17bb-b565-4404-8a1a-71ee12b1b021" style={styles.meusorcamentos_retangulo14}></View>
        <Text data-layer="b896579c-cb32-4877-a120-e12852f59b3a" style={styles.meusorcamentos_pedirajuda}>Pedir Ajuda</Text>
        <Text data-layer="51269c8c-ed3f-4a9c-9da2-c88ddbac1ddb" style={styles.meusorcamentos_reparosmanutencao}>Reparos / Manutenção</Text>
        <Text data-layer="09e2beba-fc38-4f52-9af2-b097b4de98b8" style={styles.meusorcamentos_materialdepintura}>Material de pintura</Text>
        <Text data-layer="5649fff3-92c5-4962-9e27-f9a412f1c457" style={styles.meusorcamentos_x9respostas18hsrestantes}>9 respostas     18hs restantes</Text>
        <View data-layer="38f7abc0-4771-4261-b0c5-1c6485e48e41" style={styles.meusorcamentos_retangulo30}></View>
        <Text data-layer="c46291ab-a401-4ba2-9be8-087a3f2fce67" style={styles.meusorcamentos_verorcamentos}>Ver orçamentos</Text>
        <ReactImage data-layer="f2bff52d-8129-458e-ab85-a9ac8c001497" source={require('./assets/loja.png')} style={styles.meusorcamentos_loja} />
        <View data-layer="b846aea7-295d-404f-9c48-f58b10a79b8a" style={styles.meusorcamentos_grupo24}>
            <View data-layer="1b14021e-e0e3-4db0-b99a-937e950bb98c" style={styles.meusorcamentos_grupo24_retangulo31}></View>
            <ReactImage data-layer="5d53b11b-5519-42ea-a36a-c8e1791dcf1e" source={require('./assets/cancelar.png')} style={styles.meusorcamentos_grupo24_cancelar} />
            <Text data-layer="57f84e57-1d94-4e16-acaf-361eecf2431d" style={styles.meusorcamentos_grupo24_cancelar1}>Cancelar</Text>
        </View>
        <View data-layer="45fe7de5-ec69-48d7-9719-618aa61cf370" style={styles.meusorcamentos_retangulo32}></View>
        <Text data-layer="5a5e721e-cfb4-4f98-9b67-8a3e611fc908" style={styles.meusorcamentos_x26denovembrode20191}>26 de Novembro de 2019</Text>
        <Text data-layer="63c039af-41b9-4f2e-b338-81e30dd10887" style={styles.meusorcamentos_menorvalorr1}>Menor valor R$970,00</Text>
        <View data-layer="72707386-c99c-472d-b6a0-a2956522ff87" style={styles.meusorcamentos_retangulo33}></View>
        <Text data-layer="4cb96143-fa8b-4a47-8ad7-6dea1f58e163" style={styles.meusorcamentos_pedirajuda1}>Pedir Ajuda</Text>
        <Text data-layer="7a5e2c56-c06a-4f7d-a188-60ab404bc78c" style={styles.meusorcamentos_pinturaquartobebe}>Pintura quarto bebê</Text>
        <Text data-layer="f5450017-a65e-4f04-8e2d-44380e79c7ce" style={styles.meusorcamentos_pintor}>Pintor</Text>
        <Text data-layer="95f91acf-78b0-4fc8-9edd-2f30d6d28ed0" style={styles.meusorcamentos_x4respostas24hsrestantes}>4 respostas     24hs restantes</Text>
        <View data-layer="b21989f6-0980-4d71-a648-c37be9b32f59" style={styles.meusorcamentos_retangulo34}></View>
        <Text data-layer="0c5cc742-6589-4c6b-bca0-2f4e7e073ea3" style={styles.meusorcamentos_verorcamentos1}>Ver orçamentos</Text>
        <ReactImage data-layer="e1bec65b-ba1d-4c96-a06c-b20abfff7cf2" source={require('./assets/loja-481ed7a9.png')} style={styles.meusorcamentos_loja1} />
        <View data-layer="5d1efa35-13d3-4aef-995e-01cf5675dd31" style={styles.meusorcamentos_grupo25}>
            <View data-layer="5dbf1022-5e30-4dfd-ac5d-0a3b5ea271f3" style={styles.meusorcamentos_grupo25_retangulo31677c5f86}></View>
            <ReactImage data-layer="06370e34-4abd-4752-85a2-57e5cfdc9dff" source={require('./assets/cancelar-1ef3d1ab.png')} style={styles.meusorcamentos_grupo25_cancelara152c70b} />
            <Text data-layer="c88e4900-10ef-403c-8216-cd5de7658904" style={styles.meusorcamentos_grupo25_cancelar117a228ad}>Cancelar</Text>
        </View>
    </ScrollView>
    );
  }
}

Meusorcamentos.propTypes = {

}

Meusorcamentos.defaultProps = {

}


const styles = StyleSheet.create({
  "meusorcamentos": {
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
  "meusorcamentos_grupo7": {
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
  "meusorcamentos_grupo7_caminho6": {
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
  "meusorcamentos_grupo10": {
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
  "meusorcamentos_grupo10_caminho3": {
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
  "meusorcamentos_meusorcamentos0839684d": {
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
    "width": 167,
    "height": 27,
    "left": 97,
    "top": 14
  },
  "meusorcamentos_seta": {
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
  "meusorcamentos_grupo21": {
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
  "meusorcamentos_grupo21_caminho3999d8ade": {
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
  "meusorcamentos_retangulo5": {
    "opacity": 0.8999999761581421,
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
    "width": 362,
    "height": 95,
    "left": -1,
    "top": 68
  },
  "meusorcamentos_x26denovembrode2019": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 13,
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
    "width": 147,
    "height": 17,
    "left": 93,
    "top": 107
  },
  "meusorcamentos_menorvalorr": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 11,
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
    "width": 114,
    "height": 15,
    "left": 93,
    "top": 138
  },
  "meusorcamentos_retangulo14": {
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
    "borderTopColor": "rgba(36, 161, 77, 1)",
    "borderRightWidth": 1,
    "borderRightColor": "rgba(36, 161, 77, 1)",
    "borderBottomWidth": 1,
    "borderBottomColor": "rgba(36, 161, 77, 1)",
    "borderLeftWidth": 1,
    "borderLeftColor": "rgba(36, 161, 77, 1)",
    "borderTopLeftRadius": 3,
    "borderTopRightRadius": 3,
    "borderBottomLeftRadius": 3,
    "borderBottomRightRadius": 3,
    "width": 78,
    "height": 18,
    "left": 271,
    "top": 106
  },
  "meusorcamentos_pedirajuda": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(36, 161, 77, 1)",
    "fontSize": 10,
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
    "width": 55,
    "height": 14,
    "left": 283,
    "top": 108
  },
  "meusorcamentos_reparosmanutencao": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 13,
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
    "width": 138,
    "height": 17,
    "left": 93,
    "top": 77
  },
  "meusorcamentos_materialdepintura": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 13,
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
    "width": 110,
    "height": 17,
    "left": 93,
    "top": 92
  },
  "meusorcamentos_x9respostas18hsrestantes": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 13,
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
    "width": 165,
    "height": 17,
    "left": 93,
    "top": 123
  },
  "meusorcamentos_retangulo30": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(36, 161, 77, 1)",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "borderTopWidth": 1,
    "borderTopColor": "rgba(36, 161, 77, 1)",
    "borderRightWidth": 1,
    "borderRightColor": "rgba(36, 161, 77, 1)",
    "borderBottomWidth": 1,
    "borderBottomColor": "rgba(36, 161, 77, 1)",
    "borderLeftWidth": 1,
    "borderLeftColor": "rgba(36, 161, 77, 1)",
    "borderTopLeftRadius": 3,
    "borderTopRightRadius": 3,
    "borderBottomLeftRadius": 3,
    "borderBottomRightRadius": 3,
    "width": 78,
    "height": 18,
    "left": 271,
    "top": 80
  },
  "meusorcamentos_verorcamentos": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(255, 255, 255, 1)",
    "fontSize": 10,
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
    "width": 69,
    "height": 14,
    "left": 275,
    "top": 81
  },
  "meusorcamentos_loja": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 74,
    "borderTopRightRadius": 74,
    "borderBottomLeftRadius": 74,
    "borderBottomRightRadius": 74,
    "width": 47.32,
    "height": 47,
    "left": 18,
    "top": 92
  },
  "meusorcamentos_grupo24": {
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
    "width": 78,
    "height": 18,
    "left": 271,
    "top": 133
  },
  "meusorcamentos_grupo24_retangulo31": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(244, 0, 1, 1)",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "borderTopLeftRadius": 3,
    "borderTopRightRadius": 3,
    "borderBottomLeftRadius": 3,
    "borderBottomRightRadius": 3,
    "width": 78,
    "height": 18,
    "left": 0,
    "top": 0
  },
  "meusorcamentos_grupo24_cancelar": {
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
    "width": 18,
    "height": 17.81,
    "left": 1,
    "top": 0
  },
  "meusorcamentos_grupo24_cancelar1": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(255, 255, 255, 1)",
    "fontSize": 10,
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
    "width": 38,
    "height": 14,
    "left": 21,
    "top": 1
  },
  "meusorcamentos_retangulo32": {
    "opacity": 0.8999999761581421,
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
    "width": 362,
    "height": 95,
    "left": -1,
    "top": 162
  },
  "meusorcamentos_x26denovembrode20191": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 13,
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
    "width": 147,
    "height": 17,
    "left": 93,
    "top": 201
  },
  "meusorcamentos_menorvalorr1": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 11,
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
    "width": 114,
    "height": 15,
    "left": 93,
    "top": 232
  },
  "meusorcamentos_retangulo33": {
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
    "borderTopColor": "rgba(36, 161, 77, 1)",
    "borderRightWidth": 1,
    "borderRightColor": "rgba(36, 161, 77, 1)",
    "borderBottomWidth": 1,
    "borderBottomColor": "rgba(36, 161, 77, 1)",
    "borderLeftWidth": 1,
    "borderLeftColor": "rgba(36, 161, 77, 1)",
    "borderTopLeftRadius": 3,
    "borderTopRightRadius": 3,
    "borderBottomLeftRadius": 3,
    "borderBottomRightRadius": 3,
    "width": 78,
    "height": 18,
    "left": 271,
    "top": 200
  },
  "meusorcamentos_pedirajuda1": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(36, 161, 77, 1)",
    "fontSize": 10,
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
    "width": 55,
    "height": 14,
    "left": 283,
    "top": 202
  },
  "meusorcamentos_pinturaquartobebe": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 13,
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
    "width": 123,
    "height": 17,
    "left": 93,
    "top": 171
  },
  "meusorcamentos_pintor": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 13,
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
    "width": 34,
    "height": 17,
    "left": 93,
    "top": 186
  },
  "meusorcamentos_x4respostas24hsrestantes": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 13,
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
    "width": 165,
    "height": 17,
    "left": 93,
    "top": 217
  },
  "meusorcamentos_retangulo34": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(36, 161, 77, 1)",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "borderTopWidth": 1,
    "borderTopColor": "rgba(36, 161, 77, 1)",
    "borderRightWidth": 1,
    "borderRightColor": "rgba(36, 161, 77, 1)",
    "borderBottomWidth": 1,
    "borderBottomColor": "rgba(36, 161, 77, 1)",
    "borderLeftWidth": 1,
    "borderLeftColor": "rgba(36, 161, 77, 1)",
    "borderTopLeftRadius": 3,
    "borderTopRightRadius": 3,
    "borderBottomLeftRadius": 3,
    "borderBottomRightRadius": 3,
    "width": 78,
    "height": 18,
    "left": 271,
    "top": 174
  },
  "meusorcamentos_verorcamentos1": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(255, 255, 255, 1)",
    "fontSize": 10,
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
    "width": 69,
    "height": 14,
    "left": 275,
    "top": 175
  },
  "meusorcamentos_loja1": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 74,
    "borderTopRightRadius": 74,
    "borderBottomLeftRadius": 74,
    "borderBottomRightRadius": 74,
    "width": 47.32,
    "height": 47,
    "left": 18,
    "top": 186
  },
  "meusorcamentos_grupo25": {
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
    "width": 78,
    "height": 18,
    "left": 271,
    "top": 227
  },
  "meusorcamentos_grupo25_retangulo31677c5f86": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(244, 0, 1, 1)",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "borderTopLeftRadius": 3,
    "borderTopRightRadius": 3,
    "borderBottomLeftRadius": 3,
    "borderBottomRightRadius": 3,
    "width": 78,
    "height": 18,
    "left": 0,
    "top": 0
  },
  "meusorcamentos_grupo25_cancelara152c70b": {
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
    "width": 18,
    "height": 17.81,
    "left": 1,
    "top": 0
  },
  "meusorcamentos_grupo25_cancelar117a228ad": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(255, 255, 255, 1)",
    "fontSize": 10,
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
    "width": 38,
    "height": 14,
    "left": 21,
    "top": 1
  }
});