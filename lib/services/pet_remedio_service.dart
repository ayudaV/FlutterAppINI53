import 'package:pipoca_pet/models/pet_remedio_model.dart';
import 'package:pipoca_pet/services/remedio_services.dart';

class RemedioPetService {
  final List<RemedioPet> _remedioPetList = [];
  RemedioService service = RemedioService();

  factory RemedioPetService() {
    return _singleton;
  }
  static final RemedioPetService _singleton = RemedioPetService._internal();

  RemedioPetService._internal() {
    _remedioPetList.add(RemedioPet(idPet: "1", idRemedio: "2"));

    _remedioPetList.add(RemedioPet(idPet: "2", idRemedio: "1"));
  }

  Iterable<RemedioPet> getRemediosServiceByPetId(String id) {
    return _remedioPetList.where((remedioPet) => remedioPet.idPet == id);
  }

  void addRemedioPet(RemedioPet remedioPet) {
    _remedioPetList.add(
        RemedioPet(idPet: remedioPet.idPet, idRemedio: remedioPet.idRemedio));
  }
}
