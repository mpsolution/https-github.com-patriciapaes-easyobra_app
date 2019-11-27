import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Incluirdocumentos extends Component {

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
    <ScrollView data-layer="46ad73b8-7c56-48d2-990c-a4e2d279a57e" style={styles.incluirdocumentos}>
        <View data-layer="5022a375-f858-42de-9424-79d8c6ffdb98" style={styles.incluirdocumentos_grupo7}>
            <Svg data-layer="ee0b0070-11c2-42bd-b191-2c8d2d3abfc2" style={styles.incluirdocumentos_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.7500305175781 55.576416015625" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="bf2ca3f5-390c-40f2-b9e3-6edd35fdafcc" style={styles.incluirdocumentos_grupo10}>
            <Svg data-layer="3ffafdcf-2acc-400e-b579-a12a531d230b" style={styles.incluirdocumentos_grupo10_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="32af94f0-c17e-45f1-b61e-bec38a4b0b84" style={styles.incluirdocumentos_incluirdocumentos58e310c7}>Incluir documentos</Text>
        <ReactImage data-layer="f2bac4de-bde0-4d30-8951-b6be2a611781" source={require('./assets/seta.png')} style={styles.incluirdocumentos_seta} />
        <View data-layer="a472ca7d-911d-4dc4-92b2-d338b6b9b7e4" style={styles.incluirdocumentos_grupo21}>
            <Svg data-layer="aad420c9-464f-47fb-b701-f09c7338ef7e" style={styles.incluirdocumentos_grupo21_caminho328d16f6b} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Svg data-layer="fb8c96bd-4d54-4461-8055-bab0b0354fd8" style={styles.incluirdocumentos_linha9} preserveAspectRatio="none" viewBox="-0.5 0 1 23" fill="transparent"><SvgPath d="M 0 0 L 0 23"  /></Svg>
        <Svg data-layer="83895fc6-6998-479d-8e4f-e7c4c6138cb2" style={styles.incluirdocumentos_linha10} preserveAspectRatio="none" viewBox="-0.5 0 1 23" fill="transparent"><SvgPath d="M 0 0 L 0 23"  /></Svg>
        <Svg data-layer="786f2b39-33e4-404a-a9f4-6e0bdef3c9cd" style={styles.incluirdocumentos_linha11} preserveAspectRatio="none" viewBox="-0.5 0 1 23" fill="transparent"><SvgPath d="M 0 0 L 0 23"  /></Svg>
        <View data-layer="13c54492-60d0-4b25-80e9-5baf2e656ef0" style={styles.incluirdocumentos_retangulo64}></View>
        <Text data-layer="b6002eff-356c-4e73-a905-53bb2c6e46dc" style={styles.incluirdocumentos_nfavulsa}>NF Avulsa</Text>
        <Text data-layer="d5ce1aa3-2c3f-4b48-ab47-1f9966fd2688" style={styles.incluirdocumentos_materialhidraulicotub}>Material hidráulico (Tub ...</Text>
        <Text data-layer="a724be93-d1ad-4876-9848-042ab6e2bed9" style={styles.incluirdocumentos_x26112019}>26/11/2019</Text>
        <Text data-layer="7b7c29da-d106-4395-955b-d54dae1a3791" style={styles.incluirdocumentos_r}>R$79,10</Text>
        <Svg data-layer="4a25f403-a5f7-4091-8f09-40e159568c98" style={styles.incluirdocumentos_poligono2} preserveAspectRatio="none" viewBox="0 0 5 5" fill="rgba(73, 90, 107, 1)"><SvgPath d="M 2.499999761581421 0 L 5 5 L 0 5 Z"  /></Svg>
        <ReactImage data-layer="0cda1de9-9f2d-4218-b5bf-e779801945e3" source={require('./assets/foto-doc.png')} style={styles.incluirdocumentos_fotodoc} />
        <ReactImage data-layer="2fce4a84-1e66-4c18-ad3b-905542d905f4" source={require('./assets/ok.png')} style={styles.incluirdocumentos_ok} />
    </ScrollView>
    );
  }
}

Incluirdocumentos.propTypes = {

}

Incluirdocumentos.defaultProps = {

}


const styles = StyleSheet.create({
  "incluirdocumentos": {
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
  "incluirdocumentos_grupo7": {
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
  "incluirdocumentos_grupo7_caminho6": {
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
  "incluirdocumentos_grupo10": {
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
  "incluirdocumentos_grupo10_caminho3": {
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
  "incluirdocumentos_incluirdocumentos58e310c7": {
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
    "width": 181,
    "height": 27,
    "left": 95,
    "top": 14
  },
  "incluirdocumentos_seta": {
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
  "incluirdocumentos_grupo21": {
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
  "incluirdocumentos_grupo21_caminho328d16f6b": {
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
  "incluirdocumentos_linha9": {
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
    "width": 1,
    "height": 23,
    "left": 278,
    "top": 118.5
  },
  "incluirdocumentos_linha10": {
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
    "width": 1,
    "height": 23,
    "left": 82,
    "top": 118.5
  },
  "incluirdocumentos_linha11": {
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
    "width": 1,
    "height": 23,
    "left": 218,
    "top": 118.5
  },
  "incluirdocumentos_retangulo64": {
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
    "borderTopWidth": 1,
    "borderTopColor": "rgba(0, 0, 0, 1)",
    "borderRightWidth": 1,
    "borderRightColor": "rgba(0, 0, 0, 1)",
    "borderBottomWidth": 1,
    "borderBottomColor": "rgba(0, 0, 0, 1)",
    "borderLeftWidth": 1,
    "borderLeftColor": "rgba(0, 0, 0, 1)",
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 314,
    "height": 24,
    "left": 18,
    "top": 118
  },
  "incluirdocumentos_nfavulsa": {
    "opacity": 0.3499999940395355,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(73, 90, 107, 1)",
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
    "width": 47,
    "height": 14,
    "left": 23,
    "top": 122
  },
  "incluirdocumentos_materialhidraulicotub": {
    "opacity": 0.3499999940395355,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(73, 90, 107, 1)",
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
    "width": 124,
    "height": 14,
    "left": 88,
    "top": 122
  },
  "incluirdocumentos_x26112019": {
    "opacity": 0.3499999940395355,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(73, 90, 107, 1)",
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
    "left": 221,
    "top": 122
  },
  "incluirdocumentos_r": {
    "opacity": 0.3499999940395355,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(73, 90, 107, 1)",
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
    "width": 38,
    "height": 14,
    "left": 282,
    "top": 122
  },
  "incluirdocumentos_poligono2": {
    "opacity": 0.75,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "width": 5,
    "height": 5,
    "left": 74,
    "top": 128
  },
  "incluirdocumentos_fotodoc": {
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
    "width": 294.5,
    "height": 362.5,
    "left": 28,
    "top": 183
  },
  "incluirdocumentos_ok": {
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
    "width": 12,
    "height": 12.03,
    "left": 334,
    "top": 123
  }
});