import 'package:flutter/material.dart';
import 'package:pipoca_pet/models/pet_model.dart';
import 'package:pipoca_pet/screens/home.dart';
import 'package:pipoca_pet/services/pet_services.dart';

class FormPet extends StatefulWidget {
  const FormPet({Key? key}) : super(key: key);

  @override
  _FormPetState createState() => _FormPetState();
}

class _FormPetState extends State<FormPet> {
  String racaPet = "Pastor Alemão";
  //O TextEditingController capturar as informação do formulário
  final _idController = TextEditingController();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _idadeController = TextEditingController();
  final _tamanhoController = TextEditingController();
  final _imagemController = TextEditingController();

//Instanciar a classe PetService
  PetService service = PetService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cadastro do Pet")),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              child: Column(children: <Widget>[
            TextFormField(
                controller: _idController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: "Id")),
            TextFormField(
                controller: _nomeController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: "Nome")),
            TextFormField(
                controller: _descricaoController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: "Descrição")),
            TextFormField(
                controller: _idadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Idade")),
            DropdownButtonFormField<String>(
                decoration:
                    const InputDecoration(labelText: "Selecione a raça"),
                onChanged: (racaSelecionada) {
                  setState(() {
                    racaPet = racaSelecionada.toString();
                  });
                },
                items: <String>[
                  'York Shire',
                  'Pastor Alemão',
                  'Pinscher',
                  'Schnauzer'
                ]
                    .map(
                      (e) => DropdownMenuItem(value: e, child: Text(e)),
                    )
                    .toList()),
            TextFormField(
                controller: _tamanhoController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: "Tamanho")),
            TextFormField(
                controller: _imagemController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: "Imagem")),

            //Programar a função onPressed() do RaisedButton Cadastrar
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Pet newpet = Pet(
                          id: _idController.text,
                          nome: _nomeController.text,
                          descricao: _descricaoController.text,
                          idade: int.parse(_idadeController.text),
                          raca: racaPet,
                          tamanho: _tamanhoController.text,
                          imagemUrl: _imagemController.text);
                      //print(newpet.nome);
                      //Adiconar o novo objeto Pet através do método addPet da classe PetService
                      service.addPet(newpet);
                      //Navegar para a página Home
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    child: const Text("Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ))
          ])),
        )));
  }
}
