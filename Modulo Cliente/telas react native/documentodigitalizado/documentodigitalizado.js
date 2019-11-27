import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Documentodigitalizado extends Component {

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
    <ScrollView data-layer="01e1a34d-710e-4b55-878b-c5a9eb6d9d15" style={styles.documentodigitalizado}>
        <ReactImage data-layer="5c547abf-791c-4c5a-b517-d575f3b231a1" source={require('./assets/foto-doc.png')} style={styles.documentodigitalizado_fotodoc} />
        <View data-layer="37301a7a-a02a-4116-b82f-9145fce57571" style={styles.documentodigitalizado_grupo7}>
            <Svg data-layer="5fd593d5-820d-44cb-a1c8-34cd8461116d" style={styles.documentodigitalizado_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 55.576416015625" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="e29463ae-df98-4ea6-8c89-9f95ff3e8caa" style={styles.documentodigitalizado_digitalizardocumento}>Digitalizar documento</Text>
        <ReactImage data-layer="ebbc8bd7-c528-4452-a1ac-e75fa52df0c8" source={require('./assets/seta.png')} style={styles.documentodigitalizado_seta} />
        <View data-layer="0a4e07fd-33ae-47fc-bf46-c6eb2d77b799" style={styles.documentodigitalizado_grupo21}>
            <Svg data-layer="77ab3a10-4708-4a40-bba1-7de88693b281" style={styles.documentodigitalizado_grupo21_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="50b30931-7a96-46af-bd18-89df67fcc752" style={styles.documentodigitalizado_grupo55}>
            <Svg data-layer="d61177d6-8977-4f70-b530-2fc828d3a02d" style={styles.documentodigitalizado_grupo55_caminho3442b1cc5} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 26.02197265625" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 24.52197265625 L 0 24.52197265625 L 0 0 Z"  /></Svg>
        </View>
        <ReactImage data-layer="27333bc5-b7a7-46d8-8eac-b3b11a2bfea6" source={require('./assets/ok.png')} style={styles.documentodigitalizado_ok} />
        <ReactImage data-layer="60e9fddd-a5dd-44a6-b74e-172541c8d839" source={require('./assets/recusaretorno.png')} style={styles.documentodigitalizado_recusaretorno} />
    </ScrollView>
    );
  }
}

Documentodigitalizado.propTypes = {

}

Documentodigitalizado.defaultProps = {

}


const styles = StyleSheet.create({
  "documentodigitalizado": {
    "opacity": 1,
    "position": "relative",
    "backgroundColor": "rgba(114, 114, 114, 1)",
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
  "documentodigitalizado_fotodoc": {
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
    "left": 33,
    "top": 101
  },
  "documentodigitalizado_grupo7": {
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
  "documentodigitalizado_grupo7_caminho6": {
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
  "documentodigitalizado_digitalizardocumento": {
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
  "documentodigitalizado_seta": {
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
  "documentodigitalizado_grupo21": {
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
  "documentodigitalizado_grupo21_caminho3": {
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
  "documentodigitalizado_grupo55": {
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
  "documentodigitalizado_grupo55_caminho3442b1cc5": {
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
  },
  "documentodigitalizado_ok": {
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
    "width": 60,
    "height": 60.15,
    "left": 81,
    "top": 486
  },
  "documentodigitalizado_recusaretorno": {
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
    "width": 60,
    "height": 59.65,
    "left": 223,
    "top": 486
  }
});