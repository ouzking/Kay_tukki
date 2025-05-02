import 'package:flutter/material.dart';

class TrajetDetailPage extends StatelessWidget {
  final String trajetCompagnie;
  final String trajetDepart;
  final String trajetArrivee;
  final String trajetDateHeure;
  final String trajetPrix;
  final String trajetBusInfo;

  TrajetDetailPage({
    required this.trajetCompagnie,
    required this.trajetDepart,
    required this.trajetArrivee,
    required this.trajetDateHeure,
    required this.trajetPrix,
    required this.trajetBusInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du trajet'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Compagnie: $trajetCompagnie',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Départ: $trajetDepart', style: TextStyle(fontSize: 16)),
            Text('Arrivée: $trajetArrivee', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Date et heure: $trajetDateHeure',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('Bus: $trajetBusInfo', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Prix total: $trajetPrix',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Action de réservation
                Navigator.pushNamed(
                  context,
                  '/paiement',
                ); // Assurez-vous de définir cette route
              },
              child: const Text('Réserver ce billet'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
