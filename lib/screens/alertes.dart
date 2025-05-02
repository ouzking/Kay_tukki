import 'package:flutter/material.dart';

class AlertesPage extends StatelessWidget {
  const AlertesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900], // Fond bleu foncé
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Mes alertes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            _buildAlertItem(
              Icons.notification_important,
              Colors.orange,
              'Rappel : départ demain à 9h00',
            ),
            const SizedBox(height: 20),
            _buildAlertItem(
              Icons.message,
              Colors.lightBlueAccent,
              'Message : votre billet est confirmé',
            ),
            const SizedBox(height: 20),
            _buildAlertItem(
              Icons.warning,
              Colors.redAccent,
              'Alerte : changement d’horaire',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertItem(IconData icon, Color iconColor, String message) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
