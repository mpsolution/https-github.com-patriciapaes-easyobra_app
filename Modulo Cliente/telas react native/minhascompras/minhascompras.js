import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Minhascompras extends Component {

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
    <ScrollView data-layer="8f25bd85-e0f0-4378-8304-7549e1ec7331" style={styles.minhascompras}>
        <View data-layer="3bae961a-92e0-4615-bfeb-9b15e019a1a4" style={styles.minhascompras_grupo7}>
            <Svg data-layer="0f943581-eeb5-4208-8bb6-655b7281690d" style={styles.minhascompras_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.7500305175781 55.57647705078125" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="069550c0-9521-40ae-9361-db1c72c7c113" style={styles.minhascompras_grupo10}>
            <Svg data-layer="805db5cc-58f2-40f9-bf4f-67c8b5a4403f" style={styles.minhascompras_grupo10_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="7fd0453a-df71-4a90-b41f-d6add9c424be" style={styles.minhascompras_minhascompras15e0b4f1}>Minhas compras</Text>
        <ReactImage data-layer="bdbd9c6c-edc8-4d95-a42f-ee8f7712beb1" source={require('./assets/seta.png')} style={styles.minhascompras_seta} />
        <View data-layer="60769dba-162c-4d7a-88e4-7027c7cbb9ad" style={styles.minhascompras_grupo21}>
            <Svg data-layer="49e32ec8-ac9b-4205-a825-a9a074c8586b" style={styles.minhascompras_grupo21_caminho3a5af31d5} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="fb65844b-2907-43b1-8e89-c95157737414" style={styles.minhascompras_retangulo5}></View>
        <Text data-layer="6c7c3d5e-c9ee-4cb6-ab26-dc6370ec15e7" style={styles.minhascompras_dibamateriaiseletricos}>Diba Materiais Elétricos</Text>
        <Text data-layer="7b11fdfc-f425-4e62-883e-e6475d8140ae" style={styles.minhascompras_materiaiseletricosemgeral}>Materiais elétricos em geral</Text>
        <Text data-layer="3c23db22-8a3f-47b5-bd43-974f39b452ba" style={styles.minhascompras_x25denovembrode2019}>25 de Novembro de 2019</Text>
        <Text data-layer="b3e5ce32-6598-49e9-8c93-7a57fe87a197" style={styles.minhascompras_r}>R$364,00</Text>
        <View data-layer="5214b2bc-1aa2-40e0-bcb1-f7654bda1463" style={styles.minhascompras_retangulo21}></View>
        <Text data-layer="6fb0fdb6-2ebd-4379-8547-d52289559b2f" style={styles.minhascompras_befranmateriaisdeconstru}>Befran Materiais de Constru</Text>
        <Text data-layer="f8f5dfb2-8f71-48dd-a2d6-f1e24a3bf89b" style={styles.minhascompras_materiaisdeobraediversos}>Materiais de obra e diversos </Text>
        <Text data-layer="71f382f9-e128-4a02-b5e7-5f788b5b74ce" style={styles.minhascompras_x01denovembrode2019}>01 de Novembro de 2019</Text>
        <Text data-layer="d6f59fb3-b69a-411d-ae64-2ca701ab7599" style={styles.minhascompras_r1}>R$3.875,87</Text>
        <ReactImage data-layer="515379e7-f29e-4fad-aa60-bdb63a0cb377" source={require('./assets/app-papis.png')} style={styles.minhascompras_apppapis} />
        <ReactImage data-layer="a393e3d0-0641-4e48-bf05-f8a8efd59e4b" source={require('./assets/loja.png')} style={styles.minhascompras_loja} />
        <ReactImage data-layer="183a9a64-7b3c-410e-8fc8-be3257c5e60d" source={require('./assets/progresso.png')} style={styles.minhascompras_progresso} />
        <ReactImage data-layer="8b1c2ff8-1e4e-4415-9aa7-a64152037be1" source={require('./assets/loja-57a06424.png')} style={styles.minhascompras_loja1} />
        <View data-layer="c45be6ae-9518-4bca-96b9-3c6f68f1a280" style={styles.minhascompras_retangulo14}></View>
        <Text data-layer="29b5c6e0-871a-4346-864d-4cca4e1f9cb9" style={styles.minhascompras_pedirajuda}>Pedir Ajuda</Text>
        <View data-layer="3e328c6a-6640-4f3b-8304-2a1ce9458922" style={styles.minhascompras_retangulo16}></View>
        <Text data-layer="ae2e4710-e389-4bc9-944e-69e178fb66ba" style={styles.minhascompras_pedirajuda1}>Pedir Ajuda</Text>
        <View data-layer="11802d07-1b91-4473-9761-ecbb641c0037" style={styles.minhascompras_retangulo34}></View>
        <Text data-layer="b8575efe-d216-4d9f-9aff-37d04a2d39c2" style={styles.minhascompras_vermais}>Ver mais</Text>
        <View data-layer="71dc7ddc-73fb-4db4-bb11-a3c7bf471e1d" style={styles.minhascompras_retangulo341}></View>
        <Text data-layer="fc7ca9bf-af91-41f5-8bfe-f066717a452f" style={styles.minhascompras_vermais1}>Ver mais</Text>
    </ScrollView>
    );
  }
}

Minhascompras.propTypes = {

}

Minhascompras.defaultProps = {

}


const styles = StyleSheet.create({
  "minhascompras": {
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
  "minhascompras_grupo7": {
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
  "minhascompras_grupo7_caminho6": {
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
  "minhascompras_grupo10": {
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
  "minhascompras_grupo10_caminho3": {
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
  "minhascompras_minhascompras15e0b4f1": {
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
    "width": 154,
    "height": 27,
    "left": 103,
    "top": 14
  },
  "minhascompras_seta": {
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
  "minhascompras_grupo21": {
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
  "minhascompras_grupo21_caminho3a5af31d5": {
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
  "minhascompras_retangulo5": {
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
    "width": 362,
    "height": 87,
    "left": -1,
    "top": 67
  },
  "minhascompras_dibamateriaiseletricos": {
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
    "width": 166,
    "height": 20,
    "left": 93,
    "top": 75
  },
  "minhascompras_materiaiseletricosemgeral": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 15,
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
    "width": 182,
    "height": 20,
    "left": 93,
    "top": 90
  },
  "minhascompras_x25denovembrode2019": {
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
  "minhascompras_r": {
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
    "width": 57,
    "height": 17,
    "left": 274,
    "top": 107
  },
  "minhascompras_retangulo21": {
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
    "width": 362,
    "height": 87,
    "left": -1,
    "top": 152
  },
  "minhascompras_befranmateriaisdeconstru": {
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
    "width": 197,
    "height": 20,
    "left": 93,
    "top": 161
  },
  "minhascompras_materiaisdeobraediversos": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 15,
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
    "width": 190,
    "height": 20,
    "left": 93,
    "top": 176
  },
  "minhascompras_x01denovembrode2019": {
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
    "top": 193
  },
  "minhascompras_r1": {
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
    "width": 68,
    "height": 17,
    "left": 274,
    "top": 193
  },
  "minhascompras_apppapis": {
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
    "width": 31.5,
    "height": 26,
    "left": 306,
    "top": 163
  },
  "minhascompras_loja": {
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
    "top": 166
  },
  "minhascompras_progresso": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 23,
    "borderTopRightRadius": 23,
    "borderBottomLeftRadius": 23,
    "borderBottomRightRadius": 23,
    "width": 56,
    "height": 14,
    "left": 286,
    "top": 81
  },
  "minhascompras_loja1": {
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
    "top": 80
  },
  "minhascompras_retangulo14": {
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
    "left": 216,
    "top": 127
  },
  "minhascompras_pedirajuda": {
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
    "left": 228,
    "top": 129
  },
  "minhascompras_retangulo16": {
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
    "left": 216,
    "top": 213
  },
  "minhascompras_pedirajuda1": {
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
    "left": 228,
    "top": 215
  },
  "minhascompras_retangulo34": {
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
    "left": 93,
    "top": 127
  },
  "minhascompras_vermais": {
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
    "width": 37,
    "height": 14,
    "left": 113,
    "top": 128
  },
  "minhascompras_retangulo341": {
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
    "left": 93,
    "top": 213
  },
  "minhascompras_vermais1": {
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
    "width": 37,
    "height": 14,
    "left": 113,
    "top": 214
  }
});