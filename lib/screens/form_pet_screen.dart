import 'package:flutter/material.dart';
import 'package:pipoca_pet/models/pet_model.dart';
import 'package:pipoca_pet/nav/custom_nav.dart';
import 'package:pipoca_pet/screens/edit_pet.dart';

class PerfilPetScreen extends StatelessWidget {
//Pegar o objeto Pet
  final Pet pet;
  //construtor
  const PerfilPetScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            //empilhar a imagem com o ícone de voltar
            children: <Widget>[
              //Imagem
              Hero(
                  tag: pet.id,
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(pet.imagemUrl),
                            fit: BoxFit.cover)),
                  )),
              //Ícone seta para a esquerda
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white),
              )
            ],
          ),
          //Espaço de altura
          const SizedBox(height: 20),

          //Nome do Pet
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  pet.nome,
                  style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          //Descrição do Pet
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  pet.descricao,
                  style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 16,
                      color: Colors.grey),
                )
              ],
            ),
          ),

          //Cartões Horizontais
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _cartaoInfoPet("Id", pet.id),
                _cartaoInfoPet("Raça", pet.raca),
                _cartaoInfoPet("Idade", pet.idade.toString()),
                _cartaoInfoPet("Tamanho", pet.tamanho)
              ],
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditPet(
                    pet: pet,
                  )));
        },
        child: const Icon(Icons.edit),
        backgroundColor: Colors.redAccent,
      ), //FloatingActionButton
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavBar(
        paginaAberta: 0,
        pet: pet,
      ),
    );
  }

//Métodos para configurar os cartões horizontais
  Widget _cartaoInfoPet(String label, String informacao) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 120,
      decoration: BoxDecoration(
          color: const Color(0xFFF8F2F7),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red),
          ),

          //Espaço entre cada cartão
          const SizedBox(height: 8),
          //Texto de cada cartão
          Text(
            informacao,
            style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
