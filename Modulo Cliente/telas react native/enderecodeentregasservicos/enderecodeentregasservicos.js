import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Enderecodeentregasservicos extends Component {

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
    <ScrollView data-layer="c23bd572-dfe6-42fe-811b-7c685955dfc7" style={styles.enderecodeentregasservicos}>
        <View data-layer="00fdb632-73d1-4136-8071-09bf09ba596b" style={styles.enderecodeentregasservicos_grupo7}>
            <Svg data-layer="03b47ac9-da0f-4c60-9e5d-c2f05ca81ac4" style={styles.enderecodeentregasservicos_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 84.75" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 83 L 0 83 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="31d72ae4-22e1-4eba-a5bf-11a955759974" style={styles.enderecodeentregasservicos_grupo10}>
            <Svg data-layer="779878bc-8c56-4696-a50f-6aa579b372f0" style={styles.enderecodeentregasservicos_grupo10_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 31.4283447265625" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 361.9999694824219 0 L 361.9999694824219 29.9283447265625 L 0 29.9283447265625 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="25558d21-581f-4421-a97c-35512d5c7745" style={styles.enderecodeentregasservicos_escolhaoenderecodeentregasservicos}>Escolha o endereço de entregas
/serviços</Text>
        <ReactImage data-layer="bfcb2ef6-80de-40f9-972b-b36320f3724a" source={require('./assets/seta.png')} style={styles.enderecodeentregasservicos_seta} />
        <View data-layer="497c26ec-7d91-401d-9655-bb3b2c2c7d5b" style={styles.enderecodeentregasservicos_grupo21}>
            <Svg data-layer="eb316119-7430-4ec0-ab36-676faee275ef" style={styles.enderecodeentregasservicos_grupo21_caminho305a62513} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 361.9999694824219 0 L 361.9999694824219 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="8aea3417-0ed9-4f3a-9a12-55b1e818f143" style={styles.enderecodeentregasservicos_retangulo23}></View>
        <View data-layer="9c949932-254f-409d-875e-4da39a8f3e34" style={styles.enderecodeentregasservicos_retangulo25}></View>
        <Text data-layer="31e2d79e-ec92-4b21-92dc-84a431658f0b" style={styles.enderecodeentregasservicos_localizacaoatual}>Localização atual</Text>
        <Text data-layer="e6b6b9f2-cd0a-4e0b-bd03-f095e2452517" style={styles.enderecodeentregasservicos_ruasaoclemente126apt201}>Rua São Clemente 126 apt 201</Text>
        <ReactImage data-layer="22d15a55-5455-4a29-a96c-b761700ffd65" source={require('./assets/localizacao-atual.png')} style={styles.enderecodeentregasservicos_localizacaoatual1} />
        <Text data-layer="7ee0219c-c125-4985-89f7-15e9b3b6a784" style={styles.enderecodeentregasservicos_casa}>Casa</Text>
        <View data-layer="bbbd83f1-4314-497f-8404-c5a1fac2e2ac" style={styles.enderecodeentregasservicos_retangulo27}></View>
        <Text data-layer="3ba99827-9f75-4633-a91b-793edd36baa5" style={styles.enderecodeentregasservicos_ruapasteur138}>Rua Pasteur 138</Text>
        <ReactImage data-layer="69877697-fa6c-441d-8f0a-b8998156a6c4" source={require('./assets/local.png')} style={styles.enderecodeentregasservicos_local} />
        <Text data-layer="5158bb8e-d1bb-406b-a34e-8383799c0047" style={styles.enderecodeentregasservicos_escritorio}>Escritório</Text>
        <ReactImage data-layer="121582f5-562b-4be0-ab2a-ca97e09e24cf" source={require('./assets/lixeira.png')} style={styles.enderecodeentregasservicos_lixeira} />
        <ReactImage data-layer="ecc35bca-2224-46c6-ba6e-3853170f270f" source={require('./assets/lixeira-64dbfc7a.png')} style={styles.enderecodeentregasservicos_lixeira1} />
        <ReactImage data-layer="d8a961c1-8d05-4444-b560-f7634625c82a" source={require('./assets/localizacaoadicionar.png')} style={styles.enderecodeentregasservicos_localizacaoadicionar} />
        <Text data-layer="6491d33e-13b4-4019-8428-eca0e2a2c7f1" style={styles.enderecodeentregasservicos_insiraumnovoendereco}>Insira um novo endereço</Text>
        <View data-layer="5dc074b8-35d7-435b-a5b4-53524981b8d8" style={styles.enderecodeentregasservicos_grupo22}>
            <Svg data-layer="7982263f-1d51-47c0-b571-d9a7cba7fea6" style={styles.enderecodeentregasservicos_grupo22_caminho3ea887952} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 156.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 361.9999694824219 0 L 361.9999694824219 155 L 0 155 L 0 0 Z"  /></Svg>
        </View>
        <ReactImage data-layer="9ea9ac29-cec1-4935-8a7d-64db02227ebd" source={require('./assets/localizacaopadrao.png')} style={styles.enderecodeentregasservicos_localizacaopadrao} />
    </ScrollView>
    );
  }
}

Enderecodeentregasservicos.propTypes = {

}

Enderecodeentregasservicos.defaultProps = {

}


const styles = StyleSheet.create({
  "enderecodeentregasservicos": {
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
  "enderecodeentregasservicos_grupo7": {
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
    "height": 83,
    "left": 0,
    "top": 0
  },
  "enderecodeentregasservicos_grupo7_caminho6": {
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
    "height": 86.5,
    "left": -1.5,
    "top": -1.5
  },
  "enderecodeentregasservicos_grupo10": {
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
    "height": 29.93,
    "left": -1,
    "top": 401
  },
  "enderecodeentregasservicos_grupo10_caminho3": {
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
    "height": 29.93,
    "left": 0,
    "top": 0
  },
  "enderecodeentregasservicos_escolhaoenderecodeentregasservicos": {
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
    "width": 295,
    "height": 54,
    "left": 57,
    "top": 14
  },
  "enderecodeentregasservicos_seta": {
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
    "top": 33.26
  },
  "enderecodeentregasservicos_grupo21": {
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
    "height": 15,
    "left": -1,
    "top": 83
  },
  "enderecodeentregasservicos_grupo21_caminho305a62513": {
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
    "height": 15,
    "left": 0,
    "top": 0
  },
  "enderecodeentregasservicos_retangulo23": {
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
    "height": 65,
    "left": -1,
    "top": 98
  },
  "enderecodeentregasservicos_retangulo25": {
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
    "height": 65,
    "left": -1,
    "top": 162
  },
  "enderecodeentregasservicos_localizacaoatual": {
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
    "width": 104,
    "height": 17,
    "left": 67,
    "top": 125
  },
  "enderecodeentregasservicos_ruasaoclemente126apt201": {
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
    "width": 176,
    "height": 17,
    "left": 67,
    "top": 195
  },
  "enderecodeentregasservicos_localizacaoatual1": {
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
    "width": 34,
    "height": 30.48,
    "left": 20,
    "top": 117
  },
  "enderecodeentregasservicos_casa": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 17,
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
    "width": 36,
    "height": 22,
    "left": 67,
    "top": 176
  },
  "enderecodeentregasservicos_retangulo27": {
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
    "height": 65,
    "left": -1,
    "top": 226
  },
  "enderecodeentregasservicos_ruapasteur138": {
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
    "width": 92,
    "height": 17,
    "left": 67,
    "top": 259
  },
  "enderecodeentregasservicos_local": {
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
    "height": 29.82,
    "left": 24,
    "top": 242
  },
  "enderecodeentregasservicos_escritorio": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 17,
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
    "width": 75,
    "height": 22,
    "left": 67,
    "top": 240
  },
  "enderecodeentregasservicos_lixeira": {
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
    "width": 15,
    "height": 15,
    "left": 312,
    "top": 183
  },
  "enderecodeentregasservicos_lixeira1": {
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
    "width": 15,
    "height": 15,
    "left": 312,
    "top": 252
  },
  "enderecodeentregasservicos_localizacaoadicionar": {
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
    "height": 33.16,
    "left": 25,
    "top": 443
  },
  "enderecodeentregasservicos_insiraumnovoendereco": {
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
    "width": 151,
    "height": 17,
    "left": 67,
    "top": 451
  },
  "enderecodeentregasservicos_grupo22": {
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
    "height": 155,
    "left": -1,
    "top": 485
  },
  "enderecodeentregasservicos_grupo22_caminho3ea887952": {
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
    "height": 155,
    "left": 0,
    "top": 0
  },
  "enderecodeentregasservicos_localizacaopadrao": {
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
    "height": 29.82,
    "left": 24,
    "top": 178
  }
});