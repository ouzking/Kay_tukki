import 'package:flutter/material.dart';

class ResultatsRecherchePage extends StatelessWidget {
  const ResultatsRecherchePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Données simulées (à remplacer plus tard avec le backend Laravel + MySQL)
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
      appBar: AppBar(title: const Text('Résultats trouvés ✅')),
      body: ListView.builder(
        itemCount: trajets.length,
        itemBuilder: (context, index) {
          final trajet = trajets[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: const Icon(Icons.directions_bus, color: Colors.blue),
              title: Text('${trajet['compagnie']}'),
              subtitle: Text(
                'Départ : ${trajet['depart']} - Arrivée : ${trajet['arrivee']}\nPlaces disponibles : ${trajet['places']}',
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${trajet['prix']} F',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/details');
                    },
                    child: const Text('Réserver'),
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
