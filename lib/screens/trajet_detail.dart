import 'package:flutter/material.dart';

class TrajetDetailPage extends StatelessWidget {
  final String trajetCompagnie;
  final String trajetDepart;
  final String trajetArrivee;
  final String trajetDateHeure;
  final String trajetPrix;
  final String trajetBusInfo;

  const TrajetDetailPage({
    super.key,
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Détails du trajet'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trajetCompagnie,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.departure_board, color: Colors.indigo),
                    const SizedBox(width: 8),
                    Text(
                      'Départ : $trajetDepart',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.indigo),
                    const SizedBox(width: 8),
                    Text(
                      'Arrivée : $trajetArrivee',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.date_range, color: Colors.indigo),
                    const SizedBox(width: 8),
                    Text(
                      'Date & heure : $trajetDateHeure',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.directions_bus, color: Colors.indigo),
                    const SizedBox(width: 8),
                    Text(
                      'Bus : $trajetBusInfo',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.price_check, color: Colors.indigo),
                    const SizedBox(width: 8),
                    Text(
                      'Prix total : $trajetPrix F',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/paiement');
                    },
                    icon: const Icon(Icons.shopping_cart_checkout),
                    label: const Text('Réserver ce billet'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
