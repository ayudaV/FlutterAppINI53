import 'package:flutter/material.dart';

class PerfilPetScreen extends StatelessWidget {
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
              Hero(
                  tag: "aad",
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("blba"), fit: BoxFit.cover)),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 40, left: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white),
              )
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Nome do Pet",
                  style: TextStyle(
                      //fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Descrição do Pet",
                  style: TextStyle(
                      //fontFamily: "Montserrat",
                      fontSize: 16,
                      color: Colors.grey),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
