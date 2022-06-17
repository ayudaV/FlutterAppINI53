import 'package:flutter/material.dart';
import 'package:pipoca_pet/models/pet_model.dart';
import 'package:pipoca_pet/screens/form_pet_screen.dart';
import 'package:pipoca_pet/screens/remedio_screen.dart';

// ignore: must_be_immutable
class CustomNavBar extends StatefulWidget {
  //int paginaAberta = 0;
  int paginaAberta;

  final Pet pet;

  CustomNavBar({Key? key, required this.paginaAberta, required this.pet})
      : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Primeira linha
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Ícone Perfil
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    if (widget.paginaAberta != 0) {
                      setState(() {
                        widget.paginaAberta = 0;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              PerfilPetScreen(pet: widget.pet)));
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.pets,
                          color: widget.paginaAberta == 0
                              ? Colors.redAccent
                              : Colors.grey),
                      Text(
                        "Perfil",
                        style: TextStyle(
                            color: widget.paginaAberta == 0
                                ? Colors.redAccent
                                : Colors.grey),
                      )
                    ],
                  ),
                ),
                //Ícone Remédio
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    if (widget.paginaAberta != 1) {
                      setState(() {
                        widget.paginaAberta = 1;
                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              RemedioScreen(pet: widget.pet)));
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.healing,
                          color: widget.paginaAberta == 1
                              ? Colors.redAccent
                              : Colors.grey),
                      Text(
                        "Remédio",
                        style: TextStyle(
                            color: widget.paginaAberta == 1
                                ? Colors.redAccent
                                : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
            //Segunda linha
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Ícone Consulta
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    if (widget.paginaAberta != 2) {
                      setState(() {
                        widget.paginaAberta = 2;
                      });
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.local_hospital,
                          color: widget.paginaAberta == 2
                              ? Colors.redAccent
                              : Colors.grey),
                      Text(
                        "Consulta",
                        style: TextStyle(
                            color: widget.paginaAberta == 2
                                ? Colors.redAccent
                                : Colors.grey),
                      )
                    ],
                  ),
                ),
                //Ícone Anotações
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    if (widget.paginaAberta != 3) {
                      setState(() {
                        widget.paginaAberta = 3;
                      });
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.event_note,
                          color: widget.paginaAberta == 3
                              ? Colors.redAccent
                              : Colors.grey),
                      Text(
                        "Anotações",
                        style: TextStyle(
                            color: widget.paginaAberta == 3
                                ? Colors.redAccent
                                : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
