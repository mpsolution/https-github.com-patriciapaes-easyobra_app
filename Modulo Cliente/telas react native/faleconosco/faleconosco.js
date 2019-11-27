import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Faleconosco extends Component {

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
    <ScrollView data-layer="cff7f46e-6568-4bcd-9a4d-559c0508409d" style={styles.faleconosco}>
        <Text data-layer="b5964e2d-8452-462c-a77c-7ae9b0f2d13b" style={styles.faleconosco_vamostratarsobre}>Vamos tratar sobre</Text>
        <View data-layer="72728692-f755-4e49-b6ac-1ab8f2bfc3cf" style={styles.faleconosco_retangulo51}></View>
        <Text data-layer="40f1f308-261c-4b71-9714-c11319f412fb" style={styles.faleconosco_sugestoes}>Sugestões</Text>
        <Text data-layer="ad21d391-5b98-49f1-b55b-bf154394a8bc" style={styles.faleconosco_informacoessobreprecos}>Informações sobre preços</Text>
        <Text data-layer="d6a1cbb4-636c-4507-a0a8-a1007f7d9e24" style={styles.faleconosco_outros}>Outros</Text>
        <View data-layer="b087f3a9-6853-4532-8399-2c424e50a2ce" style={styles.faleconosco_retangulo52}></View>
        <Text data-layer="106ca036-1e12-4bed-9ce7-93b3c5406e70" style={styles.faleconosco_duvidas}>Dúvidas</Text>
        <Text data-layer="85a6b012-9729-40b1-9a5a-597d9dd86d28" style={styles.faleconosco_descricao}>Descrição</Text>
        <View data-layer="fe14a38b-ca0c-46c7-8548-4fd8f0d7eddb" style={styles.faleconosco_retangulo53}></View>
        <Svg data-layer="547d566c-a5db-4fd5-bd64-7edcf7af9ec3" style={styles.faleconosco_caminho5} preserveAspectRatio="none" viewBox="-0.75 -0.75 270.5 25.5" fill="rgba(0, 0, 0, 0.3215686274509804)"><SvgPath d="M 0 0 L 269 0 L 269 24 L 0 24 L 0 0 Z"  /></Svg>
        <Text data-layer="410bad43-2481-4864-aec8-7fd74f2f7ae1" style={styles.faleconosco_enviar}>Enviar</Text>
        <View data-layer="234ec2cb-376f-4be0-9bca-563571216171" style={styles.faleconosco_componente613}>
            <Svg data-layer="e0143300-c3c9-41f1-9fd7-d6f6334536c4" style={styles.faleconosco_componente613_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.7500305175781 55.5765380859375" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
            <View data-layer="d4e22c16-98b1-4911-a1c8-43d2abad7dcd" style={styles.faleconosco_componente613_grupo19}>
                <ReactImage data-layer="962a87c9-b318-4fb2-b860-047d042dbe25" source={require('./assets/capacete.png')} style={styles.faleconosco_componente613_grupo19_capacete} />
                <Svg data-layer="352d9f61-a9f1-478b-95dd-14598fca947f" style={styles.faleconosco_componente613_grupo19_caminho1} preserveAspectRatio="none" viewBox="-0.75 -0.75 15.928558349609375 15.9285888671875" fill="rgba(158, 4, 4, 1)"><SvgPath d="M 7.214279174804688 0 C 11.1986141204834 0 14.42855834960938 3.229949712753296 14.42855834960938 7.21429443359375 C 14.42855834960938 11.19863796234131 11.1986141204834 14.4285888671875 7.214279174804688 14.4285888671875 C 3.229943037033081 14.4285888671875 0 11.19863796234131 0 7.21429443359375 C 0 3.229949712753296 3.229943037033081 0 7.214279174804688 0 Z"  /></Svg>
                <Text data-layer="5fee5a36-7149-4f02-817a-eaa218f5e746" style={styles.faleconosco_componente613_grupo19_x2}>2</Text>
            </View>
            <View data-layer="237f73ea-4eaf-4f19-981f-f2951c9fd4c8" style={styles.faleconosco_componente613_grupo49}>
                <ReactImage data-layer="7a9b7c9e-2514-414c-bf9f-63a1c68ada09" source={require('./assets/elipse-1.png')} style={styles.faleconosco_componente613_grupo49_elipse1} />
            </View>
            <Text data-layer="7e43f4f0-6010-4fdc-a017-fc8e8cbd3dda" style={styles.faleconosco_componente613_ruasaoclemente126}>Rua São Clemente 126</Text>
        </View>
        <View data-layer="d7878a9b-e3ff-4d10-868d-8ad13f40e665" style={styles.faleconosco_componente750}>
            <Svg data-layer="0e17996b-ebe8-46c3-bd20-006f04b98abe" style={styles.faleconosco_componente750_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 52.0107421875" fill="rgba(223, 226, 227, 1)"><SvgPath d="M 0 0 L 362 0 L 362 50.5107421875 L 0 50.5107421875 L 0 0 Z"  /></Svg>
            <View data-layer="a2d7e017-363a-40e0-99f4-201046cb2fcb" style={styles.faleconosco_componente750_grupo31}>
                <Text data-layer="e9d0486c-109e-492f-8af8-29018ac8889d" style={styles.faleconosco_componente750_grupo31_dicasenovidades}>Dicas e Novidades</Text>
                <ReactImage data-layer="50c28581-c2b4-4d99-8496-b9b4fe7d0364" source={require('./assets/lampada.png')} style={styles.faleconosco_componente750_grupo31_lampada} />
            </View>
            <View data-layer="81530e85-8e59-46a7-9a97-76f875c86ac5" style={styles.faleconosco_componente750_grupo34}>
                <Text data-layer="6701b0b6-8bf5-4b48-8f83-08a2f79efe7c" style={styles.faleconosco_componente750_grupo34_faleconosco261cd62b}>Fale conosco</Text>
                <ReactImage data-layer="a3e75b1e-9938-4b6a-82b7-117cbccbf4f0" source={require('./assets/batepapo2.png')} style={styles.faleconosco_componente750_grupo34_batepapo2} />
            </View>
            <View data-layer="d68c84f9-44e1-4d6b-b9df-f9f036d517a1" style={styles.faleconosco_componente750_grupo41}>
                <Text data-layer="fc128000-f854-4afa-86cb-8bfe3d32b166" style={styles.faleconosco_componente750_grupo41_digitalizacao}>Digitalização</Text>
                <ReactImage data-layer="62de5b2b-f0ad-4b27-a407-478fb3792ca6" source={require('./assets/maquinafotografica.png')} style={styles.faleconosco_componente750_grupo41_maquinafotografica} />
            </View>
            <View data-layer="f549f0f5-2350-4989-8425-fdc6734e4c02" style={styles.faleconosco_componente750_grupo30}>
                <Text data-layer="7a5f3b23-1b99-41c7-9832-d269a21495ed" style={styles.faleconosco_componente750_grupo30_inicio}>Início</Text>
                <ReactImage data-layer="5748ac68-e103-4ce7-99fd-8c4ed8d09f16" source={require('./assets/trabalhador.png')} style={styles.faleconosco_componente750_grupo30_trabalhador} />
            </View>
        </View>
    </ScrollView>
    );
  }
}

Faleconosco.propTypes = {

}

Faleconosco.defaultProps = {

}


const styles = StyleSheet.create({
  "faleconosco": {
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
  "faleconosco_vamostratarsobre": {
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
    "width": 134,
    "height": 20,
    "left": 22,
    "top": 59
  },
  "faleconosco_retangulo51": {
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
    "width": 196,
    "height": 125,
    "left": 22,
    "top": 84
  },
  "faleconosco_sugestoes": {
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
    "width": 68,
    "height": 20,
    "left": 34,
    "top": 120
  },
  "faleconosco_informacoessobreprecos": {
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
    "width": 171,
    "height": 20,
    "left": 34,
    "top": 150
  },
  "faleconosco_outros": {
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
    "width": 45,
    "height": 20,
    "left": 34,
    "top": 180
  },
  "faleconosco_retangulo52": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(188, 188, 251, 1)",
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
    "width": 196,
    "height": 33,
    "left": 22,
    "top": 84
  },
  "faleconosco_duvidas": {
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
    "width": 53,
    "height": 20,
    "left": 34,
    "top": 90
  },
  "faleconosco_descricao": {
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
    "width": 68,
    "height": 20,
    "left": 22,
    "top": 230
  },
  "faleconosco_retangulo53": {
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
    "height": 189,
    "left": 22,
    "top": 254
  },
  "faleconosco_caminho5": {
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
    "top": 468
  },
  "faleconosco_enviar": {
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
    "width": 43,
    "height": 20,
    "left": 160,
    "top": 470
  },
  "faleconosco_componente613": {
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
  "faleconosco_componente613_caminho6": {
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
  "faleconosco_componente613_grupo19": {
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
  "faleconosco_componente613_grupo19_capacete": {
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
  "faleconosco_componente613_grupo19_caminho1": {
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
  "faleconosco_componente613_grupo19_x2": {
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
  "faleconosco_componente613_grupo49": {
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
  "faleconosco_componente613_grupo49_elipse1": {
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
  "faleconosco_componente613_ruasaoclemente126": {
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
  "faleconosco_componente750": {
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
  "faleconosco_componente750_caminho3": {
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
  "faleconosco_componente750_grupo31": {
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
  "faleconosco_componente750_grupo31_dicasenovidades": {
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
  "faleconosco_componente750_grupo31_lampada": {
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
  "faleconosco_componente750_grupo34": {
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
  "faleconosco_componente750_grupo34_faleconosco261cd62b": {
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
    "width": 66,
    "height": 15,
    "left": 0,
    "top": 26
  },
  "faleconosco_componente750_grupo34_batepapo2": {
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
    "width": 28,
    "height": 28,
    "left": 19,
    "top": 0
  },
  "faleconosco_componente750_grupo41": {
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
  "faleconosco_componente750_grupo41_digitalizacao": {
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
  "faleconosco_componente750_grupo41_maquinafotografica": {
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
  "faleconosco_componente750_grupo30": {
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
  "faleconosco_componente750_grupo30_inicio": {
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
  "faleconosco_componente750_grupo30_trabalhador": {
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
  }
});