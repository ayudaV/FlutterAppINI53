import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pipoca_pet/models/pet_model.dart';
import 'package:pipoca_pet/screens/form_pet.dart';
import 'package:pipoca_pet/screens/form_pet_screen.dart';
import 'package:pipoca_pet/screens/form_remedio.dart';
import 'package:pipoca_pet/services/pet_services.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  PetService service = PetService();
  List<Pet> pets = [];
  Home({Key? key}) : super(key: key) {
    getAllPetsHome();
  }
  void getAllPetsHome() {
    List<Pet> list = service.getAllPetsService();
    pets = list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[200],
        body: ListView.builder(
            itemCount: pets.length,
            itemBuilder: (context, index) {
              return _petCard(context, index);
            }),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.redAccent,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.pets),
                label: 'Cadastrar',
                backgroundColor: Colors.redAccent,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const FormPet()));
                }),
            SpeedDialChild(
                child: const Icon(Icons.healing),
                label: 'Remédio',
                backgroundColor: Colors.redAccent,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => FormRemedio()));
                }),
          ],
        ));
  }

  Widget _petCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PerfilPetScreen(
                  pet: pets[index],
                )));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
                tag: pets[index].id,
                child: Container(
                  width: double.infinity,
                  height: 250.0,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      image: DecorationImage(
                          image: AssetImage(pets[index].imagemUrl),
                          //fit: ajuste  cover: cobrir
                          fit: BoxFit.cover)),
                ))
          ],
        ),
      ),
    );
  }
}
/*
FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const FormPet()));
        },
        label: const Text("Cadastrar"),
        icon: const Icon(Icons.pets),
        backgroundColor: Colors.redAccent,
      ),*/