import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Digitalizacao extends Component {

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
    <ScrollView data-layer="cb1d28d9-18f0-4178-aae6-79b6a094f2c3" style={styles.digitalizacao}>
        <Svg data-layer="8743b38b-4876-41bb-8ad1-6a6dc05f2f87" style={styles.digitalizacao_caminho5} preserveAspectRatio="none" viewBox="-0.75 -0.75 270.5 25.5" fill="rgba(0, 0, 0, 0.3215686274509804)"><SvgPath d="M 0 0 L 269 0 L 269 24 L 0 24 L 0 0 Z"  /></Svg>
        <Text data-layer="b74061ed-5f11-47c5-9e64-1ecd96cb5799" style={styles.digitalizacao_tirarfoto}>Tirar Foto</Text>
        <ReactImage data-layer="2cf59d68-b40c-45ee-a6b6-a31b879787ed" source={require('./assets/retangulo-54.png')} style={styles.digitalizacao_retangulo54} />
        <Text data-layer="51a1b63f-928b-4b17-ae60-d23c6e80d546" style={styles.digitalizacao_x1pegueodocumento2enquadretodoodocumentonacamera3tireumafoto4envieafoto}>1. Pegue o documento.

2. Enquadre todo o documento na câmera.

3. Tire uma foto.

4. Envie a foto.</Text>
        <ReactImage data-layer="4cd18e34-f355-4c1e-a57b-efa6bda2bf0a" source={require('./assets/pasta-documentos-colorida.png')} style={styles.digitalizacao_pastadocumentoscolorida} />
        <View data-layer="3b37c925-2aae-40c1-9db6-0b996d1d891c" style={styles.digitalizacao_componente749}>
            <Svg data-layer="3f973448-3bb9-4bb2-b121-563658128ade" style={styles.digitalizacao_componente749_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 52.0107421875" fill="rgba(223, 226, 227, 1)"><SvgPath d="M 0 0 L 362 0 L 362 50.5107421875 L 0 50.5107421875 L 0 0 Z"  /></Svg>
            <View data-layer="67a54579-30e7-4c91-b149-0b123f56de95" style={styles.digitalizacao_componente749_grupo31}>
                <Text data-layer="9942c864-9604-438b-9a2c-630632e1e81e" style={styles.digitalizacao_componente749_grupo31_dicasenovidades}>Dicas e Novidades</Text>
                <ReactImage data-layer="6caf14c2-9ca4-49c8-9d9c-ddd293b2df8a" source={require('./assets/lampada.png')} style={styles.digitalizacao_componente749_grupo31_lampada} />
            </View>
            <View data-layer="afb14f50-d3f3-48ab-b27f-76430d5406b7" style={styles.digitalizacao_componente749_grupo34}>
                <Text data-layer="9c4292ff-b1f6-40f8-a7e1-7724e02b54a5" style={styles.digitalizacao_componente749_grupo34_faleconosco}>Fale conosco</Text>
                <ReactImage data-layer="7f90bddb-dd2c-4d49-a77b-f68c98dc785b" source={require('./assets/batepapo.png')} style={styles.digitalizacao_componente749_grupo34_batepapo} />
            </View>
            <View data-layer="0b715db1-5e81-4a95-a612-f6b155e97c1f" style={styles.digitalizacao_componente749_grupo41}>
                <Text data-layer="38c5822f-1971-4c3e-a314-0a96923a6128" style={styles.digitalizacao_componente749_grupo41_digitalizacao56065c17}>Digitalização</Text>
                <ReactImage data-layer="050a3939-487b-4a8c-a5a7-c3cab6fb838a" source={require('./assets/maquinafotografica2.png')} style={styles.digitalizacao_componente749_grupo41_maquinafotografica2} />
            </View>
            <View data-layer="89d9cf65-7c52-4339-8937-935b947b21d7" style={styles.digitalizacao_componente749_grupo30}>
                <Text data-layer="b459415d-ac55-471d-a277-9a50e5a9cfe8" style={styles.digitalizacao_componente749_grupo30_inicio}>Início</Text>
                <ReactImage data-layer="c0d74b25-c6a6-476e-b2fe-9852a3f37f97" source={require('./assets/trabalhador.png')} style={styles.digitalizacao_componente749_grupo30_trabalhador} />
            </View>
        </View>
        <View data-layer="a42c4533-d0f6-4a66-850e-9b744aa4c685" style={styles.digitalizacao_componente612}>
            <Svg data-layer="6b9279ed-4b06-4ee7-9c3f-7f195d6ad7bf" style={styles.digitalizacao_componente612_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.7500305175781 55.5765380859375" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
            <View data-layer="d40d30b8-d203-4218-bb15-4bd4a3178b2d" style={styles.digitalizacao_componente612_grupo19}>
                <ReactImage data-layer="9a5bc604-e951-4eab-ad34-dcab5f070996" source={require('./assets/capacete.png')} style={styles.digitalizacao_componente612_grupo19_capacete} />
                <Svg data-layer="35499057-2a39-4a4c-8bd7-1aa0056fe508" style={styles.digitalizacao_componente612_grupo19_caminho1} preserveAspectRatio="none" viewBox="-0.75 -0.75 15.928558349609375 15.9285888671875" fill="rgba(158, 4, 4, 1)"><SvgPath d="M 7.214279174804688 0 C 11.1986141204834 0 14.42855834960938 3.229949712753296 14.42855834960938 7.21429443359375 C 14.42855834960938 11.19863796234131 11.1986141204834 14.4285888671875 7.214279174804688 14.4285888671875 C 3.229943037033081 14.4285888671875 0 11.19863796234131 0 7.21429443359375 C 0 3.229949712753296 3.229943037033081 0 7.214279174804688 0 Z"  /></Svg>
                <Text data-layer="b9a36616-1cd7-4228-81e5-00ff72a99023" style={styles.digitalizacao_componente612_grupo19_x2}>2</Text>
            </View>
            <View data-layer="cbb790f9-d7ef-44ea-92a8-cff221c41d87" style={styles.digitalizacao_componente612_grupo49}>
                <ReactImage data-layer="3335e89b-ed07-4d37-b009-e3e28d51f190" source={require('./assets/elipse-1.png')} style={styles.digitalizacao_componente612_grupo49_elipse1} />
            </View>
            <Text data-layer="0d29df8f-f38a-4ed2-a51f-57111555aafa" style={styles.digitalizacao_componente612_ruasaoclemente126}>Rua São Clemente 126</Text>
        </View>
        <Text data-layer="bd90d3fe-78e5-4dd6-b626-c4faf24cf1a4" style={styles.digitalizacao_projeto}>Projeto:</Text>
        <Text data-layer="3d8dacdc-732d-4aa5-a9a0-9a090a8ed865" style={styles.digitalizacao_banheironovo}>Banheiro novo</Text>
        <ReactImage data-layer="d4201b96-c9e3-4f65-a717-5d76265dd47c" source={require('./assets/lapis.png')} style={styles.digitalizacao_lapis} />
        <Svg data-layer="adc2d5af-33c1-4a33-944f-7501f40d099e" style={styles.digitalizacao_poligono2} preserveAspectRatio="none" viewBox="0 0 7 7" fill="rgba(152, 152, 152, 1)"><SvgPath d="M 3.499999761581421 0 L 7 7 L 0 7 Z"  /></Svg>
        <ReactImage data-layer="1905445d-9450-4235-9328-ec8971f9d8cf" source={require('./assets/adicionar.png')} style={styles.digitalizacao_adicionar} />
    </ScrollView>
    );
  }
}

Digitalizacao.propTypes = {

}

Digitalizacao.defaultProps = {

}


const styles = StyleSheet.create({
  "digitalizacao": {
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
  "digitalizacao_caminho5": {
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
    "width": 269,
    "height": 24,
    "left": 46,
    "top": 525
  },
  "digitalizacao_tirarfoto": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(255, 255, 255, 1)",
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
    "width": 69,
    "height": 20,
    "left": 146,
    "top": 527
  },
  "digitalizacao_retangulo54": {
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
    "height": 491,
    "left": -1,
    "top": -26
  },
  "digitalizacao_x1pegueodocumento2enquadretodoodocumentonacamera3tireumafoto4envieafoto": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 17,
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
    "width": 329,
    "height": 166,
    "left": 16,
    "top": 91
  },
  "digitalizacao_pastadocumentoscolorida": {
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
    "width": 154,
    "height": 162,
    "left": 97,
    "top": 268
  },
  "digitalizacao_componente749": {
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
    "height": 60,
    "left": -1,
    "top": 580
  },
  "digitalizacao_componente749_caminho3": {
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
    "top": 9.49
  },
  "digitalizacao_componente749_grupo31": {
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
    "top": 13
  },
  "digitalizacao_componente749_grupo31_dicasenovidades": {
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
    "width": 94,
    "height": 15,
    "left": 0,
    "top": 28
  },
  "digitalizacao_componente749_grupo31_lampada": {
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
    "width": 29,
    "height": 29,
    "left": 33,
    "top": 0
  },
  "digitalizacao_componente749_grupo34": {
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
    "top": 15
  },
  "digitalizacao_componente749_grupo34_faleconosco": {
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
  "digitalizacao_componente749_grupo34_batepapo": {
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
  },
  "digitalizacao_componente749_grupo41": {
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
    "height": 56,
    "left": 282,
    "top": 0
  },
  "digitalizacao_componente749_grupo41_digitalizacao56065c17": {
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
    "width": 67,
    "height": 15,
    "left": 0,
    "top": 41
  },
  "digitalizacao_componente749_grupo41_maquinafotografica2": {
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
    "width": 49,
    "height": 53.08,
    "left": 9,
    "top": 0
  },
  "digitalizacao_componente749_grupo30": {
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
    "top": 13
  },
  "digitalizacao_componente749_grupo30_inicio": {
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
  "digitalizacao_componente749_grupo30_trabalhador": {
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
  "digitalizacao_componente612": {
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
  "digitalizacao_componente612_caminho6": {
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
  "digitalizacao_componente612_grupo19": {
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
  "digitalizacao_componente612_grupo19_capacete": {
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
  "digitalizacao_componente612_grupo19_caminho1": {
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
  "digitalizacao_componente612_grupo19_x2": {
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
  "digitalizacao_componente612_grupo49": {
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
  "digitalizacao_componente612_grupo49_elipse1": {
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
  "digitalizacao_componente612_ruasaoclemente126": {
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
  "digitalizacao_projeto": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 0.6)",
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
    "width": 59,
    "height": 20,
    "left": 62,
    "top": 482
  },
  "digitalizacao_banheironovo": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 0.4)",
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
    "width": 108,
    "height": 20,
    "left": 125,
    "top": 482
  },
  "digitalizacao_lapis": {
    "opacity": 0.699999988079071,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 12,
    "height": 11.7,
    "left": 269,
    "top": 488
  },
  "digitalizacao_poligono2": {
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
    "width": 7,
    "height": 7,
    "left": 240,
    "top": 490
  },
  "digitalizacao_adicionar": {
    "opacity": 0.699999988079071,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 12,
    "height": 12,
    "left": 293,
    "top": 488
  }
});