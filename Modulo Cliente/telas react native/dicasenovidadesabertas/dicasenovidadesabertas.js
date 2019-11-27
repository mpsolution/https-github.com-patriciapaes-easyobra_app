import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Dicasenovidadesabertas extends Component {

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
    <ScrollView data-layer="bbc68694-de2b-422d-a125-478cc5ca004f" style={styles.dicasenovidadesabertas}>
        <ReactImage data-layer="fb449b2a-89c0-4486-bee0-755c8c56fede" source={require('./assets/imagem4ideianoticia.png')} style={styles.dicasenovidadesabertas_imagem4ideianoticia} />
        <Svg data-layer="5a842235-9d69-4c5b-a055-1819da1e0c39" style={styles.dicasenovidadesabertas_linha5} preserveAspectRatio="none" viewBox="0 -1 361 2" fill="transparent"><SvgPath d="M 0 0 L 361 0"  /></Svg>
        <Svg data-layer="5d61daeb-c6ed-4f8e-950c-68acfeec7b60" style={styles.dicasenovidadesabertas_linha6} preserveAspectRatio="none" viewBox="0 -1 361 2" fill="transparent"><SvgPath d="M 0 0 L 361 0"  /></Svg>
        <Text data-layer="424c00ce-61da-4305-ba87-a4084355d9d7" style={styles.dicasenovidadesabertas_ascozinhasdesenhadasdeacordocomoopenconceptouomesmoqueconceitoabertosaoumatendenciaquecadavezreunemaisadeptospoucoapoucoestamosdescobrindosuasvantagensetudoapontaqueestatendenciachegouparaficar}>As cozinhas desenhadas de acordo com o "Open Concept" ou o  mesmo que, conceito aberto são uma tendência que cada vez reúne mais adeptos. Pouco a pouco estamos descobrindo suas vantagens e tudo aponta que esta tendência chegou para ficar.</Text>
        <Text data-layer="531e8cb4-72ef-4e14-96eb-7bb443c280ce" style={styles.dicasenovidadesabertas_x10ideiasparaterumacozinhaaberta}>10 ideias para ter uma cozinha aberta</Text>
        <Text data-layer="bd848fa0-84da-4e5c-bef6-a6c789c37013" style={styles.dicasenovidadesabertas_leiamais}>Leia mais</Text>
        <View data-layer="a0dd11d0-05e2-4c28-84e3-4cb8a57358b3" style={styles.dicasenovidadesabertas_componente84}>
            <Svg data-layer="bde4b29a-3e99-4f8b-85dc-9f2cf3656c02" style={styles.dicasenovidadesabertas_componente84_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 52.0107421875" fill="rgba(223, 226, 227, 1)"><SvgPath d="M 0 0 L 362 0 L 362 50.5107421875 L 0 50.5107421875 L 0 0 Z"  /></Svg>
            <View data-layer="ae874ba3-65d0-4fb9-a0d7-9f456b73c4a7" style={styles.dicasenovidadesabertas_componente84_grupo31}>
                <Text data-layer="e46b3ea5-c4cd-4d51-a14b-13028c89af4a" style={styles.dicasenovidadesabertas_componente84_grupo31_dicasenovidades}>Dicas e Novidades</Text>
                <ReactImage data-layer="74be9a06-ec33-4de5-aead-4f4822c833b5" source={require('./assets/lampada2.png')} style={styles.dicasenovidadesabertas_componente84_grupo31_lampada2} />
            </View>
            <View data-layer="c901381e-e895-4303-b8e9-06df7879f1a4" style={styles.dicasenovidadesabertas_componente84_grupo41}>
                <Text data-layer="6467453f-495c-4e90-ba1f-080892d28b45" style={styles.dicasenovidadesabertas_componente84_grupo41_digitalizacao}>Digitalização</Text>
                <ReactImage data-layer="89749380-9a18-4dc4-b94b-f5f8debe6fb4" source={require('./assets/maquinafotografica.png')} style={styles.dicasenovidadesabertas_componente84_grupo41_maquinafotografica} />
            </View>
            <View data-layer="eb45b058-8c64-40b9-a790-db0d44d1752d" style={styles.dicasenovidadesabertas_componente84_grupo30}>
                <Text data-layer="b8e375fc-abe2-427a-948f-94d704e9cf30" style={styles.dicasenovidadesabertas_componente84_grupo30_inicio}>Início</Text>
                <ReactImage data-layer="88eb1bed-d7ca-4db1-951d-7579be64ee2e" source={require('./assets/trabalhador.png')} style={styles.dicasenovidadesabertas_componente84_grupo30_trabalhador} />
            </View>
            <View data-layer="6cb260c0-91a1-4772-92bd-9f93743e68f4" style={styles.dicasenovidadesabertas_componente84_grupo34}>
                <Text data-layer="271796a3-eb1e-4287-95fb-74180adc9cc5" style={styles.dicasenovidadesabertas_componente84_grupo34_faleconosco}>Fale conosco</Text>
                <ReactImage data-layer="63759e72-fe16-4566-82df-0cde5eb0fd56" source={require('./assets/batepapo.png')} style={styles.dicasenovidadesabertas_componente84_grupo34_batepapo} />
            </View>
        </View>
        <View data-layer="771b3ded-a383-4950-b5e6-384852ac17ed" style={styles.dicasenovidadesabertas_componente611}>
            <Svg data-layer="c3c305be-3f2c-4e53-9b7e-ae864ee39c38" style={styles.dicasenovidadesabertas_componente611_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.75 55.5765380859375" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
            <View data-layer="84a01245-e177-4f1f-9e0f-66afc0386683" style={styles.dicasenovidadesabertas_componente611_grupo19}>
                <ReactImage data-layer="e37924d0-a30f-4a64-a66e-f76a5d848534" source={require('./assets/capacete.png')} style={styles.dicasenovidadesabertas_componente611_grupo19_capacete} />
                <Svg data-layer="338e68a7-454e-4a97-9724-f464e82a6835" style={styles.dicasenovidadesabertas_componente611_grupo19_caminho1} preserveAspectRatio="none" viewBox="-0.75 -0.75 15.92852783203125 15.9285888671875" fill="rgba(158, 4, 4, 1)"><SvgPath d="M 7.214279174804688 0 C 11.1986141204834 0 14.42855834960938 3.229949712753296 14.42855834960938 7.21429443359375 C 14.42855834960938 11.19863796234131 11.1986141204834 14.4285888671875 7.214279174804688 14.4285888671875 C 3.229943037033081 14.4285888671875 0 11.19863796234131 0 7.21429443359375 C 0 3.229949712753296 3.229943037033081 0 7.214279174804688 0 Z"  /></Svg>
                <Text data-layer="95a00a9c-e90f-4447-bb3a-d43c86ee2b6e" style={styles.dicasenovidadesabertas_componente611_grupo19_x2}>2</Text>
            </View>
            <View data-layer="78a4e1a5-e040-4f99-9cfa-e3610282969e" style={styles.dicasenovidadesabertas_componente611_grupo49}>
                <ReactImage data-layer="bec0e08d-c0a8-4b3d-a0ad-e553a1abb88d" source={require('./assets/elipse-1.png')} style={styles.dicasenovidadesabertas_componente611_grupo49_elipse1} />
            </View>
            <Text data-layer="54fadfbc-de3f-4fde-a425-83370c5a4748" style={styles.dicasenovidadesabertas_componente611_ruasaoclemente126}>Rua São Clemente 126</Text>
        </View>
    </ScrollView>
    );
  }
}

Dicasenovidadesabertas.propTypes = {

}

Dicasenovidadesabertas.defaultProps = {

}


const styles = StyleSheet.create({
  "dicasenovidadesabertas": {
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
  "dicasenovidadesabertas_imagem4ideianoticia": {
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
    "width": 360,
    "height": 304,
    "left": 0,
    "top": 21
  },
  "dicasenovidadesabertas_linha5": {
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
    "width": 361,
    "height": 2,
    "left": 0,
    "top": 313.5
  },
  "dicasenovidadesabertas_linha6": {
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
    "width": 361,
    "height": 2,
    "left": 0,
    "top": 56
  },
  "dicasenovidadesabertas_ascozinhasdesenhadasdeacordocomoopenconceptouomesmoqueconceitoabertosaoumatendenciaquecadavezreunemaisadeptospoucoapoucoestamosdescobrindosuasvantagensetudoapontaqueestatendenciachegouparaficar": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 18,
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
    "width": 329,
    "height": 179,
    "left": 16,
    "top": 370
  },
  "dicasenovidadesabertas_x10ideiasparaterumacozinhaaberta": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(0, 0, 0, 1)",
    "fontSize": 19,
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
    "width": 335,
    "height": 26,
    "left": 13,
    "top": 323
  },
  "dicasenovidadesabertas_leiamais": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(255, 111, 0, 1)",
    "fontSize": 18,
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
    "width": 73,
    "height": 24,
    "left": 15,
    "top": 547
  },
  "dicasenovidadesabertas_componente84": {
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
  "dicasenovidadesabertas_componente84_caminho3": {
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
  "dicasenovidadesabertas_componente84_grupo31": {
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
  "dicasenovidadesabertas_componente84_grupo31_dicasenovidades": {
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
    "width": 94,
    "height": 15,
    "left": 0,
    "top": 28
  },
  "dicasenovidadesabertas_componente84_grupo31_lampada2": {
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
    "width": 29,
    "height": 29,
    "left": 33,
    "top": 0
  },
  "dicasenovidadesabertas_componente84_grupo41": {
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
  "dicasenovidadesabertas_componente84_grupo41_digitalizacao": {
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
  "dicasenovidadesabertas_componente84_grupo41_maquinafotografica": {
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
  "dicasenovidadesabertas_componente84_grupo30": {
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
  "dicasenovidadesabertas_componente84_grupo30_inicio": {
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
  "dicasenovidadesabertas_componente84_grupo30_trabalhador": {
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
  },
  "dicasenovidadesabertas_componente84_grupo34": {
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
  "dicasenovidadesabertas_componente84_grupo34_faleconosco": {
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
    "width": 66,
    "height": 15,
    "left": 0,
    "top": 26
  },
  "dicasenovidadesabertas_componente84_grupo34_batepapo": {
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
    "width": 28,
    "height": 28,
    "left": 19,
    "top": 0
  },
  "dicasenovidadesabertas_componente611": {
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
  "dicasenovidadesabertas_componente611_caminho6": {
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
  "dicasenovidadesabertas_componente611_grupo19": {
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
  "dicasenovidadesabertas_componente611_grupo19_capacete": {
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
  "dicasenovidadesabertas_componente611_grupo19_caminho1": {
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
  "dicasenovidadesabertas_componente611_grupo19_x2": {
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
  "dicasenovidadesabertas_componente611_grupo49": {
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
  "dicasenovidadesabertas_componente611_grupo49_elipse1": {
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
  "dicasenovidadesabertas_componente611_ruasaoclemente126": {
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
  }
});