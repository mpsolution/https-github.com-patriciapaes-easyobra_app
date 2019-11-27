import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Indicacaodeprofissional extends Component {

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
    <ScrollView data-layer="c8404c0b-8e93-4b0d-ac4e-80b0a5accd3f" style={styles.indicacaodeprofissional}>
        <View data-layer="a96ad41f-5c92-4444-9666-792da8a43f02" style={styles.indicacaodeprofissional_grupo7}>
            <Svg data-layer="d2a2f012-e8b9-491c-bbd9-4d63cdd71794" style={styles.indicacaodeprofissional_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 55.57647705078125" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="96a7f296-4804-4cac-8c95-8c4f4c5df7ac" style={styles.indicacaodeprofissional_grupo10}>
            <Svg data-layer="59c65212-e692-4afa-bbd0-58abfdb57751" style={styles.indicacaodeprofissional_grupo10_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="20974359-0932-4adb-9c03-7a7514688440" style={styles.indicacaodeprofissional_indicacaodeprofissional959a3474}>Indicação de profissional</Text>
        <ReactImage data-layer="84246804-0c19-4243-96ee-ed200a9d824f" source={require('./assets/seta.png')} style={styles.indicacaodeprofissional_seta} />
        <View data-layer="c83cb759-9c20-4768-83d9-d26f8139ad34" style={styles.indicacaodeprofissional_grupo21}>
            <Svg data-layer="871894d7-098d-4db2-a974-27bd9d8b800a" style={styles.indicacaodeprofissional_grupo21_caminho3747addd7} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="8c823de7-8f82-4db5-b04a-7ae68ec19e4b" style={styles.indicacaodeprofissional_retangulo18}></View>
        <Text data-layer="a493c8b4-c289-4650-9ae3-a5dadf25ae60" style={styles.indicacaodeprofissional_indicarprofissional}>Indicar profissional</Text>
        <View data-layer="fa4c30fb-9aa1-446b-b479-88e3ad7c0667" style={styles.indicacaodeprofissional_retangulo23}></View>
        <Text data-layer="a59aa7fa-2805-4c06-a8e1-19bee9ff4ebe" style={styles.indicacaodeprofissional_facaaindicacaodeseumelhorprofissional}>Faça a indicação de seu melhor profissional</Text>
        <Text data-layer="0390e0b6-6c95-4c8a-a284-64d36fc9b9d0" style={styles.indicacaodeprofissional_sevocepossuiaqueleprofissionalqueexecutaassuaspequenasegrandesobrascomperfeicaoseeleesuperatenciososeeleeeducadoseeleepreocupadoemfazerseumelhorseeleepontualnasconclusoesdostrabalhoseporfims}>   Se você possui aquele profissional que executa as suas
pequenas e grandes obras com perfeição.
   Se ele é super atencioso.
   Se ele é educado.
   Se ele é preocupado em fazer seu melhor.
   Se ele é pontual nas conclusões dos trabalhos.
   E por fim se ele cobra um preço justo,

Caso você possua um profissional com as características
informadas a cima e ache que outras pessoas merecem
ter seus sonhos construídos ou melhorados através do
trabalho desse profissional, aperte o botão abaixo para
indica-lo ao nosso aplicativo.</Text>
        <ReactImage data-layer="78df60a1-1fbb-4315-8d10-24d2e0ff3e71" source={require('./assets/qualidadeindicacao.png')} style={styles.indicacaodeprofissional_qualidadeindicacao} />
        <Text data-layer="1b7efbc0-8136-4c98-a0af-b2b36f489637" style={styles.indicacaodeprofissional_dadosdoprofissional}>Dados do Profissional</Text>
        <View data-layer="7b18405e-444b-4394-b2e5-e45162339815" style={styles.indicacaodeprofissional_retangulo28}></View>
        <View data-layer="2326d502-bbf0-41b4-bbb7-306d508da7fe" style={styles.indicacaodeprofissional_grupo23}>
            <Svg data-layer="0cce6daa-63d4-4c93-a8d1-8aabda3172b6" style={styles.indicacaodeprofissional_grupo23_caminho35e79f765} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 31.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 30 L 0 30 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="51793699-cbfc-4f5e-85d5-4a958934e8d4" style={styles.indicacaodeprofissional_nome}>Nome</Text>
        <Svg data-layer="4fefe4b4-6875-42c3-a186-ee8808a99275" style={styles.indicacaodeprofissional_caminho2} preserveAspectRatio="none" viewBox="-0.75 -0.75 334.5 45.5" fill="transparent"><SvgPath d="M 12.2507209777832 0 L 314.749267578125 0 C 321.51513671875 0 327 4.850247859954834 327 10.83333301544189 L 327 24.16666603088379 C 327 30.14975166320801 321.51513671875 35 314.749267578125 35 L 12.2507209777832 35 C 5.484833717346191 35 0 30.14975166320801 0 24.16666603088379 L 0 10.83333301544189 C 0 4.850247859954834 5.484833717346191 0 12.2507209777832 0 Z"  /></Svg>
        <Text data-layer="b8a18688-c1df-471b-990b-7e008164e2be" style={styles.indicacaodeprofissional_email}>email</Text>
        <Svg data-layer="d2c9d368-d37a-45dc-b736-c0583817f552" style={styles.indicacaodeprofissional_caminho8} preserveAspectRatio="none" viewBox="-0.75 -0.75 334.5 45.5" fill="transparent"><SvgPath d="M 12.2507209777832 0 L 314.749267578125 0 C 321.51513671875 0 327 4.850247859954834 327 10.83333301544189 L 327 24.16666603088379 C 327 30.14975166320801 321.51513671875 35 314.749267578125 35 L 12.2507209777832 35 C 5.484833717346191 35 0 30.14975166320801 0 24.16666603088379 L 0 10.83333301544189 C 0 4.850247859954834 5.484833717346191 0 12.2507209777832 0 Z"  /></Svg>
        <Text data-layer="a5f4fd05-8026-4ac4-9b4f-99abb2b9b52e" style={styles.indicacaodeprofissional_telefone}>Telefone</Text>
        <Svg data-layer="f8a67e1f-f1b9-46aa-9695-46c7491abb2f" style={styles.indicacaodeprofissional_caminho9} preserveAspectRatio="none" viewBox="-0.75 -0.75 334.5 45.5" fill="transparent"><SvgPath d="M 12.2507209777832 0 L 314.749267578125 0 C 321.51513671875 0 327 4.850247859954834 327 10.83333301544189 L 327 24.16666603088379 C 327 30.14975166320801 321.51513671875 35 314.749267578125 35 L 12.2507209777832 35 C 5.484833717346191 35 0 30.14975166320801 0 24.16666603088379 L 0 10.83333301544189 C 0 4.850247859954834 5.484833717346191 0 12.2507209777832 0 Z"  /></Svg>
    </ScrollView>
    );
  }
}

Indicacaodeprofissional.propTypes = {

}

Indicacaodeprofissional.defaultProps = {

}


const styles = StyleSheet.create({
  "indicacaodeprofissional": {
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
  "indicacaodeprofissional_grupo7": {
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
  "indicacaodeprofissional_grupo7_caminho6": {
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
  "indicacaodeprofissional_grupo10": {
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
  "indicacaodeprofissional_grupo10_caminho3": {
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
  "indicacaodeprofissional_indicacaodeprofissional959a3474": {
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
    "width": 233,
    "height": 27,
    "left": 66,
    "top": 14
  },
  "indicacaodeprofissional_seta": {
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
  "indicacaodeprofissional_grupo21": {
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
  "indicacaodeprofissional_grupo21_caminho3747addd7": {
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
  "indicacaodeprofissional_retangulo18": {
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
  "indicacaodeprofissional_indicarprofissional": {
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
    "width": 180,
    "height": 27,
    "left": 91,
    "top": 582
  },
  "indicacaodeprofissional_retangulo23": {
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
    "height": 313,
    "left": -1,
    "top": 67
  },
  "indicacaodeprofissional_facaaindicacaodeseumelhorprofissional": {
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
    "width": 263,
    "height": 17,
    "left": 78,
    "top": 91
  },
  "indicacaodeprofissional_sevocepossuiaqueleprofissionalqueexecutaassuaspequenasegrandesobrascomperfeicaoseeleesuperatenciososeeleeeducadoseeleepreocupadoemfazerseumelhorseeleepontualnasconclusoesdostrabalhoseporfims": {
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
    "width": 323,
    "height": 221,
    "left": 18,
    "top": 131
  },
  "indicacaodeprofissional_qualidadeindicacao": {
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
    "width": 31,
    "height": 42,
    "left": 24,
    "top": 82
  },
  "indicacaodeprofissional_dadosdoprofissional": {
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
    "width": 144,
    "height": 20,
    "left": 18,
    "top": 418
  },
  "indicacaodeprofissional_retangulo28": {
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
    "height": 127,
    "left": -1,
    "top": 441
  },
  "indicacaodeprofissional_grupo23": {
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
    "height": 30,
    "left": 0,
    "top": 379
  },
  "indicacaodeprofissional_grupo23_caminho35e79f765": {
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
    "height": 30,
    "left": 0,
    "top": 0
  },
  "indicacaodeprofissional_nome": {
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
    "width": 35,
    "height": 17,
    "left": 27,
    "top": 455
  },
  "indicacaodeprofissional_caminho2": {
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
    "shadowColor": "rgb(0,  0,  0)",
    "shadowOpacity": 0.1607843137254902,
    "shadowOffset": {
      "width": 0,
      "height": 3
    },
    "shadowRadius": 6,
    "width": 333,
    "height": 44,
    "left": 17,
    "top": 446
  },
  "indicacaodeprofissional_email": {
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
    "width": 31,
    "height": 17,
    "left": 27,
    "top": 495
  },
  "indicacaodeprofissional_caminho8": {
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
    "shadowColor": "rgb(0,  0,  0)",
    "shadowOpacity": 0.1607843137254902,
    "shadowOffset": {
      "width": 0,
      "height": 3
    },
    "shadowRadius": 6,
    "width": 333,
    "height": 44,
    "left": 17,
    "top": 486
  },
  "indicacaodeprofissional_telefone": {
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
    "width": 48,
    "height": 17,
    "left": 27,
    "top": 535
  },
  "indicacaodeprofissional_caminho9": {
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
    "shadowColor": "rgb(0,  0,  0)",
    "shadowOpacity": 0.1607843137254902,
    "shadowOffset": {
      "width": 0,
      "height": 3
    },
    "shadowRadius": 6,
    "width": 333,
    "height": 44,
    "left": 17,
    "top": 526
  }
});