import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Données fictives, à remplacer par des vraies via Navigator ou Provider
    const codeBillet = 'B123456';
    const depart = 'Ziguinchor';
    const arrivee = 'Dakar';
    const heure = '9h00';
    const date = '22/04/2025';

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Réservation réussie ! 🎉'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Votre réservation a été effectuée avec succès !',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.qr_code, color: Colors.indigo),
                        const SizedBox(width: 10),
                        Text(
                          'Code billet : $codeBillet',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.route, color: Colors.indigo),
                        const SizedBox(width: 10),
                        Text(
                          'Trajet : $depart ➜ $arrivee',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: Colors.indigo),
                        const SizedBox(width: 10),
                        Text(
                          'Départ : $heure le $date',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/billet');
                },
                icon: const Icon(Icons.confirmation_number),
                label: const Text('Voir mon billet'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[900],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/dashboard',
                  (_) => false,
                );
              },
              child: const Text(
                'Retour à l’accueil',
                style: TextStyle(fontSize: 16, color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
