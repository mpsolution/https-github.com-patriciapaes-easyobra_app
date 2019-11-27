import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Digitalizardocumento extends Component {

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
    <ScrollView data-layer="fabf41d2-02d0-4af5-a4e5-e74435f6912b" style={styles.digitalizardocumento}>
        <View data-layer="a771f61d-ad0f-46fd-b3cc-5ab014f66f7e" style={styles.digitalizardocumento_retangulo76}></View>
        <ReactImage data-layer="f6dd341b-dfaf-404f-920b-01d1dde071ad" source={require('./assets/botao-camera.png')} style={styles.digitalizardocumento_botaocamera} />
        <View data-layer="35d88208-fee6-408c-8732-09b7b6aee881" style={styles.digitalizardocumento_grupo7}>
            <Svg data-layer="8149db47-6f71-4058-8d08-14f6612610f5" style={styles.digitalizardocumento_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 55.5765380859375" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="2672a262-869a-41e4-be64-14eee1242434" style={styles.digitalizardocumento_digitalizardocumento7f041e77}>Digitalizar documento</Text>
        <ReactImage data-layer="b47d90ed-f36e-4dbb-a166-a8a0699ab599" source={require('./assets/seta.png')} style={styles.digitalizardocumento_seta} />
        <View data-layer="c0a5ce30-9482-4fc0-86ff-0f4718a6352d" style={styles.digitalizardocumento_grupo21}>
            <Svg data-layer="bb1de9e6-497e-4cd4-be0f-0dacc9a18c2f" style={styles.digitalizardocumento_grupo21_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="71e82a98-2f1b-4482-9646-0c0022ca85db" style={styles.digitalizardocumento_grupo55}>
            <Svg data-layer="2a4d4745-0d10-4d18-aaeb-2d5300da90c8" style={styles.digitalizardocumento_grupo55_caminho34059d3ac} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 26.02197265625" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 24.52197265625 L 0 24.52197265625 L 0 0 Z"  /></Svg>
        </View>
    </ScrollView>
    );
  }
}

Digitalizardocumento.propTypes = {

}

Digitalizardocumento.defaultProps = {

}


const styles = StyleSheet.create({
  "digitalizardocumento": {
    "opacity": 1,
    "position": "relative",
    "backgroundColor": "rgba(114, 114, 114, 0.9215686274509803)",
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
  "digitalizardocumento_retangulo76": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(212, 208, 208, 1)",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "paddingTop": 0,
    "paddingRight": 0,
    "paddingBottom": 0,
    "paddingLeft": 0,
    "borderTopWidth": 1,
    "borderTopColor": "rgba(212, 208, 208, 1)",
    "borderRightWidth": 1,
    "borderRightColor": "rgba(212, 208, 208, 1)",
    "borderBottomWidth": 1,
    "borderBottomColor": "rgba(212, 208, 208, 1)",
    "borderLeftWidth": 1,
    "borderLeftColor": "rgba(212, 208, 208, 1)",
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 318,
    "height": 362,
    "left": 21,
    "top": 101
  },
  "digitalizardocumento_botaocamera": {
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
    "width": 83,
    "height": 82,
    "left": 139,
    "top": 480
  },
  "digitalizardocumento_grupo7": {
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
  "digitalizardocumento_grupo7_caminho6": {
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
  "digitalizardocumento_digitalizardocumento7f041e77": {
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
    "width": 210,
    "height": 27,
    "left": 75,
    "top": 14
  },
  "digitalizardocumento_seta": {
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
  "digitalizardocumento_grupo21": {
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
  "digitalizardocumento_grupo21_caminho3": {
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
  "digitalizardocumento_grupo55": {
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
    "height": 24.52,
    "left": 0,
    "top": 615.48
  },
  "digitalizardocumento_grupo55_caminho34059d3ac": {
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
    "height": 24.52,
    "left": 0,
    "top": 0
  }
});