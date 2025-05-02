import 'package:flutter/material.dart';

import '../models/trajet.dart';

class DetailTrajetPage extends StatelessWidget {
  final Trajet trajet;

  const DetailTrajetPage({super.key, required this.trajet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du trajet 🚌'),
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informations sur le trajet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildDetailRow('Départ :', '${trajet.depart} à ${trajet.heure}'),
            const SizedBox(height: 12),
            _buildDetailRow('Arrivée :', '${trajet.arrivee} (estimation)'),
            const SizedBox(height: 12),
            const Text(
              'Bus : Wi-Fi – Clim – 50 places',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildDetailRow('Date :', trajet.date),
            const SizedBox(height: 12),
            _buildDetailRow('Places disponibles :', '${trajet.places}'),
            const SizedBox(height: 20),
            Text(
              'Prix total : ${trajet.prix} FCFA',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/paiement', arguments: trajet);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[900],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Réserver ce billet',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                '🚍 Réservez maintenant et partez en toute tranquillité !',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
          ),
        ),
      ],
    );
  }
}
