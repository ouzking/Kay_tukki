import 'package:flutter/material.dart';

class DetailTrajetPage extends StatelessWidget {
  const DetailTrajetPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simule des données reçues (tu pourras plus tard les passer dynamiquement via arguments)
    final String villeDepart = 'Ziguinchor';
    final String heureDepart = '09h00';
    final String villeArrivee = 'Dakar';
    final String heureArrivee = '17h00';
    final int prix = 7000;

    return Scaffold(
      appBar: AppBar(title: const Text('Détails du trajet 🚌')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Départ : $villeDepart à $heureDepart',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Arrivée : $villeArrivee à $heureArrivee',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bus : Wi-Fi – Clim – 50 places',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Prix total : $prix F',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/paiement');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Text(
                    'Réserver ce billet',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
