import React, {Component} from 'react';
import PropTypes from "prop-types";
import {StyleSheet, Text, View, TextInput, FlatList, Picker, ScrollView, TouchableHighlight} from 'react-native';
import {Image as ReactImage} from 'react-native';
import Svg, {Defs, Pattern} from 'react-native-svg';
import {Path as SvgPath} from 'react-native-svg';
import {Text as SvgText} from 'react-native-svg';
import {Image as SvgImage} from 'react-native-svg';

export default class Inicio extends Component {

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
    <ScrollView data-layer="1d9f0157-3a12-4261-8783-753f64fb1662" style={styles.inicio}>
        <ReactImage data-layer="d73093c0-2fc5-4c67-bca9-2683fbf73758" source={require('./assets/botao-material-de-construcao.png')} style={styles.inicio_botaomaterialdeconstrucao} />
        <ReactImage data-layer="15051b7f-d8eb-4bdf-bcca-b7f02bdc841e" source={require('./assets/botao-profissional.png')} style={styles.inicio_botaoprofissional} />
        <Text data-layer="b10384ac-baa6-44d6-98bf-1f40b087b9d5" style={styles.inicio_comprarmaterial}>Comprar material</Text>
        <Text data-layer="6f1c0c0c-436b-42f6-a801-10eb250eda41" style={styles.inicio_solicitarprofissional}>Solicitar profissional</Text>
        <Text data-layer="3661f6a4-d116-46b1-a9f6-8e3b958fbda7" style={styles.inicio_calcularmaterial}>Calcular material</Text>
        <View data-layer="99210104-34c6-424e-a949-d067327ead02" style={styles.inicio_retangulo3}></View>
        <Svg data-layer="55b3873e-6be0-4d17-9edb-71cc9ee81244" style={styles.inicio_caminho2} preserveAspectRatio="none" viewBox="-0.75 -0.75 334.5 52.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 12.2507209777832 0 L 314.749267578125 0 C 321.51513671875 0 327 5.820297718048096 327 13 L 327 29 C 327 36.17970275878906 321.51513671875 42 314.749267578125 42 L 12.2507209777832 42 C 5.484833717346191 42 0 36.17970275878906 0 29 L 0 13 C 0 5.820297718048096 5.484833717346191 0 12.2507209777832 0 Z"  /></Svg>
        <Text data-layer="1ae25fb6-7647-4383-92b3-401289b7d0f9" style={styles.inicio_buscar}>Buscar</Text>
        <ReactImage data-layer="c1d4186e-2508-4b74-8880-607198578b1f" source={require('./assets/qrcode-amarelo.png')} style={styles.inicio_qrcodeamarelo} />
        <ReactImage data-layer="8bcc1a9a-9d56-4699-b8b5-a3446170a0a8" source={require('./assets/botao-ferramentas-de-calculo2.png')} style={styles.inicio_botaoferramentasdecalculo2} />
        <ReactImage data-layer="0820ff9a-5900-4134-a36b-54c120a43374" source={require('./assets/lupa2.png')} style={styles.inicio_lupa2} />
        <ReactImage data-layer="2d7c5260-9e57-4d32-9506-8d896708b38e" source={require('./assets/easypay.png')} style={styles.inicio_easypay} />
        <View data-layer="b48696a0-db3c-4e1c-8aea-d12c9670fbb2" style={styles.inicio_componente69}>
            <Svg data-layer="c19ce7f8-97b0-490d-a28e-42b12ff5db71" style={styles.inicio_componente69_caminho6} preserveAspectRatio="none" viewBox="-0.75 -0.75 361.7500305175781 55.57647705078125" fill="rgba(253, 253, 253, 1)"><SvgPath d="M 0 0 L 360.0000305175781 0 L 360.0000305175781 53.82649993896484 L 0 53.82649993896484 L 0 0 Z"  /></Svg>
            <View data-layer="a13eca8b-8452-4d6f-8895-db917577ef10" style={styles.inicio_componente69_grupo19}>
                <ReactImage data-layer="d7e7fad0-3e64-4663-947c-bb49e8b5852c" source={require('./assets/capacete.png')} style={styles.inicio_componente69_grupo19_capacete} />
                <Svg data-layer="a65d86a2-e784-4907-a36d-b1d1acfbd1db" style={styles.inicio_componente69_grupo19_caminho1} preserveAspectRatio="none" viewBox="-0.75 -0.75 15.928558349609375 15.9285888671875" fill="rgba(158, 4, 4, 1)"><SvgPath d="M 7.214279174804688 0 C 11.1986141204834 0 14.42855834960938 3.229949712753296 14.42855834960938 7.21429443359375 C 14.42855834960938 11.19863796234131 11.1986141204834 14.4285888671875 7.214279174804688 14.4285888671875 C 3.229943037033081 14.4285888671875 0 11.19863796234131 0 7.21429443359375 C 0 3.229949712753296 3.229943037033081 0 7.214279174804688 0 Z"  /></Svg>
                <Text data-layer="665ac852-d8d9-4ce8-9209-07ec467cc7ec" style={styles.inicio_componente69_grupo19_x2}>2</Text>
            </View>
            <View data-layer="d929d023-e56e-409e-88bf-c8bea60536f2" style={styles.inicio_componente69_grupo49}>
                <ReactImage data-layer="20cc1569-3cf1-4b10-a11a-8538dbfbb05e" source={require('./assets/elipse-1.png')} style={styles.inicio_componente69_grupo49_elipse1} />
            </View>
            <Text data-layer="7ca4bdc7-8742-4b19-be48-467bb6108a88" style={styles.inicio_componente69_ruasaoclemente126}>Rua São Clemente 126</Text>
        </View>
        <ReactImage data-layer="56acaf24-9a34-4ab2-8a09-6b6da25b2648" source={require('./assets/decoracao-quarto-bebe.png')} style={styles.inicio_decoracaoquartobebe} />
        <Svg data-layer="67907da5-de80-4134-ab52-cef0d81d457a" style={styles.inicio_elipse2} preserveAspectRatio="none" viewBox="-0.75 -0.75 8.5 8.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 3.5 0 C 5.432996273040771 0 7 1.567003607749939 7 3.5 C 7 5.432996273040771 5.432996273040771 7 3.5 7 C 1.567003607749939 7 0 5.432996273040771 0 3.5 C 0 1.567003607749939 1.567003607749939 0 3.5 0 Z"  /></Svg>
        <Svg data-layer="5a618f0f-c6b0-45b6-9f2b-8d18dea8903c" style={styles.inicio_elipse3} preserveAspectRatio="none" viewBox="-0.75 -0.75 8.5 8.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 3.5 0 C 5.432996273040771 0 7 1.567003607749939 7 3.5 C 7 5.432996273040771 5.432996273040771 7 3.5 7 C 1.567003607749939 7 0 5.432996273040771 0 3.5 C 0 1.567003607749939 1.567003607749939 0 3.5 0 Z"  /></Svg>
        <Svg data-layer="9a4a7497-b600-49b6-83a5-6f9ceaff2d18" style={styles.inicio_elipse4} preserveAspectRatio="none" viewBox="-0.75 -0.75 8.5 8.5" fill="rgba(146, 143, 143, 1)"><SvgPath d="M 3.5 0 C 5.432996273040771 0 7 1.567003607749939 7 3.5 C 7 5.432996273040771 5.432996273040771 7 3.5 7 C 1.567003607749939 7 0 5.432996273040771 0 3.5 C 0 1.567003607749939 1.567003607749939 0 3.5 0 Z"  /></Svg>
        <Svg data-layer="7ca520ab-858b-4db6-9216-5b66964edee3" style={styles.inicio_elipse5} preserveAspectRatio="none" viewBox="-0.75 -0.75 8.5 8.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 3.5 0 C 5.432996273040771 0 7 1.567003607749939 7 3.5 C 7 5.432996273040771 5.432996273040771 7 3.5 7 C 1.567003607749939 7 0 5.432996273040771 0 3.5 C 0 1.567003607749939 1.567003607749939 0 3.5 0 Z"  /></Svg>
        <Svg data-layer="e9bdf079-ccbb-463f-a96d-cd9382e769ec" style={styles.inicio_elipse6} preserveAspectRatio="none" viewBox="-0.75 -0.75 8.5 8.5" fill="rgba(255, 255, 255, 1)"><SvgPath d="M 3.5 0 C 5.432996273040771 0 7 1.567003607749939 7 3.5 C 7 5.432996273040771 5.432996273040771 7 3.5 7 C 1.567003607749939 7 0 5.432996273040771 0 3.5 C 0 1.567003607749939 1.567003607749939 0 3.5 0 Z"  /></Svg>
        <ReactImage data-layer="1dba10ff-94b9-4eb1-ad4a-4c08cef93d53" source={require('./assets/sinalmaiorfoto.png')} style={styles.inicio_sinalmaiorfoto} />
        <ReactImage data-layer="43c2e78a-1cb3-4a85-bf85-a9713f891a10" source={require('./assets/sinalmaiorfoto-1279adee.png')} style={styles.inicio_sinalmaiorfoto1} />
        <View data-layer="c03ac353-b103-4944-9299-9d94ac2cc1f5" style={styles.inicio_componente93}>
            <Svg data-layer="d1fb667c-38d9-41eb-913d-4c1c74498e77" style={styles.inicio_componente93_caminho3} preserveAspectRatio="none" viewBox="-0.75 -0.75 363.5 52.0107421875" fill="rgba(223, 226, 227, 1)"><SvgPath d="M 0 0 L 362 0 L 362 50.5107421875 L 0 50.5107421875 L 0 0 Z"  /></Svg>
            <View data-layer="c0b54ae2-c9d1-449e-99db-9ad2fa91cbf5" style={styles.inicio_componente93_grupo31}>
                <Text data-layer="b9e2b7ff-3a3c-44c0-ba6a-16556bde09ed" style={styles.inicio_componente93_grupo31_dicasenovidades}>Dicas e Novidades</Text>
                <ReactImage data-layer="f8adf300-574e-4949-9e41-969c8da0c0f9" source={require('./assets/lampada.png')} style={styles.inicio_componente93_grupo31_lampada} />
            </View>
            <View data-layer="42afa533-ee29-487d-8dad-d126386cd029" style={styles.inicio_componente93_grupo34}>
                <Text data-layer="45f607a7-99cb-4d93-b291-e1fd22bdd1bb" style={styles.inicio_componente93_grupo34_faleconosco}>Fale conosco</Text>
                <ReactImage data-layer="825b4edb-64fe-4611-ac9f-020f99450e68" source={require('./assets/batepapo.png')} style={styles.inicio_componente93_grupo34_batepapo} />
            </View>
            <View data-layer="2aeef77f-db09-4118-a2bc-301a6b1b8f27" style={styles.inicio_componente93_grupo30}>
                <Text data-layer="ec5a40f8-6e27-4569-8074-a7a4074b0073" style={styles.inicio_componente93_grupo30_inicio4e5f9b4d}>Início</Text>
                <ReactImage data-layer="48ecd37d-dbfb-47c4-8fbb-9b16f77f4f95" source={require('./assets/trabalhador2.png')} style={styles.inicio_componente93_grupo30_trabalhador2} />
            </View>
            <View data-layer="4f643053-ba96-4511-9e7c-1c25868b0b52" style={styles.inicio_componente93_grupo41}>
                <Text data-layer="58844ed3-885d-40b0-8564-d58db574d56e" style={styles.inicio_componente93_grupo41_digitalizacao}>Digitalização</Text>
                <ReactImage data-layer="5bfd28bf-d3ae-40d1-a0db-7a4314322dee" source={require('./assets/maquinafotografica.png')} style={styles.inicio_componente93_grupo41_maquinafotografica} />
            </View>
        </View>
    </ScrollView>
    );
  }
}

Inicio.propTypes = {

}

Inicio.defaultProps = {

}


const styles = StyleSheet.create({
  "inicio": {
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
  "inicio_botaomaterialdeconstrucao": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 10,
    "borderTopRightRadius": 10,
    "borderBottomLeftRadius": 10,
    "borderBottomRightRadius": 10,
    "width": 150.5,
    "height": 77.5,
    "left": 20,
    "top": 353
  },
  "inicio_botaoprofissional": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 9,
    "borderTopRightRadius": 9,
    "borderBottomLeftRadius": 9,
    "borderBottomRightRadius": 9,
    "width": 150.5,
    "height": 77.5,
    "left": 191,
    "top": 353
  },
  "inicio_comprarmaterial": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(142, 137, 137, 1)",
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
    "width": 130,
    "height": 20,
    "left": 29,
    "top": 431
  },
  "inicio_solicitarprofissional": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(142, 137, 137, 1)",
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
    "width": 153,
    "height": 20,
    "left": 190,
    "top": 431
  },
  "inicio_calcularmaterial": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(142, 137, 137, 1)",
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
    "width": 125,
    "height": 20,
    "left": 31,
    "top": 542
  },
  "inicio_retangulo3": {
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
    "borderTopColor": "rgba(255, 255, 255, 1)",
    "borderRightWidth": 1,
    "borderRightColor": "rgba(255, 255, 255, 1)",
    "borderBottomWidth": 1,
    "borderBottomColor": "rgba(255, 255, 255, 1)",
    "borderLeftWidth": 1,
    "borderLeftColor": "rgba(255, 255, 255, 1)",
    "borderTopLeftRadius": 9,
    "borderTopRightRadius": 9,
    "borderBottomLeftRadius": 9,
    "borderBottomRightRadius": 9,
    "shadowColor": "rgb(0,  0,  0)",
    "shadowOpacity": 0.1607843137254902,
    "shadowOffset": {
      "width": 0,
      "height": 3
    },
    "shadowRadius": 6,
    "width": 150.5,
    "height": 77.5,
    "left": 190,
    "top": 465
  },
  "inicio_caminho2": {
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
    "height": 51,
    "left": 17,
    "top": 291
  },
  "inicio_buscar": {
    "opacity": 1,
    "position": "absolute",
    "backgroundColor": "rgba(255, 255, 255, 0)",
    "color": "rgba(126, 124, 124, 1)",
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
    "width": 43,
    "height": 20,
    "left": 67,
    "top": 301
  },
  "inicio_qrcodeamarelo": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 43,
    "borderTopRightRadius": 43,
    "borderBottomLeftRadius": 43,
    "borderBottomRightRadius": 43,
    "width": 63,
    "height": 58,
    "left": 235,
    "top": 503
  },
  "inicio_botaoferramentasdecalculo2": {
    "opacity": 1,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 13,
    "borderTopRightRadius": 13,
    "borderBottomLeftRadius": 13,
    "borderBottomRightRadius": 13,
    "width": 150.5,
    "height": 77.5,
    "left": 20,
    "top": 464
  },
  "inicio_lupa2": {
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
    "left": 25,
    "top": 294
  },
  "inicio_easypay": {
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
    "width": 94.5,
    "height": 35.5,
    "left": 218,
    "top": 468
  },
  "inicio_componente69": {
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
  "inicio_componente69_caminho6": {
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
  "inicio_componente69_grupo19": {
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
  "inicio_componente69_grupo19_capacete": {
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
  "inicio_componente69_grupo19_caminho1": {
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
  "inicio_componente69_grupo19_x2": {
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
  "inicio_componente69_grupo49": {
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
  "inicio_componente69_grupo49_elipse1": {
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
  "inicio_componente69_ruasaoclemente126": {
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
  },
  "inicio_decoracaoquartobebe": {
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
    "width": 291,
    "height": 220,
    "left": 35,
    "top": 58
  },
  "inicio_elipse2": {
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
    "width": 7,
    "height": 7,
    "left": 167,
    "top": 271
  },
  "inicio_elipse3": {
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
    "width": 7,
    "height": 7,
    "left": 158,
    "top": 271
  },
  "inicio_elipse4": {
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
    "width": 7,
    "height": 7,
    "left": 149,
    "top": 271
  },
  "inicio_elipse5": {
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
    "width": 7,
    "height": 7,
    "left": 176,
    "top": 271
  },
  "inicio_elipse6": {
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
    "width": 7,
    "height": 7,
    "left": 185,
    "top": 271
  },
  "inicio_sinalmaiorfoto": {
    "opacity": 0.5099999904632568,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 21,
    "height": 57,
    "left": 305,
    "top": 140
  },
  "inicio_sinalmaiorfoto1": {
    "opacity": 0.5099999904632568,
    "position": "absolute",
    "marginTop": 0,
    "marginRight": 0,
    "marginBottom": 0,
    "marginLeft": 0,
    "borderTopLeftRadius": 0,
    "borderTopRightRadius": 0,
    "borderBottomLeftRadius": 0,
    "borderBottomRightRadius": 0,
    "width": 21,
    "height": 57,
    "left": 35,
    "top": 140
  },
  "inicio_componente93": {
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
  "inicio_componente93_caminho3": {
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
  "inicio_componente93_grupo31": {
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
  "inicio_componente93_grupo31_dicasenovidades": {
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
    "width": 94,
    "height": 15,
    "left": 0,
    "top": 28
  },
  "inicio_componente93_grupo31_lampada": {
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
    "width": 29,
    "height": 29,
    "left": 33,
    "top": 0
  },
  "inicio_componente93_grupo34": {
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
  "inicio_componente93_grupo34_faleconosco": {
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
  "inicio_componente93_grupo34_batepapo": {
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
  "inicio_componente93_grupo30": {
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
  "inicio_componente93_grupo30_inicio4e5f9b4d": {
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
    "width": 28,
    "height": 15,
    "left": 2,
    "top": 28
  },
  "inicio_componente93_grupo30_trabalhador2": {
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
    "height": 31.97,
    "left": 0,
    "top": 0
  },
  "inicio_componente93_grupo41": {
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
  "inicio_componente93_grupo41_digitalizacao": {
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
  "inicio_componente93_grupo41_maquinafotografica": {
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
  }
});