import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Meusprojetos extends Component {

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
    <ScrollView data-layer="12cda00b-1521-478c-8cc4-ef9e0d98c5fd" style={styles.meusprojetos}>
        <View data-layer="aaafaeb0-ece6-4cd0-bca0-c82250f6feeb" style={styles.meusprojetos_grupo7}>
            <Svg data-layer="e16267ea-b215-4ba9-a1ec-9664a6a8dd76" style={styles.meusprojetos_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 55.57647705078125" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="556380d9-38d9-4ffb-a749-d220d757dd85" style={styles.meusprojetos_grupo10}>
            <Svg data-layer="8e83c883-f790-4fd7-929e-277d010ee480" style={styles.meusprojetos_grupo10_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="abe72402-be63-4581-8c44-1f9dbeb6ecf8" style={styles.meusprojetos_meusprojetos1b58e16e}>Meus projetos</Text>
        <ReactImage data-layer="798f4e93-f074-4f3c-9500-a076271d42d8" source={require('./assets/seta.png')} style={styles.meusprojetos_seta} />
        <View data-layer="0af9d564-0ac4-4622-a76c-50646b4c9726" style={styles.meusprojetos_grupo21}>
            <Svg data-layer="2c79ca89-406a-4b7b-8732-f1daad93fdc4" style={styles.meusprojetos_grupo21_caminho36bcd4a96} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="3afa459f-723b-4231-9d9c-89cf8b99bb30" style={styles.meusprojetos_retangulo18}></View>
        <Text data-layer="21c698a7-d22a-423d-925d-b77a210e7828" style={styles.meusprojetos_adicionarnovodocumento}>Adicionar novo documento</Text>
        <View data-layer="a170ad96-5b3e-42fa-9947-6eca84e93c29" style={styles.meusprojetos_retangulo23}></View>
        <Text data-layer="373890ca-c045-4700-8e8b-99ccf2b53f6a" style={styles.meusprojetos_banheironovo}>Banheiro novo</Text>
        <ReactImage data-layer="29d64231-05ce-4b64-b668-84d2ac6f7caf" source={require('./assets/pastadocumentos.png')} style={styles.meusprojetos_pastadocumentos} />
        <Text data-layer="b95ca8b6-f868-44fc-8b6c-4914f4023390" style={styles.meusprojetos_x7documentosatualmente}>7 documentos atualmente</Text>
        <View data-layer="f42c529b-c2d1-4dbd-bdbf-d3ef30b11591" style={styles.meusprojetos_retangulo25}></View>
        <Text data-layer="66c579e4-5957-41bd-b869-da7e7a48a12c" style={styles.meusprojetos_trocadecaixadagua}>Troca de caixa d´água</Text>
        <ReactImage data-layer="b514d049-e882-49ed-af91-14f5be390beb" source={require('./assets/pastadocumentos-6e5142c6.png')} style={styles.meusprojetos_pastadocumentos1} />
        <Text data-layer="c091cbf8-7342-486d-ab3d-9ef442833e18" style={styles.meusprojetos_x3documentosatualmente}>3 documentos atualmente</Text>
        <View data-layer="16bb2304-9574-4803-99f3-3120aed4a62d" style={styles.meusprojetos_retangulo26}></View>
        <Text data-layer="113cbc4b-dfb4-4a34-a7cc-b1b14edf2d47" style={styles.meusprojetos_vazamentopiacozinha}>Vazamento pia cozinha</Text>
        <ReactImage data-layer="48d7887c-2029-41c3-acce-d58862a25bee" source={require('./assets/pastadocumentos-fde4fb58.png')} style={styles.meusprojetos_pastadocumentos2} />
        <Text data-layer="f868e25d-eafa-4d53-8426-44d2bb85e69b" style={styles.meusprojetos_x2documentosatualmente}>2 documentos atualmente</Text>
    </ScrollView>
    );
  }
}

Meusprojetos.propTypes = {

}

Meusprojetos.defaultProps = {

}


const styles = StyleSheet.create({
  "meusprojetos": {
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
  "meusprojetos_grupo7": {
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
  "meusprojetos_grupo7_caminho6": {
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
  "meusprojetos_grupo10": {
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
  "meusprojetos_grupo10_caminho3": {
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
  "meusprojetos_meusprojetos1b58e16e": {
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
    "width": 134,
    "height": 27,
    "left": 113,
    "top": 14
  },
  "meusprojetos_seta": {
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
  "meusprojetos_grupo21": {
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
  "meusprojetos_grupo21_caminho36bcd4a96": {
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
  "meusprojetos_retangulo18": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(0, 0, 0, 0.3215686274509804)",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "borderTopWidth": 1,
    "borderTopColor": "rgba(0, 0, 0, 0.1607843137254902)",
    "borderRightWidth": 1,
    "borderRightColor": "rgba(0, 0, 0, 0.1607843137254902)",
    "borderBottomWidth": 1,
    "borderBottomColor": "rgba(0, 0, 0, 0.1607843137254902)",
    "borderLeftWidth": 1,
    "borderLeftColor": "rgba(0, 0, 0, 0.1607843137254902)",
    "borderTopLeftRadius": 3,
    "borderTopRightRadius": 3,
    "borderBottomLeftRadius": 3,
    "borderBottomRightRadius": 3,
    "width": 324,
    "height": 33,
    "left": 18,
    "top": 581
  },
  "meusprojetos_adicionarnovodocumento": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(255, 255, 255, 1)",
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
    "width": 256,
    "height": 27,
    "left": 54,
    "top": 582
  },
  "meusprojetos_retangulo23": {
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
    "top": 67
  },
  "meusprojetos_banheironovo": {
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
    "width": 89,
    "height": 17,
    "left": 93,
    "top": 77
  },
  "meusprojetos_pastadocumentos": {
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
    "width": 30,
    "height": 28.37,
    "left": 30,
    "top": 85
  },
  "meusprojetos_x7documentosatualmente": {
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
    "width": 150,
    "height": 17,
    "left": 93,
    "top": 100
  },
  "meusprojetos_retangulo25": {
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
    "top": 131
  },
  "meusprojetos_trocadecaixadagua": {
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
    "width": 132,
    "height": 17,
    "left": 93,
    "top": 141
  },
  "meusprojetos_pastadocumentos1": {
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
    "width": 30,
    "height": 28.37,
    "left": 30,
    "top": 149
  },
  "meusprojetos_x3documentosatualmente": {
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
    "width": 150,
    "height": 17,
    "left": 93,
    "top": 164
  },
  "meusprojetos_retangulo26": {
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
    "top": 195
  },
  "meusprojetos_vazamentopiacozinha": {
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
    "width": 140,
    "height": 17,
    "left": 93,
    "top": 205
  },
  "meusprojetos_pastadocumentos2": {
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
    "width": 30,
    "height": 28.37,
    "left": 30,
    "top": 213
  },
  "meusprojetos_x2documentosatualmente": {
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
    "width": 150,
    "height": 17,
    "left": 93,
    "top": 228
  }
});