import 'package:flutter/material.dart';
import 'package:pipoca_pet/models/remedio_model.dart';
import 'package:pipoca_pet/screens/home.dart';
import 'package:pipoca_pet/services/remedio_services.dart';

// ignore: must_be_immutable
class FormRemedio extends StatelessWidget {
  final _idController = TextEditingController();
  final _nomeController = TextEditingController();
  final _dataController = TextEditingController();
  RemedioService service = RemedioService();

  FormRemedio({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de remédio"),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                child: Column(
                  //tamanho máximo possível dentro do Form
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: _idController,
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(labelText: "Id do remédio"),
                    ),
                    TextFormField(
                      controller: _nomeController,
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(labelText: "Nome do remédio"),
                    ),
                    TextFormField(
                      controller: _dataController,
                      keyboardType: TextInputType.datetime,
                      decoration:
                          const InputDecoration(labelText: "Data do remédio"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Remedio newRemedio = Remedio(
                                  id: _idController.text,
                                  nome: _nomeController.text,
                                  data: _dataController.text);
                              //print(newpet.nome);
                              //Adiconar o novo objeto Pet através do método addPet da classe PetService
                              service.addRemedio(newRemedio);
                              //Navegar para a página Home
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent),
                            child: const Text("Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
