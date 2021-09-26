import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  var numero = ['1', '2', '3', '4', '5', '6'];

  var padrao = '0';

  var frase = 'Qual o valor sorteado?';

  void _gerarFrase() {
    // var numeroSorteado = Random().nextInt(numero.length);
    var numeroSorteado = Random().nextInt(numero.length);
    setState(
      () {
        padrao = numero[numeroSorteado];
        frase = "O valor sorteado foi: " + numero[numeroSorteado];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          centerTitle: true,
          title: const Text("SORTEIO DE DADOS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          backgroundColor: Colors.black),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                "Escolha um número de 1 a 6",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Text(frase,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20)),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset('assets/dice/dice_$padrao.png'),
                // child: Image.asset('assets/dice/dice_$padrao.png'),
              ),
            ),
            ElevatedButton(
                onPressed: _gerarFrase,
                child: const Text("JOGAR"),
                style: ElevatedButton.styleFrom(primary: Colors.black)),
          ],
        ),
      ),
    );
  }
}
