import 'package:flutter/material.dart';

import 'trajet_data.dart';

class ListeTrajetsPage extends StatefulWidget {
  const ListeTrajetsPage({super.key});

  @override
  State<ListeTrajetsPage> createState() => _ListeTrajetsPageState();
}

class _ListeTrajetsPageState extends State<ListeTrajetsPage> {
  void _supprimerTrajet(int index) {
    setState(() {
      TrajetData.trajets.removeAt(index);
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Trajet supprimé')));
  }

  void _modifierTrajet(int index) {
    final trajet = TrajetData.trajets[index];

    final departCtrl = TextEditingController(text: trajet.depart);
    final arriveeCtrl = TextEditingController(text: trajet.arrivee);
    final heureCtrl = TextEditingController(text: trajet.heure);
    final prixCtrl = TextEditingController(text: trajet.prix);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Modifier le trajet'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: departCtrl,
                  decoration: const InputDecoration(labelText: 'Départ'),
                ),
                TextField(
                  controller: arriveeCtrl,
                  decoration: const InputDecoration(labelText: 'Arrivée'),
                ),
                TextField(
                  controller: heureCtrl,
                  decoration: const InputDecoration(labelText: 'Heure'),
                ),
                TextField(
                  controller: prixCtrl,
                  decoration: const InputDecoration(labelText: 'Prix'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  TrajetData.trajets[index] = Trajet(
                    departCtrl.text,
                    arriveeCtrl.text,
                    heureCtrl.text,
                    prixCtrl.text,
                  );
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Trajet modifié')));
              },
              child: const Text('Enregistrer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final trajets = TrajetData.trajets;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des trajets'),
        backgroundColor: Colors.blue[900],
      ),
      body:
          trajets.isEmpty
              ? const Center(child: Text('Aucun trajet pour le moment.'))
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: trajets.length,
                itemBuilder: (context, index) {
                  final trajet = trajets[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: const Icon(Icons.directions_bus),
                      title: Text('${trajet.depart} → ${trajet.arrivee}'),
                      subtitle: Text(
                        'Heure : ${trajet.heure} | Prix : ${trajet.prix} F CFA',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () => _modifierTrajet(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _supprimerTrajet(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
