import 'package:flutter/material.dart';

class SuiviPage extends StatelessWidget {
  const SuiviPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Suivi du bus'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.directions_bus_filled,
              size: 80,
              color: Colors.indigo,
            ),
            const SizedBox(height: 24),
            const Text(
              '📍 Suivi en temps réel',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'La fonctionnalité de localisation sera bientôt disponible.\nVous pourrez suivre votre bus en temps réel sur une carte interactive.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                // Action future
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[900],
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.map, color: Colors.white),
              label: const Text(
                'Voir la carte',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
