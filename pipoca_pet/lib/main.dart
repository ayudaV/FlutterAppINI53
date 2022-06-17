import 'package:flutter/material.dart';
import 'package:pipoca_pet/screens/home.dart';

//Determina que o arquivo, ao ser iniciado, execute a classe Main()
void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Pipoca Pet',
      //Como é uma classe Stateless, vai criar um novo Home, sem atualizar o estado da aplicação
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
