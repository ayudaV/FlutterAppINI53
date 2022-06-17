import 'package:flutter/material.dart';

class FormPet extends StatefulWidget {
  @override
  _FormPetState createState() => _FormPetState();
}

class _FormPetState extends State<FormPet> {
  String racaPet = 'Pastor Alemão';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro do Pet'),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: "Nome"),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: "Descrição"),
                    ),
                    DropdownButtonFormField<String>(
                        value: racaPet,
                        onChanged: (racaSelecionada) {
                          setState(() {
                            racaPet = racaSelecionada.toString();
                            print(racaPet);
                          });
                        },
                        items: <String>[
                          'Pastor Alemão',
                          'Yorks Shire',
                          'Pinscher'
                        ].map((e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList()),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                          height: 40,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.redAccent,
                            child: Text("Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          )),
                    )
                  ],
                ),
              ))),
    );
  }
}
