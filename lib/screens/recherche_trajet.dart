import 'package:flutter/material.dart';

import '../models/trajet.dart';
import 'detail_trajet.dart';

class RechercheTrajetPage extends StatelessWidget {
  const RechercheTrajetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final trajets = [
      Trajet(
        depart: 'Dakar',
        arrivee: 'Ziguinchor',
        date: '15/05/2025',
        places: 3,
        prix: 15000,
        heure: '08:00',
      ),
      Trajet(
        depart: 'Thiès',
        arrivee: 'Kaolack',
        date: '15/05/2025',
        places: 2,
        prix: 10000,
        heure: '10:30',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Résultats de recherche'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            trajets.isEmpty
                ? const Center(
                  child: Text(
                    'Aucun trajet trouvé.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
                : ListView.builder(
                  itemCount: trajets.length,
                  itemBuilder: (context, index) {
                    final trajet = trajets[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${trajet.depart} ➜ ${trajet.arrivee}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text('Date : ${trajet.date}'),
                                const Spacer(),
                                const Icon(
                                  Icons.access_time,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text('Départ : ${trajet.heure}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.chair_alt_outlined,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text('Places : ${trajet.places}'),
                                const Spacer(),
                                const Icon(
                                  Icons.monetization_on,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${trajet.prix} FCFA',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) =>
                                              DetailTrajetPage(trajet: trajet),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.directions_bus,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Réserver maintenant',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo[900],
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 6,
                                  shadowColor: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CovoiturageTrajetsPage(trajets: trajets),
            ),
          );
        },
        label: const Text(
          'Voir les trajets en covoiturage',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(Icons.list, color: Colors.white),
        backgroundColor: Colors.indigo[900],
      ),
    );
  }
}

// Nouvelle page qui affiche les trajets de covoiturage
class CovoiturageTrajetsPage extends StatelessWidget {
  final List<Trajet> trajets;

  const CovoiturageTrajetsPage({super.key, required this.trajets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tous les trajets en covoiturage'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: trajets.length,
        itemBuilder: (context, index) {
          final trajet = trajets[index];
          return ListTile(
            leading: const Icon(Icons.directions_car),
            title: Text('${trajet.depart} ➜ ${trajet.arrivee}'),
            subtitle: Text(
              'Le ${trajet.date} à ${trajet.heure} • ${trajet.places} places • ${trajet.prix} FCFA',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailTrajetPage(trajet: trajet),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
