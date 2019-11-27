import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Verorcamentos extends Component {

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
    <ScrollView data-layer="1d3bbc5c-d80b-45f6-9f44-c65a79ac157c" style={styles.verorcamentos}>
        <View data-layer="e5ce4048-2369-463d-9b5c-4fdaa71c9b7f" style={styles.verorcamentos_retangulo83}></View>
        <View data-layer="886ed217-cfa2-4dc3-b36d-f20b429af6e0" style={styles.verorcamentos_retangulo82}></View>
        <View data-layer="9e1c9d18-92fd-4842-be6c-75bdb92eed75" style={styles.verorcamentos_retangulo81}></View>
        <View data-layer="d2011996-cca0-4c50-9772-ec266264412e" style={styles.verorcamentos_grupo7}>
            <Svg data-layer="94bba64f-0b7f-448c-a367-ff03509b3dcb" style={styles.verorcamentos_grupo7_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 55.57647705078125" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
        </View>
        <View data-layer="b71fdcee-088a-4fd2-ba01-13005a827899" style={styles.verorcamentos_grupo10}>
            <Svg data-layer="445dfd77-f7fd-40da-8a83-cc15ad5ae5fc" style={styles.verorcamentos_grupo10_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Text data-layer="f0c5295f-15b1-4e1e-898f-b9ba3fe13258" style={styles.verorcamentos_meusorcamentos}>Meus orçamentos</Text>
        <ReactImage data-layer="f20786fe-47be-40f5-a455-4d0694e54107" source={require('./assets/seta.png')} style={styles.verorcamentos_seta} />
        <View data-layer="1ad56970-a5b0-4116-9e7e-020937afb313" style={styles.verorcamentos_grupo21}>
            <Svg data-layer="9b1490a5-693a-41ae-83a8-ce82dc63b126" style={styles.verorcamentos_grupo21_caminho368e9ce22} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.5 16.5" fill="rgba(190, 196, 198, 0.47058823529411764)"><SvgPath d="M 0 0 L 360 0 L 360 15 L 0 15 L 0 0 Z"  /></Svg>
        </View>
        <Svg data-layer="1def4505-1859-44a3-853b-f1702babeead" style={styles.verorcamentos_linha10} preserveAspectRatio="none" viewBox="-0.5 -0.00433349609375 2 115.0086669921875" fill="transparent"><SvgPath d="M 0 0 L 1 115"  /></Svg>
        <View data-layer="e9bbef36-cf55-4753-be0d-8f97122dc242" style={styles.verorcamentos_retangulo58}></View>
        <Text data-layer="0adf51a2-44dd-40fc-b6f2-4eebdc22ac61" style={styles.verorcamentos_x26112019}>26/11/2019</Text>
        <Text data-layer="0a0444f8-cb61-41d6-ad7c-1f6b3da5a29f" style={styles.verorcamentos_alfredocampos}>Alfredo Campos</Text>
        <Text data-layer="54879443-c389-4b59-8d16-9dd19a1af9dd" style={styles.verorcamentos_x261120191}>26/11/2019</Text>
        <View data-layer="a768eff0-a8d6-402a-a0d7-703d68d01c7e" style={styles.verorcamentos_retangulo59}></View>
        <Text data-layer="444a6115-0aa8-4e64-95bc-7f41b1667b2e" style={styles.verorcamentos_josepedro}>José Pedro</Text>
        <Svg data-layer="d4d8859a-a943-45c6-85b4-8315038fcc23" style={styles.verorcamentos_linha11} preserveAspectRatio="none" viewBox="-0.5 0 1 115" fill="transparent"><SvgPath d="M 0 0 L 0 115"  /></Svg>
        <Text data-layer="d33d15bb-0838-483c-bc5d-e16f4e92365e" style={styles.verorcamentos_r}>R$970,00</Text>
        <Text data-layer="318fbabe-ee4f-452a-9446-8c505688f217" style={styles.verorcamentos_r1}>R$990,00</Text>
        <View data-layer="2339cbc6-220a-48be-8fe0-89b6b5805923" style={styles.verorcamentos_retangulo60}></View>
        <Text data-layer="aa499baa-9527-42e2-b449-76732e4b05d3" style={styles.verorcamentos_x261120192}>26/11/2019</Text>
        <Text data-layer="0d139143-7777-4f97-a784-e2d79d46709d" style={styles.verorcamentos_luizcarlos}>Luiz Carlos</Text>
        <Text data-layer="4c6d36d6-d752-443a-95e5-5cd1167495b5" style={styles.verorcamentos_r2}>R$995,90</Text>
        <View data-layer="c0ac2f8f-5b80-4c28-958f-57c818cb1523" style={styles.verorcamentos_retangulo61}></View>
        <Text data-layer="fb4a53d0-7dfc-4814-a765-703519ca0d97" style={styles.verorcamentos_x261120193}>26/11/2019</Text>
        <Text data-layer="7df8918d-364b-4f91-8331-16e970e6df7d" style={styles.verorcamentos_cleberluis}>Cleber Luis</Text>
        <Text data-layer="c16691fa-163b-447f-8e0a-b99d352d418b" style={styles.verorcamentos_r3}>R$999,99</Text>
        <View data-layer="a1648e36-c08e-49d7-9825-1894c19b110e" style={styles.verorcamentos_retangulo62}></View>
        <Text data-layer="bb00c45f-f721-456a-97ae-d941c2fcaeaf" style={styles.verorcamentos_x261120194}>26/11/2019</Text>
        <Text data-layer="66d80763-9b67-4c47-9236-09264b09b013" style={styles.verorcamentos_paulocesar}>Paulo Cesar</Text>
        <Text data-layer="7f0d30d2-27c1-4a50-8af4-c01ccac76ed8" style={styles.verorcamentos_r4}>R$1.005,00</Text>
        <View data-layer="f4ce784f-a1e2-4ba2-aad6-4a80b182861b" style={styles.verorcamentos_retangulo71}></View>
        <View data-layer="9d9731c1-f904-44dc-b636-8102d307bdbc" style={styles.verorcamentos_retangulo34}></View>
        <Text data-layer="c199b64a-ff34-4ce4-b913-782e372f2e4e" style={styles.verorcamentos_aceitar}>Aceitar</Text>
        <Text data-layer="fa29e95e-c3f9-4a97-a4b0-a23f7c83bd89" style={styles.verorcamentos_portifoliodoprofissional}>Portifólio do profissional</Text>
        <Text data-layer="830f02e7-4f97-4173-852a-cbe4d6d8bcf0" style={styles.verorcamentos_alfredocamposgostodoquefacoefacoomelhorparaosclientesmoronoriodejaneirobaixadafluminense35meses498profissionalnivelgoldcuriosidadetocoguitarranamaioriadasveze}>Alfredo Campos
         Gosto do que faço e faço o melhor para os clientes.
         Moro no Rio de Janeiro, Baixada Fluminense.

          3.5 meses    4.98                    Profissional nível GOLD     

Curiosidade
    Toco guitarra na maioria das vezes como hobby.

Outras experiências
    Estou estudando Designer de Interiores.

Elogios (12)
    Últimos 5
        "Excelente pintor, com ótimas ideias e muito educado"
            2 semanas atrás
        "Excelente profissional e com ótimo papo
            3 semas atrás
        "Muito tranquilo, organizado e deixa tudo limpo"
            1 mês atrás
        "O melhor pintor que já trabalhou na minha casa"
            40 dias atrás
        "Profissional nota 1000. Recomento a todos"
            45 dias atrás

</Text>
        <ReactImage data-layer="d4a38433-e081-49bd-b834-898ead3ad8f8" source={require('./assets/estrela.png')} style={styles.verorcamentos_estrela} />
        <ReactImage data-layer="ef162069-33d6-4538-8a17-d83f83a41e3b" source={require('./assets/medalha-de-ouro.png')} style={styles.verorcamentos_medalhadeouro} />
        <ReactImage data-layer="b9e8334f-9a01-43ba-a5d5-146da4ada798" source={require('./assets/moradia.png')} style={styles.verorcamentos_moradia} />
        <ReactImage data-layer="58394880-f083-40f7-af1a-a19dbfdbb0f1" source={require('./assets/maoaberta.png')} style={styles.verorcamentos_maoaberta} />
    </ScrollView>
    );
  }
}

Verorcamentos.propTypes = {

}

Verorcamentos.defaultProps = {

}


const styles = StyleSheet.create({
  "verorcamentos": {
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
  "verorcamentos_retangulo83": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(238, 103, 24, 1)",
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
    "width": 311,
    "height": 188,
    "left": 25,
    "top": 397
  },
  "verorcamentos_retangulo82": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(111, 112, 164, 1)",
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
    "width": 311,
    "height": 45,
    "left": 25,
    "top": 352
  },
  "verorcamentos_retangulo81": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(55, 238, 116, 1)",
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
    "width": 311,
    "height": 45,
    "left": 25,
    "top": 307
  },
  "verorcamentos_grupo7": {
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
  "verorcamentos_grupo7_caminho6": {
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
  "verorcamentos_grupo10": {
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
  "verorcamentos_grupo10_caminho3": {
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
  "verorcamentos_meusorcamentos": {
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
    "width": 167,
    "height": 27,
    "left": 97,
    "top": 14
  },
  "verorcamentos_seta": {
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
  "verorcamentos_grupo21": {
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
  "verorcamentos_grupo21_caminho368e9ce22": {
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
  "verorcamentos_linha10": {
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
    "width": 2,
    "height": 115.01,
    "left": 117,
    "top": 79.5
  },
  "verorcamentos_retangulo58": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(188, 188, 251, 0.34901960784313724)",
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
    "width": 250,
    "height": 24,
    "left": 55,
    "top": 79
  },
  "verorcamentos_x26112019": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "left": 59,
    "top": 83
  },
  "verorcamentos_alfredocampos": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 76,
    "height": 14,
    "left": 121,
    "top": 83
  },
  "verorcamentos_x261120191": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "left": 59,
    "top": 106
  },
  "verorcamentos_retangulo59": {
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
    "width": 250,
    "height": 24,
    "left": 55,
    "top": 102
  },
  "verorcamentos_josepedro": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 51,
    "height": 14,
    "left": 121,
    "top": 106
  },
  "verorcamentos_linha11": {
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
    "height": 115,
    "left": 236,
    "top": 79.5
  },
  "verorcamentos_r": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 44,
    "height": 14,
    "left": 243,
    "top": 83
  },
  "verorcamentos_r1": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 44,
    "height": 14,
    "left": 243,
    "top": 106
  },
  "verorcamentos_retangulo60": {
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
    "width": 250,
    "height": 24,
    "left": 55,
    "top": 125
  },
  "verorcamentos_x261120192": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "left": 59,
    "top": 129
  },
  "verorcamentos_luizcarlos": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 51,
    "height": 14,
    "left": 121,
    "top": 129
  },
  "verorcamentos_r2": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 44,
    "height": 14,
    "left": 243,
    "top": 129
  },
  "verorcamentos_retangulo61": {
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
    "width": 250,
    "height": 24,
    "left": 55,
    "top": 148
  },
  "verorcamentos_x261120193": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "left": 59,
    "top": 152
  },
  "verorcamentos_cleberluis": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 51,
    "height": 14,
    "left": 121,
    "top": 152
  },
  "verorcamentos_r3": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 44,
    "height": 14,
    "left": 243,
    "top": 152
  },
  "verorcamentos_retangulo62": {
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
    "width": 250,
    "height": 24,
    "left": 55,
    "top": 171
  },
  "verorcamentos_x261120194": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "left": 59,
    "top": 175
  },
  "verorcamentos_paulocesar": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 54,
    "height": 14,
    "left": 121,
    "top": 175
  },
  "verorcamentos_r4": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(3, 3, 3, 0.4)",
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
    "width": 52,
    "height": 14,
    "left": 243,
    "top": 175
  },
  "verorcamentos_retangulo71": {
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
    "width": 312,
    "height": 354,
    "left": 24,
    "top": 231
  },
  "verorcamentos_retangulo34": {
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
    "width": 312,
    "height": 24,
    "left": 24,
    "top": 592
  },
  "verorcamentos_aceitar": {
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
    "width": 50,
    "height": 20,
    "left": 155,
    "top": 594
  },
  "verorcamentos_portifoliodoprofissional": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 18,
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
    "width": 211,
    "height": 24,
    "left": 70,
    "top": 203
  },
  "verorcamentos_alfredocamposgostodoquefacoefacoomelhorparaosclientesmoronoriodejaneirobaixadafluminense35meses498profissionalnivelgoldcuriosidadetocoguitarranamaioriadasveze": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 11,
    "fontWeight": "300",
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
    "width": 306,
    "height": 354,
    "left": 30,
    "top": 231
  },
  "verorcamentos_estrela": {
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
    "width": 11,
    "height": 11.21,
    "left": 148,
    "top": 283
  },
  "verorcamentos_medalhadeouro": {
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
    "height": 20.11,
    "left": 185,
    "top": 279
  },
  "verorcamentos_moradia": {
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
    "width": 8,
    "height": 8.04,
    "left": 45,
    "top": 265
  },
  "verorcamentos_maoaberta": {
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
    "width": 8,
    "height": 8,
    "left": 45,
    "top": 250
  }
});