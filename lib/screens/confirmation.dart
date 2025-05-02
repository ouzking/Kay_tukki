import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tu peux passer dynamiquement ces infos via Navigator si besoin
    const codeBillet = 'B123456';
    const depart = 'Ziguinchor';
    const arrivee = 'Dakar';
    const heure = '9h00';
    const date = '22/04/2025';

    return Scaffold(
      appBar: AppBar(title: const Text('Réservation réussie ! 🎉')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Votre réservation a été effectuée avec succès !',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.qr_code),
                        const SizedBox(width: 10),
                        Text('Code billet : $codeBillet'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.route),
                        const SizedBox(width: 10),
                        Text('Trajet : $depart ➜ $arrivee'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(width: 10),
                        Text('Départ : $heure le $date'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/billet');
              },
              child: const Text('Voir mon billet'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/dashboard',
                  (_) => false,
                );
              },
              child: const Text('Retour à l’accueil'),
            ),
          ],
        ),
      ),
    );
  }
}
