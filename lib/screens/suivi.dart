import 'package:flutter/material.dart';

class SuiviPage extends StatelessWidget {
  const SuiviPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivre mon bus'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          '📍 Position du bus en temps réel\n(Fonctionnalité à intégrer avec une carte plus tard)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
