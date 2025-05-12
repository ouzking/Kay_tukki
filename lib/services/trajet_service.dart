// services/trajet_service.dart
import '../models/trajet.dart';

class TrajetService {
  static final TrajetService _instance = TrajetService._internal();
  factory TrajetService() => _instance;
  TrajetService._internal();

  final List<Trajet> trajets = [
    Trajet(depart: 'Dakar', arrivee: 'Ziguinchor', date: '15/05/2025', places: 3, prix: 15000, heure: '08:00'),
    Trajet(depart: 'Thiès', arrivee: 'Kaolack', date: '15/05/2025', places: 2, prix: 10000, heure: '10:30'),
  ];

  void ajouterTrajet(Trajet trajet) {
    trajets.add(trajet);
  }

  List<Trajet> getTousLesTrajets() => trajets;
}
