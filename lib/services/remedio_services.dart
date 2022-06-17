import 'package:pipoca_pet/models/remedio_model.dart';

class RemedioService {
  final List<Remedio> _remedioList = [];

  factory RemedioService() {
    return _singleton;
  }
  static final RemedioService _singleton = RemedioService._internal();

  RemedioService._internal() {
    _remedioList.add(Remedio(id: "1", nome: "Vermífugo", data: "13/05/2022"));

    _remedioList.add(Remedio(id: "2", nome: "Antipulgas", data: "04/7/2022"));
  }

  List<Remedio> getAllRemediosService() {
    return _remedioList;
  }

  void addRemedio(Remedio remedio) {
    _remedioList
        .add(Remedio(id: remedio.id, nome: remedio.nome, data: remedio.data));
  }
}
