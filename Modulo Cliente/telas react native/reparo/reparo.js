import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Reparo extends Component {

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
    <ScrollView data-layer="c5c8a825-ff7d-4031-a25f-d393345dc285" style={styles.reparo}>
        <View data-layer="8f397050-619b-4f76-9163-4da7fc92f887" style={styles.reparo_retangulo46}></View>
        <View data-layer="4d1fa7a1-e757-4940-8adc-4aa4f39b778a" style={styles.reparo_retangulo47}></View>
        <View data-layer="d7267c77-02bc-4a83-9fde-9ca465ecb76d" style={styles.reparo_retangulo48}></View>
        <Svg data-layer="2c3983e7-c255-4d94-b8e3-4df29314428e" style={styles.reparo_caminho13} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 181.5104064941406 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Svg data-layer="eaee7653-3411-4446-b514-e8044d332491" style={styles.reparo_caminho12} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Svg data-layer="1b3de4c2-6f55-4a2d-a801-042dff4ea154" style={styles.reparo_caminho14} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Svg data-layer="22ffe05a-269c-4c8d-87a6-0914c10da6c4" style={styles.reparo_caminho15} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Svg data-layer="63f34deb-b154-4985-8aa4-fbd490519bbf" style={styles.reparo_caminho16} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <View data-layer="43961ee2-55c8-44c1-b363-5981f570fa99" style={styles.reparo_retangulo77}></View>
        <View data-layer="024e0d50-539f-4711-a70e-159e34b5b6ee" style={styles.reparo_retangulo78}></View>
        <Svg data-layer="fbc62592-f875-4837-b185-9449cac11541" style={styles.reparo_caminho17} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 181.5104064941406 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Svg data-layer="84f90306-f4fc-48d0-8d34-1acefd28881d" style={styles.reparo_caminho18} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Svg data-layer="115696d5-49aa-4c14-9c98-e7a56c180865" style={styles.reparo_caminho20} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Svg data-layer="38370a9f-bdf3-4445-8082-1759be7b7dea" style={styles.reparo_caminho21} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Svg data-layer="11323f69-33dd-41e8-813e-c9b6bcb08b13" style={styles.reparo_caminho22} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Svg data-layer="9a9ff768-fadf-49bd-ae4d-78b3f142cf32" style={styles.reparo_caminho23} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 39.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 362 0 L 362 38 L 0 38 L 0 0 Z"  /></Svg>
        <Text data-layer="93bdac22-bc99-45da-af7b-d9ea35016af3" style={styles.reparo_pintor}>Pintor</Text>
        <Text data-layer="8cd19f0d-a3c4-428c-9db5-42c7debd0193" style={styles.reparo_eletricista}>Eletricista</Text>
        <Text data-layer="123eb797-8888-4ecb-a341-c54831dbe0ac" style={styles.reparo_marceneiro}>Marceneiro</Text>
        <Text data-layer="41874211-9068-470d-ba31-a5d56c6415d6" style={styles.reparo_vidraceiro}>Vidraceiro</Text>
        <Text data-layer="b88e4dce-3e67-44d2-a546-f3bb6198a468" style={styles.reparo_telhadista}>Telhadista</Text>
        <Text data-layer="e0eac2e2-296d-4082-896b-fc646b5c6f3e" style={styles.reparo_pedreiromestredeobra}>Pedreiro / Mestre de obra</Text>
        <Text data-layer="5d92e403-94aa-4c24-8b1f-c43f2fdab1a2" style={styles.reparo_gasista}>Gasista</Text>
        <Text data-layer="9ea7f22d-eebb-457b-bdb0-44600bfbf465" style={styles.reparo_bombeirohidraulico}>Bombeiro Hidráulico</Text>
        <Text data-layer="03aa305a-2d71-4642-a02e-7cdfae3f2f8b" style={styles.reparo_chaveiro}>Chaveiro</Text>
        <Text data-layer="1fe1dc54-f594-4536-879c-9ba8683faab6" style={styles.reparo_assoalho}>Assoalho</Text>
        <Text data-layer="2efad637-d97a-46a1-950e-929e81399fda" style={styles.reparo_piscina}>Piscina</Text>
        <Text data-layer="8a47442a-437d-4d6a-b6ef-f9e4984ca1ea" style={styles.reparo_camerasdeseguranca}>Câmeras de Segurança</Text>
        <Text data-layer="eb2ec416-b987-40d4-bead-1215d77a439e" style={styles.reparo_arcondicionado}>Ar-condicionado</Text>
        <Text data-layer="f7bfab7c-086d-42c9-a05a-1b4a0b4f26d5" style={styles.reparo_interfone}>Interfone</Text>
        <Text data-layer="0b569c98-36ff-4fec-aeb5-22e1fb0bd353" style={styles.reparo_serralheiro}>Serralheiro</Text>
        <Text data-layer="55351709-73c3-44b0-903b-6fbfcd3fc2a0" style={styles.reparo_outros}>Outros</Text>
    </ScrollView>
    );
  }
}

Reparo.propTypes = {

}

Reparo.defaultProps = {

}


const styles = StyleSheet.create({
  "reparo": {
    "opacity": 1,
    "position": "relative",
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
    "height": 608,
    "left": 0,
    "top": 0
  },
  "reparo_retangulo46": {
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
    "height": 38,
    "left": -1,
    "top": 0
  },
  "reparo_retangulo47": {
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
    "height": 38,
    "left": -1,
    "top": 38
  },
  "reparo_retangulo48": {
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
    "height": 38,
    "left": -1,
    "top": 76
  },
  "reparo_caminho13": {
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
    "height": 38,
    "left": -1,
    "top": 114
  },
  "reparo_caminho12": {
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
    "height": 38,
    "left": -1,
    "top": 228
  },
  "reparo_caminho14": {
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
    "height": 38,
    "left": -1,
    "top": 152
  },
  "reparo_caminho15": {
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
    "height": 38,
    "left": -1,
    "top": 190
  },
  "reparo_caminho16": {
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
    "height": 38,
    "left": -1,
    "top": 266
  },
  "reparo_retangulo77": {
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
    "height": 38,
    "left": -1,
    "top": 304
  },
  "reparo_retangulo78": {
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
    "height": 38,
    "left": -1,
    "top": 342
  },
  "reparo_caminho17": {
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
    "height": 38,
    "left": -1,
    "top": 380
  },
  "reparo_caminho18": {
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
    "height": 38,
    "left": -1,
    "top": 418
  },
  "reparo_caminho20": {
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
    "height": 38,
    "left": -1,
    "top": 456
  },
  "reparo_caminho21": {
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
    "height": 38,
    "left": -1,
    "top": 494
  },
  "reparo_caminho22": {
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
    "height": 38,
    "left": -1,
    "top": 532
  },
  "reparo_caminho23": {
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
    "height": 38,
    "left": -1,
    "top": 570
  },
  "reparo_pintor": {
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
    "left": 12,
    "top": 10.02
  },
  "reparo_eletricista": {
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
    "width": 54,
    "height": 17,
    "left": 12,
    "top": 48.41
  },
  "reparo_marceneiro": {
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
    "width": 65,
    "height": 17,
    "left": 12,
    "top": 86.3
  },
  "reparo_vidraceiro": {
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
    "width": 58,
    "height": 17,
    "left": 12,
    "top": 124.68
  },
  "reparo_telhadista": {
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
    "width": 57,
    "height": 17,
    "left": 12,
    "top": 276.57
  },
  "reparo_pedreiromestredeobra": {
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
    "width": 148,
    "height": 17,
    "left": 12,
    "top": 200.98
  },
  "reparo_gasista": {
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
    "width": 41,
    "height": 17,
    "left": 12,
    "top": 162.3
  },
  "reparo_bombeirohidraulico": {
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
    "width": 118,
    "height": 17,
    "left": 12,
    "top": 238.46
  },
  "reparo_chaveiro": {
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
    "width": 50,
    "height": 17,
    "left": 12,
    "top": 314.53
  },
  "reparo_assoalho": {
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
    "width": 52,
    "height": 17,
    "left": 12,
    "top": 390.48
  },
  "reparo_piscina": {
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
    "width": 39,
    "height": 17,
    "left": 12,
    "top": 428.48
  },
  "reparo_camerasdeseguranca": {
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
    "width": 131,
    "height": 17,
    "left": 12,
    "top": 466.72
  },
  "reparo_arcondicionado": {
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
    "width": 96,
    "height": 17,
    "left": 12,
    "top": 505.14
  },
  "reparo_interfone": {
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
    "width": 52,
    "height": 17,
    "left": 12,
    "top": 542.71
  },
  "reparo_serralheiro": {
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
    "width": 62,
    "height": 17,
    "left": 12,
    "top": 352.6
  },
  "reparo_outros": {
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
    "width": 39,
    "height": 17,
    "left": 12,
    "top": 580.53
  }
});