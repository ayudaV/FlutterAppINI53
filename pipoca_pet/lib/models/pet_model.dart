class Pet {
  String nome;
  String imagemUrl;
  String descricao;
  String raca;
  int idade;
  String cor;
  String id;
//Construtor
  Pet(
      {this.nome = "",
      this.imagemUrl = "",
      this.descricao = "",
      this.raca = "",
      this.idade = 0,
      this.cor = "",
      this.id = ""});
}

//Criar uma lista somente para determinar alguns pets
var pets = [
  Pet(
      nome: "Pipoca",
      imagemUrl: 'assets/images/pipoca.png',
      descricao: "Fofura",
      raca: "York Shire",
      idade: 5,
      cor: "caramelo",
      id: "1"),
  Pet(
      nome: "Rick",
      imagemUrl: 'assets/images/rick.png',
      descricao: "Esperto",
      raca: "Pastor Alemão",
      idade: 2,
      cor: "preto e caramelo",
      id: "1")
];
