import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Assure-toi d'avoir ajouté ce package dans ton pubspec.yaml

class BilletPage extends StatelessWidget {
  const BilletPage({super.key});

  @override
  Widget build(BuildContext context) {
    const codeBillet = 'B123456';
    const depart = 'Ziguinchor';
    const arrivee = 'Dakar';
    const heure = '9h00';
    const date = '22/04/2025';
    const prix = '7 000 F';
    const compagnie = 'Dem Dikk';
    const busInfo = 'Wi-Fi, Climatisation, 50 places';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Billet', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.confirmation_number,
              size: 100,
              color: Colors.indigo[900],
            ),
            const SizedBox(height: 10),
            const Text(
              'Voici les détails de votre réservation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: QrImageView(
                        data: codeBillet,
                        size: 120,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildInfoRow(Icons.qr_code, 'Code billet', codeBillet),
                    _buildInfoRow(Icons.route, 'Trajet', '$depart ➜ $arrivee'),
                    _buildInfoRow(
                      Icons.access_time,
                      'Départ',
                      '$heure le $date',
                    ),
                    _buildInfoRow(Icons.local_taxi, 'Compagnie', compagnie),
                    _buildInfoRow(Icons.info, 'Bus', busInfo),
                    _buildInfoRow(Icons.monetization_on, 'Prix', prix),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    // Logique pour partager
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Partage en cours...")),
                    );
                  },
                  icon: const Icon(Icons.share, color: Colors.indigo),
                  label: const Text("Partager"),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    // Logique pour export PDF
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Exportation en PDF...")),
                    );
                  },
                  icon: const Icon(Icons.picture_as_pdf, color: Colors.indigo),
                  label: const Text("Exporter"),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/dashboard',
                    (_) => false,
                  );
                },
                icon: const Icon(Icons.home),
                label: const Text('Retour à l’accueil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[900],
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo[900]),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$label : $value',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
