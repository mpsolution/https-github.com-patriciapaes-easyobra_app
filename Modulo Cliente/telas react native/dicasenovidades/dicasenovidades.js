import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Dicasenovidades extends Component {

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
    <ScrollView data-layer="c5a3c20e-6190-49de-b47f-b49718a57a59" style={styles.dicasenovidades}>
        <ReactImage data-layer="5b878d61-14b6-4b41-9c4f-c0d0fc485191" source={require('./assets/imagem3ideianoticia.png')} style={styles.dicasenovidades_imagem3ideianoticia} />
        <ReactImage data-layer="deae174f-4871-4593-a4a8-c435fcd19692" source={require('./assets/imagem4ideianoticia.png')} style={styles.dicasenovidades_imagem4ideianoticia} />
        <Text data-layer="dbb6c1bb-2534-463b-a220-2e9c705c708a" style={styles.dicasenovidades_x10ideiasparaterumacozinhaaberta}>10 ideias para ter uma cozinha aberta</Text>
        <Svg data-layer="fd202e30-38b7-484c-97cd-89354bd2f7ff" style={styles.dicasenovidades_linha5} preserveAspectRatio="none" viewBox="0 -1 361 2" fill="transparent"><SvgPath d="M 0 0 L 361 0"  /></Svg>
        <Svg data-layer="b36951fa-1191-4a8d-b7ed-6ea7daaae272" style={styles.dicasenovidades_linha6} preserveAspectRatio="none" viewBox="0 -1 361 2" fill="transparent"><SvgPath d="M 0 0 L 361 0"  /></Svg>
        <Text data-layer="f292c1a9-ec1e-4ece-827c-1b096e35c37f" style={styles.dicasenovidades_comotercoberturasnavarandasemperderocharme}>Como ter coberturas na varanda sem perder o charme</Text>
        <View data-layer="5b761e44-8004-4d03-8a36-c90ee2e46ac8" style={styles.dicasenovidades_componente610}>
            <Svg data-layer="9eaae267-2996-4546-9efc-73787a03d9fb" style={styles.dicasenovidades_componente610_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.7500305175781 55.5765380859375" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
            <View data-layer="084b6ab1-850b-475f-bfc3-91f5a5e65f66" style={styles.dicasenovidades_componente610_grupo19}>
                <ReactImage data-layer="44986e46-0f4b-47c6-9018-f91254e7583f" source={require('./assets/capacete.png')} style={styles.dicasenovidades_componente610_grupo19_capacete} />
                <Svg data-layer="ba440f32-ecba-46cb-b83c-696ed94e8a58" style={styles.dicasenovidades_componente610_grupo19_caminho1} preserveAspectRatio="none" viewBox="-0.75 -0.75 15.928558349609375 15.9285888671875" fill="rgba(158, 4, 4, 1)"><SvgPath d="M 7.214279174804688 0 C 11.1986141204834 0 14.42855834960938 3.229949712753296 14.42855834960938 7.21429443359375 C 14.42855834960938 11.19863796234131 11.1986141204834 14.4285888671875 7.214279174804688 14.4285888671875 C 3.229943037033081 14.4285888671875 0 11.19863796234131 0 7.21429443359375 C 0 3.229949712753296 3.229943037033081 0 7.214279174804688 0 Z"  /></Svg>
                <Text data-layer="479d13b8-43b5-4a99-af3f-faa18a3bdcf8" style={styles.dicasenovidades_componente610_grupo19_x2}>2</Text>
            </View>
            <View data-layer="7d1ca487-3161-48a4-9cdc-f6e02e628ac4" style={styles.dicasenovidades_componente610_grupo49}>
                <ReactImage data-layer="fb21f9cb-ee16-4531-9025-ddf37c001f6c" source={require('./assets/elipse-1.png')} style={styles.dicasenovidades_componente610_grupo49_elipse1} />
            </View>
            <Text data-layer="cfb27cd0-ddd9-429b-89f1-7f71768f63a6" style={styles.dicasenovidades_componente610_ruasaoclemente126}>Rua São Clemente 126</Text>
        </View>
        <View data-layer="5d650f52-6b1d-4892-a48c-5a642eab76da" style={styles.dicasenovidades_componente83}>
            <Svg data-layer="30769a81-d932-4b94-87a5-cb6f1f106c03" style={styles.dicasenovidades_componente83_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 52.0107421875" fill="rgba(223, 226, 227, 1)"><SvgPath d="M 0 0 L 362 0 L 362 50.5107421875 L 0 50.5107421875 L 0 0 Z"  /></Svg>
            <View data-layer="d8a4ddd3-b7df-4048-9734-c66c2b2a87ab" style={styles.dicasenovidades_componente83_grupo31}>
                <Text data-layer="6552d198-50bf-496f-88a0-69e9cd1be59f" style={styles.dicasenovidades_componente83_grupo31_dicasenovidadesb9b06e0f}>Dicas e Novidades</Text>
                <ReactImage data-layer="2f0f6bd2-5e8f-4259-9f4d-b3dce0bb6970" source={require('./assets/lampada2.png')} style={styles.dicasenovidades_componente83_grupo31_lampada2} />
            </View>
            <View data-layer="a812515e-7de4-4df9-b13e-83a2f37f21bb" style={styles.dicasenovidades_componente83_grupo41}>
                <Text data-layer="2647d50a-add4-42ef-9e7a-f7117ab5c7bb" style={styles.dicasenovidades_componente83_grupo41_digitalizacao}>Digitalização</Text>
                <ReactImage data-layer="731c1157-6302-40e5-ba4b-8236f13fb2ec" source={require('./assets/maquinafotografica.png')} style={styles.dicasenovidades_componente83_grupo41_maquinafotografica} />
            </View>
            <View data-layer="fffa1077-e750-4a3c-b410-c4ae3e2c3282" style={styles.dicasenovidades_componente83_grupo30}>
                <Text data-layer="03227512-d711-4381-a854-25f6880d65a7" style={styles.dicasenovidades_componente83_grupo30_inicio}>Início</Text>
                <ReactImage data-layer="624a861b-bca0-452f-8528-25a45c0f722c" source={require('./assets/trabalhador.png')} style={styles.dicasenovidades_componente83_grupo30_trabalhador} />
            </View>
            <View data-layer="835f50f8-e29f-47cf-9a38-11de0b695fd6" style={styles.dicasenovidades_componente83_grupo34}>
                <Text data-layer="5bb6c68a-7a75-4637-892f-4ac50f69ccab" style={styles.dicasenovidades_componente83_grupo34_faleconosco}>Fale conosco</Text>
                <ReactImage data-layer="7f2540e5-f754-4636-a71c-9b63a1ff0b50" source={require('./assets/batepapo.png')} style={styles.dicasenovidades_componente83_grupo34_batepapo} />
            </View>
        </View>
    </ScrollView>
    );
  }
}

Dicasenovidades.propTypes = {

}

Dicasenovidades.defaultProps = {

}


const styles = StyleSheet.create({
  "dicasenovidades": {
    "opacity": 1,
    "position": "relative",
    "backgroundColor": "rgba(255, 255, 255, 0.9215686274509803)",
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
  "dicasenovidades_imagem3ideianoticia": {
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
    "width": 361,
    "height": 275,
    "left": -1,
    "top": 310
  },
  "dicasenovidades_imagem4ideianoticia": {
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
    "width": 360,
    "height": 304,
    "left": 0,
    "top": 21
  },
  "dicasenovidades_x10ideiasparaterumacozinhaaberta": {
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
    "width": 215,
    "height": 17,
    "left": 10,
    "top": 297
  },
  "dicasenovidades_linha5": {
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
    "width": 361,
    "height": 2,
    "left": 0,
    "top": 328.5
  },
  "dicasenovidades_linha6": {
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
    "width": 361,
    "height": 2,
    "left": 0,
    "top": 56
  },
  "dicasenovidades_comotercoberturasnavarandasemperderocharme": {
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
    "width": 311,
    "height": 17,
    "left": 10,
    "top": 563
  },
  "dicasenovidades_componente610": {
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
    "height": 53.83,
    "left": 0,
    "top": 0
  },
  "dicasenovidades_componente610_caminho6": {
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
  "dicasenovidades_componente610_grupo19": {
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
    "width": 38.63,
    "height": 38,
    "left": 306,
    "top": 11
  },
  "dicasenovidades_componente610_grupo19_capacete": {
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
    "width": 38,
    "height": 38,
    "left": 0,
    "top": 0
  },
  "dicasenovidades_componente610_grupo19_caminho1": {
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
    "width": 14.43,
    "height": 14.43,
    "left": 24.2,
    "top": 2
  },
  "dicasenovidades_componente610_grupo19_x2": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(252, 246, 246, 1)",
    "fontSize": 12,
    "fontWeight": "400",
    "fontStyle": "normal",
    "fontFamily": "Trebuchet MS",
    "textAlign": "left",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 6,
    "height": 14,
    "left": 28.63,
    "top": 2
  },
  "dicasenovidades_componente610_grupo49": {
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
    "width": 32,
    "height": 32,
    "left": 16,
    "top": 9
  },
  "dicasenovidades_componente610_grupo49_elipse1": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "width": 32,
    "height": 32,
    "left": 0,
    "top": 0
  },
  "dicasenovidades_componente610_ruasaoclemente126": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(217, 180, 9, 1)",
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
    "width": 157,
    "height": 20,
    "left": 102,
    "top": 20
  },
  "dicasenovidades_componente83": {
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
    "width": 362,
    "height": 57,
    "left": -1,
    "top": 583
  },
  "dicasenovidades_componente83_caminho3": {
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
    "width": 362,
    "height": 50.51,
    "left": 0,
    "top": 6.49
  },
  "dicasenovidades_componente83_grupo31": {
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
    "width": 94,
    "height": 43,
    "left": 87,
    "top": 10
  },
  "dicasenovidades_componente83_grupo31_dicasenovidadesb9b06e0f": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(217, 180, 9, 1)",
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
    "width": 94,
    "height": 15,
    "left": 0,
    "top": 28
  },
  "dicasenovidades_componente83_grupo31_lampada2": {
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
    "width": 29,
    "height": 29,
    "left": 33,
    "top": 0
  },
  "dicasenovidades_componente83_grupo41": {
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
    "width": 67,
    "height": 53.08,
    "left": 282,
    "top": 0
  },
  "dicasenovidades_componente83_grupo41_digitalizacao": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(122, 124, 125, 1)",
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
    "width": 67,
    "height": 15,
    "left": 0,
    "top": 38
  },
  "dicasenovidades_componente83_grupo41_maquinafotografica": {
    "opacity": 0.44999998807907104,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 49,
    "height": 53.08,
    "left": 9,
    "top": 0
  },
  "dicasenovidades_componente83_grupo30": {
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
    "width": 30,
    "height": 43,
    "left": 30,
    "top": 10
  },
  "dicasenovidades_componente83_grupo30_inicio": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(122, 124, 125, 1)",
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
    "width": 28,
    "height": 15,
    "left": 2,
    "top": 28
  },
  "dicasenovidades_componente83_grupo30_trabalhador": {
    "opacity": 0.550000011920929,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 30,
    "height": 31.97,
    "left": 0,
    "top": 0
  },
  "dicasenovidades_componente83_grupo34": {
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
    "width": 66,
    "height": 41,
    "left": 190,
    "top": 12
  },
  "dicasenovidades_componente83_grupo34_faleconosco": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(122, 124, 125, 1)",
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
    "width": 66,
    "height": 15,
    "left": 0,
    "top": 26
  },
  "dicasenovidades_componente83_grupo34_batepapo": {
    "opacity": 0.44999998807907104,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 28,
    "height": 28,
    "left": 19,
    "top": 0
  }
});