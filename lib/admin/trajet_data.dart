class Trajet {
  final String depart;
  final String arrivee;
  final String heure;
  final String prix;

  Trajet(this.depart, this.arrivee, this.heure, this.prix);
}

class TrajetData {
  static final List<Trajet> trajets = [];
}
