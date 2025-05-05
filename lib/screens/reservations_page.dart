import 'package:flutter/material.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({super.key});

  // Exemple de données fictives
  final List<Map<String, String>> reservations = const [
    {
      'nom': 'Fatou Diop',
      'trajet': 'Dakar → Ziguinchor',
      'date': '04/05/2025',
      'heure': '08:00',
      'statut': 'Confirmée',
    },
    {
      'nom': 'Moussa Ndiaye',
      'trajet': 'Ziguinchor → Dakar',
      'date': '06/05/2025',
      'heure': '14:00',
      'statut': 'En attente',
    },
    {
      'nom': 'Awa Sarr',
      'trajet': 'Dakar → Kaolack',
      'date': '07/05/2025',
      'heure': '09:30',
      'statut': 'Confirmée',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Réservations'),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.green),
              title: Text(reservation['nom'] ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reservation['trajet'] ?? ''),
                  Text(
                    'Date : ${reservation['date']} - Heure : ${reservation['heure']}',
                  ),
                  Text(
                    'Statut : ${reservation['statut']}',
                    style: TextStyle(
                      color:
                          reservation['statut'] == 'Confirmée'
                              ? Colors.green
                              : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Possibilité d'afficher plus de détails
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Détails de ${reservation['nom']}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
