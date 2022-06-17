import 'package:pipoca_pet/models/pet_model.dart';

class PetService {
  final List<Pet> _petList = [];

  factory PetService() {
    return _singleton;
  }
  static final PetService _singleton = PetService._internal();

  PetService._internal() {
    _petList.add(Pet(
        id: "1",
        nome: "Pipoca",
        descricao: "Fofura",
        idade: 14,
        raca: "York Shire",
        tamanho: "mini",
        imagemUrl: "assets/images/pipoca.png"));

    _petList.add(Pet(
        id: "2",
        nome: "Rick",
        descricao: "Esperto",
        idade: 10,
        raca: "Pastor Alemão",
        tamanho: "gigante",
        imagemUrl: "assets/images/rick.png"));
  }

  List<Pet> getAllPetsService() {
    return _petList;
  }

  void addPet(Pet pet) {
    _petList.add(Pet(
        id: pet.id,
        nome: pet.nome,
        descricao: pet.descricao,
        idade: pet.idade,
        raca: pet.raca,
        tamanho: pet.tamanho,
        imagemUrl: pet.imagemUrl));
  }

  void updatePet(Pet pet) {
    int index = _petList
        .indexOf(_petList.firstWhere((petList) => petList.id == pet.id));
    _petList[index].nome = pet.nome;
    _petList[index].imagemUrl = pet.imagemUrl;
    _petList[index].descricao = pet.descricao;
    _petList[index].raca = pet.raca;
    _petList[index].idade = pet.idade;
    _petList[index].cor = pet.cor;
    _petList[index].tamanho = pet.tamanho;
  }
}
