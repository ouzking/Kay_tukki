import 'package:flutter/material.dart';

class ResultatsRecherchePage extends StatelessWidget {
  const ResultatsRecherchePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> trajets = [
      {
        'compagnie': 'Dem Dikk',
        'depart': '09h00',
        'arrivee': '17h00',
        'prix': 7000,
        'places': 4,
      },
      {
        'compagnie': 'Gana Transport',
        'depart': '10h00',
        'arrivee': '18h00',
        'prix': 8000,
        'places': 3,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Résultats trouvés ✅'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: ListView.builder(
        itemCount: trajets.length,
        itemBuilder: (context, index) {
          final trajet = trajets[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.directions_bus,
                    size: 40,
                    color: Colors.indigo,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trajet['compagnie'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '🕘 Départ : ${trajet['depart']}  ➔  🕓 Arrivée : ${trajet['arrivee']}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          '🧍 Places disponibles : ${trajet['places']}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${trajet['prix']} F',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => DetailTrajetPage(
                                    compagnie: trajet['compagnie'],
                                    heureDepart: trajet['depart'],
                                    heureArrivee: trajet['arrivee'],
                                    prix: trajet['prix'].toString(),
                                    places: trajet['places'].toString(),
                                  ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo[900],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Réserver',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Classe de la page de détail
class DetailTrajetPage extends StatelessWidget {
  final String compagnie;
  final String heureDepart;
  final String heureArrivee;
  final String prix;
  final String places;

  const DetailTrajetPage({
    super.key,
    required this.compagnie,
    required this.heureDepart,
    required this.heureArrivee,
    required this.prix,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du trajet'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Compagnie: $compagnie', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Départ: $heureDepart', style: TextStyle(fontSize: 16)),
            Text('Arrivée: $heureArrivee', style: TextStyle(fontSize: 16)),
            Text('Prix: $prix F', style: TextStyle(fontSize: 16)),
            Text('Places restantes: $places', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
