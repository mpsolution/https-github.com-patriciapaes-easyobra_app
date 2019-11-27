import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Login extends Component {

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
    <ScrollView data-layer="7fbf2463-b66d-4d80-bb8a-7e3b0c720e47" style={styles.login}>
        <ReactImage data-layer="574b59b9-b91a-46e5-b3a5-2f6587546639" source={require('./assets/logo.png')} style={styles.login_logo} />
        <Text data-layer="02092f93-1b8f-4d20-ad96-9c1fca6f8900" style={styles.login_comodesejacomecar}>Como deseja começar?</Text>
        <ReactImage data-layer="e409a762-cdab-44fb-8869-9c0893fd3cab" source={require('./assets/botao-facebook.png')} style={styles.login_botaofacebook} />
        <Svg data-layer="cf9032c4-9f9d-495a-87f4-b9989402cd51" style={styles.login_linha4} preserveAspectRatio="none" viewBox="0 -0.5 323 1" fill="transparent"><SvgPath d="M 0 0 L 323 0"  /></Svg>
        <Text data-layer="1503986c-3345-4b25-b6d3-d494f63aebdd" style={styles.login_ou}>OU</Text>
        <Text data-layer="853e5b83-51bf-4f6b-9b78-1a7a68e641b3" style={styles.login_qualoseuemail}>Qual o seu email?</Text>
        <Svg data-layer="a693fb5b-2ac2-494b-abb1-86b8a71d1ae5" style={styles.login_caminho4} preserveAspectRatio="none" viewBox="-0.75 -0.75 270.5 29.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 0 0 L 269 0 L 269 28 L 0 28 L 0 0 Z"  /></Svg>
        <Svg data-layer="2749f49c-cab9-4705-bb05-208fa7cbcf97" style={styles.login_caminho5} preserveAspectRatio="none" viewBox="-0.75 -0.75 270.5 25.5" fill="rgba(0, 0, 0, 0.3215686274509804)"><SvgPath d="M 0 0 L 269 0 L 269 24 L 0 24 L 0 0 Z"  /></Svg>
        <Text data-layer="afc9697b-d692-4ea3-8016-64ef0eed21b6" style={styles.login_entrarcomoemail}>Entrar com o email</Text>
    </ScrollView>
    );
  }
}

Login.propTypes = {

}

Login.defaultProps = {

}


const styles = StyleSheet.create({
  "login": {
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
  "login_logo": {
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
    "width": 333.5,
    "height": 329.5,
    "left": 12,
    "top": 14
  },
  "login_comodesejacomecar": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(121, 135, 151, 1)",
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
    "left": 82,
    "top": 386
  },
  "login_botaofacebook": {
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
    "width": 269,
    "height": 39.5,
    "left": 46,
    "top": 435
  },
  "login_linha4": {
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
    "width": 323,
    "height": 1,
    "left": 18.5,
    "top": 496
  },
  "login_ou": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(121, 135, 151, 1)",
    "fontSize": 12,
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
    "width": 18,
    "height": 16,
    "left": 171,
    "top": 497
  },
  "login_qualoseuemail": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(121, 135, 151, 1)",
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
    "width": 107,
    "height": 17,
    "left": 46,
    "top": 525
  },
  "login_caminho4": {
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
    "height": 28,
    "left": 46,
    "top": 552
  },
  "login_caminho5": {
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
    "top": 595
  },
  "login_entrarcomoemail": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(255, 255, 255, 1)",
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
    "width": 115,
    "height": 17,
    "left": 123,
    "top": 598
  }
});