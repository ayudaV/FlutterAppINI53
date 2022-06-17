import 'package:flutter/material.dart';
import 'package:pipoca_pet/models/pet_model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //Cor do fundo
      backgroundColor: Colors.white,
      //A ListView permite que role a página, criando vários pets
      body: ListView(
        //Essa ListView receberá um Array de Widgets que serão os filhos
        children: <Widget>[
          //o primeiro Widget será um GestureDetector que permite navergar para outra página
          //Pipoca
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: pets[0].id,
                      child: Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage(pets[0].imagemUrl),
                                  fit: BoxFit.cover))),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(pets[0].nome,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
                      child: Text(
                        pets[0].descricao,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
              )),
          //Rick
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: pets[1].id,
                      child: Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage(pets[1].imagemUrl),
                                  fit: BoxFit.cover))),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(pets[1].nome,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
                      child: Text(
                        pets[1].descricao,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Cadastrar"),
        icon: Icon(Icons.pets),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
