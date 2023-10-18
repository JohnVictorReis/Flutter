import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Calculadoras de Redes';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CustomTextStyle {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontSize: 24,
    color: Color(0xff000000),
    fontWeight: FontWeight.bold,
  );
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  int _counter = 0;

//Criando controladores para ter acesso aos dados das variávies
  TextEditingController controladorOnda = TextEditingController();
  TextEditingController controladorDistancia = TextEditingController();
  TextEditingController controladorLarguraBandaNyquist =
      TextEditingController();
  TextEditingController controladorLarguraBandaShannon =
      TextEditingController();
  TextEditingController controladorSinalRuido = TextEditingController();
  TextEditingController controladorModulacao = TextEditingController();
  TextEditingController controladorMwToDbm = TextEditingController();
  TextEditingController controladorDbmToMw = TextEditingController();
//EIRP
  TextEditingController controladorPotenciaTransmissao =
      TextEditingController();
  TextEditingController controladorGanhoAntena = TextEditingController();
  TextEditingController controladorPerdasCabo = TextEditingController();

//RSL
  TextEditingController controladorPotenciaTransmissaoRSL =
      TextEditingController();
  TextEditingController controladorGanhoAntenaTx = TextEditingController();
  TextEditingController controladorPerdaCaboTx = TextEditingController();
  TextEditingController controladorFSLP = TextEditingController();
  TextEditingController controladorGanhoAntenaRx = TextEditingController();
  TextEditingController controladorPerdaCaboRx = TextEditingController();

//FSLP
  TextEditingController controladorDistanciaFslp = TextEditingController();
  TextEditingController controladorFrequenciaFslp = TextEditingController();

//Fresnel
  TextEditingController controladorDao = TextEditingController();
  TextEditingController controladorDbo = TextEditingController();
  TextEditingController controladorFrequenciaFresnel = TextEditingController();
  TextEditingController controladorDistanciaFresnel = TextEditingController();

  String resultadoShannon = '';
  String resultadoNyquist = '';
  String conversorParaDbm = '';
  String conversorParaMw = '';
  String resultadoEirp = '';
  String resultadoFslp = '';
  String resultadoRsl = '';
  String resultadoMwdBm = '';
  String resultadoDbmWd = '';
  String resultadoZonaFresnel = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadoras de Redes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*Calculo do Shannon, tem que ser ajustado ainda*/
              /* Const daqui pra baixo*/
              const Text(
                'Calculo de Nyquist',
                style: CustomTextStyle.nameOfTextStyle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorLarguraBandaNyquist,
                decoration: const InputDecoration(
                    labelText: 'Largura de Banda do Sinal',
                    hintText: "Digite o valor para Largura de Banda(Hz)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorModulacao,
                decoration: const InputDecoration(
                    labelText: 'Modulação',
                    hintText: "Digite o valor da Modulação.",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              //Constante que trás o resultado acima do botão e abaixo do último campo.
              const SizedBox(height: 32),
              Text(
                resultadoNyquist,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                // Botão para Calculo das funções
                child: ElevatedButton(
                    // Quando clicado ele calcula e mostra o resultado
                    onPressed: () {
                      setState(() {
                        num teste = 2 *
                            (num.parse(controladorLarguraBandaNyquist.text)) *
                            (num.parse(controladorModulacao.text));
                        resultadoNyquist = teste.toString() + 'bps';
                      });
                    },
                    child: const Text('Calcular Nyquist')),
              ),

              const Text(
                'Calculo de Shannon',
                style: CustomTextStyle.nameOfTextStyle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorLarguraBandaShannon,
                decoration: const InputDecoration(
                    labelText: 'Largura de Banda',
                    hintText: "Digite o valor para Largura de Banda(Hz)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorSinalRuido,
                decoration: const InputDecoration(
                    labelText: 'Sinal Ruído',
                    hintText: "Digite o valor do Sinal Ruído",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              //Constante que trás o resultado acima do botão e abaixo do último campo.
              const SizedBox(height: 32),
              Text(
                resultadoShannon,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                // Botão para Calculo das funções
                child: ElevatedButton(
                    // Quando clicado ele calcula e mostra o resultado
                    onPressed: () {
                      //Ajustar Conta SHANNON
                      setState(() {
                        num shannonFinal =
                            (num.parse(controladorLarguraBandaShannon.text)) *
                                    (num.parse(controladorSinalRuido.text)) +
                                1;
                        resultadoShannon = shannonFinal.toString() + 'bps';
                      });
                    },
                    child: const Text('Calcular Shannon')),
              ),

              const Text(
                'Conversão mW para dBm',
                style: CustomTextStyle.nameOfTextStyle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorMwToDbm,
                decoration: const InputDecoration(
                    labelText: 'Potência mW',
                    hintText: "Digite o valor da potência em Mw",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              //Constante que trás o resultado acima do botão e abaixo do último campo.
              const SizedBox(height: 32),
              Text(
                resultadoMwdBm,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                // Botão para Calculo das funções
                child: ElevatedButton(
                    // Quando clicado ele calcula e mostra o resultado
                    onPressed: () {
                      setState(() {
                        num dBmFinal = 10 *
                            log((num.parse(controladorMwToDbm.text))) /
                            log(10);
                        resultadoMwdBm = dBmFinal.toString() + 'dBm';
                      });
                    },
                    child: const Text('Converter')),
              ),

              const Text(
                'Conversão dBm para mW',
                style: CustomTextStyle.nameOfTextStyle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorDbmToMw,
                decoration: const InputDecoration(
                    labelText: 'Potência dBm',
                    hintText: "Digite o valor da potência em dBm",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              //Constante que trás o resultado acima do botão e abaixo do último campo.
              const SizedBox(height: 32),
              Text(
                resultadoDbmWd,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                // Botão para Calculo das funções
                child: ElevatedButton(
                    // Quando clicado ele calcula e mostra o resultado
                    onPressed: () {
                      setState(() {
                        num finalDbm =
                            (num.parse(controladorDbmToMw.text)) / 10 * 10;
                        resultadoDbmWd = finalDbm.toString() + 'mW';
                      });
                    },
                    child: const Text('Converter')),
              ),

              const Text(
                'Calculo de EIRP',
                style: CustomTextStyle.nameOfTextStyle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorPotenciaTransmissao,
                decoration: const InputDecoration(
                    labelText: 'Potência de Transmissão',
                    hintText: "Digite o valor da Potência de Transmissão",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorGanhoAntena,
                decoration: const InputDecoration(
                    labelText: 'Ganho de Antena',
                    hintText: "Digite o valor do Ganho da Antena.",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorPerdasCabo,
                decoration: const InputDecoration(
                    labelText: 'Perdas no cabo',
                    hintText: "Digite o valor das Perdas no Cabo .",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              //Constante que trás o resultado acima do botão e abaixo do último campo.
              const SizedBox(height: 32),
              Text(
                resultadoEirp,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                // Botão para Calculo das funções
                child: ElevatedButton(
                    // Quando clicado ele calcula e mostra o resultado
                    onPressed: () {
                      setState(() {
                        num finalEirp =
                            (num.parse(controladorPotenciaTransmissao.text)) +
                                (num.parse(controladorGanhoAntena.text)) -
                                (num.parse(controladorPerdasCabo.text));
                        resultadoEirp = finalEirp.toString() + 'dBm';
                      });
                    },
                    child: const Text('Calcular EIRP')),
              ),

              const Text(
                'Calculo RSL',
                style: CustomTextStyle.nameOfTextStyle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorPotenciaTransmissaoRSL,
                decoration: const InputDecoration(
                    labelText: 'Potência de Transmissão',
                    hintText: "Digite o valor da potência de Transmissão",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorGanhoAntenaTx,
                decoration: const InputDecoration(
                    labelText: 'Ganho da Antena Tx',
                    hintText: "Digite o valor do ganho da antena TX.",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorPerdaCaboTx,
                decoration: const InputDecoration(
                    labelText: 'Perda do cabo Tx',
                    hintText: "Digite o valor da perda do cabo TX.",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorFSLP,
                decoration: const InputDecoration(
                    labelText: 'FSLP',
                    hintText: "Digite o valor de FSLP",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorGanhoAntenaRx,
                decoration: const InputDecoration(
                    labelText: 'Ganho da Antena RX',
                    hintText: "Digite o valor do ganho da antena RX",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorPerdaCaboRx,
                decoration: const InputDecoration(
                    labelText: 'Perda do cabo RX',
                    hintText: "Digite o valor da perda do cabo RX",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              //Constante que trás o resultado acima do botão e abaixo do último campo.
              const SizedBox(height: 32),
              Text(
                resultadoRsl,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                // Botão para Calculo das funções
                child: ElevatedButton(
                    // Quando clicado ele calcula e mostra o resultado
                    onPressed: () {
                      setState(() {
                        num finalRSL = (num.parse(
                                controladorPotenciaTransmissaoRSL.text)) +
                            (num.parse(controladorGanhoAntenaTx.text)) -
                            (num.parse(controladorPerdaCaboTx.text)) -
                            (num.parse(controladorFSLP.text)) +
                            (num.parse(controladorGanhoAntenaRx.text)) -
                            (num.parse(controladorPerdaCaboRx.text));
                        resultadoRsl = finalRSL.toString() + 'dBm';
                      });
                    },
                    child: const Text('Calcular RSL')),
              ),

              const Text(
                'Calculo de FSLP',
                style: CustomTextStyle.nameOfTextStyle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorDistanciaFslp,
                decoration: const InputDecoration(
                    labelText: 'Distância',
                    hintText: "Digite o valor para a distância",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorFrequenciaFslp,
                decoration: const InputDecoration(
                    labelText: 'Frequência',
                    hintText: "Digite o valor da Frequência.",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              //Constante que trás o resultado acima do botão e abaixo do último campo.
              const SizedBox(height: 32),
              Text(
                resultadoFslp,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                // Botão para Calculo das funções
                child: ElevatedButton(
                    // Quando clicado ele calcula e mostra o resultado
                    onPressed: () {
                      setState(() {
                        num finalFslp = 32.4 +
                            (20 *
                                log(num.parse(controladorDistanciaFslp.text)) /
                                log(10)) +
                            (20 *
                                log(num.parse(controladorFrequenciaFslp.text)) /
                                log(10));
                        resultadoFslp = finalFslp.toString() + 'dB';
                      });
                    },
                    child: const Text('Calcular FSLP')),
              ),
              const Text(
                'Calculo da Zona de Fresnel',
                style: CustomTextStyle.nameOfTextStyle,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorDao,
                decoration: const InputDecoration(
                    labelText: 'DAO',
                    hintText: "Informe a distância DAO",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorDbo,
                decoration: const InputDecoration(
                    labelText: 'DBO',
                    hintText: "Informe a distância DBO",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorFrequenciaFresnel,
                decoration: const InputDecoration(
                    labelText: 'Frequencia Fresnel',
                    hintText: "Informe a frequencia (MHz)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controladorDistanciaFresnel,
                decoration: const InputDecoration(
                    labelText: 'Distância Fresnel',
                    hintText: "Informe a distância D",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
              ),
              //Constante que trás o resultado acima do botão e abaixo do último campo.
              const SizedBox(height: 32),
              Text(
                resultadoZonaFresnel,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                // Botão para Calculo das funções
                child: ElevatedButton(
                    // Quando clicado ele calcula e mostra o resultado
                    onPressed: () {
                      setState(() {
                        num finalFresnel = 550 *
                            sqrt(((num.parse(controladorDao.text)) *
                                    (num.parse(controladorDbo.text))) /
                                ((num.parse(
                                        controladorFrequenciaFresnel.text)) *
                                    (num.parse(
                                        controladorDistanciaFresnel.text))));
/*                        num finalFresnel = 550 *
                            sqrt((num.parse(controladorDao.text)) *
                                (num.parse(controladorDbo.text)) /
                                (num.parse(controladorFrequenciaFresnel.text)) *
                                (num.parse(controladorDistanciaFresnel.text)));

*/
                        resultadoZonaFresnel = finalFresnel.toString() + 'm';
                      });
                    },
                    child: const Text('Calcular Zona de Fresnel')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
