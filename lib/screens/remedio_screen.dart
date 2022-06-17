import 'package:flutter/material.dart';
import 'package:pipoca_pet/models/pet_model.dart';
import 'package:pipoca_pet/models/pet_remedio_model.dart';
import 'package:pipoca_pet/models/remedio_model.dart';
import 'package:pipoca_pet/nav/custom_nav.dart';
import 'package:pipoca_pet/screens/form_remedio_pet.dart';
import 'package:pipoca_pet/services/pet_remedio_service.dart';
import 'package:pipoca_pet/services/remedio_services.dart';

// ignore: must_be_immutable
class RemedioScreen extends StatelessWidget {
  final Pet pet;
  RemedioPetService service = RemedioPetService();
  RemedioService remedioService = RemedioService();

  Iterable<Remedio> _remedioList = const Iterable.empty();
  Iterable<Remedio> remediosPet = [];
  RemedioScreen({Key? key, required this.pet}) : super(key: key) {
    getAllRemediosHome();
    getRemediosPetServiceByPetId();
  }
  void getAllRemediosHome() {
    Iterable<Remedio> list = remedioService.getAllRemediosService();
    _remedioList = list;
  }

  void getRemediosPetServiceByPetId() {
    Iterable<RemedioPet> _remedioPetList =
        service.getRemediosServiceByPetId(pet.id);
    Iterable<RemedioPet> _remediosDoPet =
        _remedioPetList.where((remedioPet) => remedioPet.idPet == pet.id);
    List<String> idRemedios = [];
    for (var remedioDoPet in _remediosDoPet) {
      idRemedios.add(remedioDoPet.idRemedio);
    }
    remediosPet =
        _remedioList.where((_remedio) => idRemedios.contains(_remedio.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
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
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
                  child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Remédios",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: remediosPet.length,
                  itemBuilder: (context, index) {
                    return _remedioCard(context, index);
                  }),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FormRemediosPet(
                    pet: pet,
                  )));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavBar(paginaAberta: 1, pet: pet),
    );
  }

  Widget _remedioCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: Container(
                  padding: const EdgeInsets.only(right: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.redAccent)),
                  ),
                  child: const Icon(Icons.healing, color: Colors.redAccent),
                ),
                title: Text(
                  remediosPet.elementAt(index).nome,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(remediosPet.elementAt(index).data),
              ),
            )
          ],
        ),
      ),
    );
  }
}
