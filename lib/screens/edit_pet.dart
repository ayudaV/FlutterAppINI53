import 'package:flutter/material.dart';
import 'package:pipoca_pet/models/pet_model.dart';
import 'package:pipoca_pet/screens/home.dart';
import 'package:pipoca_pet/services/pet_services.dart';

// ignore: must_be_immutable
class EditPet extends StatefulWidget {
  Pet pet;
  PetService service = PetService();
  EditPet({Key? key, required this.pet}) : super(key: key);

  @override
  _EditPetState createState() => _EditPetState();
}

class _EditPetState extends State<EditPet> {
  String racaPet = "";
  //O TextEditingController capturar as informação do formulário
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
        appBar: AppBar(title: const Text("Editar Pet")),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              child: Column(children: <Widget>[
            TextFormField(
                controller: _nomeController,
                keyboardType: TextInputType.text,
                //initialValue: widget.pet.nome,
                decoration: const InputDecoration(labelText: "Nome")),
            TextFormField(
                controller: _descricaoController,
                keyboardType: TextInputType.text,
                //initialValue: widget.pet.descricao,
                decoration: const InputDecoration(labelText: "Descrição")),
            TextFormField(
                controller: _idadeController,
                keyboardType: TextInputType.number,
                //initialValue: widget.pet.idade.toString(),
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
                //initialValue: widget.pet.tamanho,
                decoration: const InputDecoration(labelText: "Tamanho")),
            TextFormField(
                controller: _imagemController,
                keyboardType: TextInputType.text,
                //initialValue: widget.pet.imagemUrl,
                decoration: const InputDecoration(labelText: "Imagem")),

            //Programar a função onPressed() do RaisedButton Cadastrar
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //print(newpet.nome);
                      //Adiconar o novo objeto Pet através do método addPet da classe PetService
                      Pet newpet = Pet(
                          id: widget.pet.id,
                          nome: _nomeController.text,
                          descricao: _descricaoController.text,
                          idade: int.parse(_idadeController.text),
                          raca: racaPet,
                          tamanho: _tamanhoController.text,
                          imagemUrl: _imagemController.text);
                      service.updatePet(newpet);
                      //Navegar para a página Home
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    child: const Text("Atualizar",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ))
          ])),
        )));
  }
}
