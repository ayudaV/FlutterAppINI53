import 'package:flutter/material.dart';
import 'package:pipoca_pet/screens/home.dart';

//Determina que o arquivo, ao ser iniciado, execute a classe Main()
void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pipocolina",
      //home: Home(),
      home: Home(),
      theme: ThemeData(primaryColor: Colors.redAccent),
    );
  }
}
