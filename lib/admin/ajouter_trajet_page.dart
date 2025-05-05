import 'package:flutter/material.dart';

import 'trajet_data.dart';

class AjouterTrajetPage extends StatefulWidget {
  const AjouterTrajetPage({super.key});

  @override
  State<AjouterTrajetPage> createState() => _AjouterTrajetPageState();
}

class _AjouterTrajetPageState extends State<AjouterTrajetPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _departController = TextEditingController();
  final TextEditingController _arriveeController = TextEditingController();
  final TextEditingController _heureController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();

  void _soumettreFormulaire() {
    if (_formKey.currentState!.validate()) {
      final nouveauTrajet = Trajet(
        _departController.text,
        _arriveeController.text,
        '${_dateController.text} - ${_heureController.text}',
        _prixController.text,
      );

      TrajetData.trajets.add(nouveauTrajet);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ Trajet ajouté avec succès !')),
      );

      _departController.clear();
      _arriveeController.clear();
      _heureController.clear();
      _dateController.clear();
      _prixController.clear();
    }
  }

  InputDecoration champDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  Future<void> _choisirHeure() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _heureController.text = picked.format(context);
      });
    }
  }

  Future<void> _choisirDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text =
            '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Ajouter un trajet',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                '📝 Remplissez les détails du trajet',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Lieu de départ
              TextFormField(
                controller: _departController,
                decoration: champDecoration('Lieu de départ'),
                validator:
                    (value) =>
                        value!.isEmpty
                            ? 'Veuillez entrer un lieu de départ'
                            : null,
              ),
              const SizedBox(height: 16),

              // Lieu d'arrivée
              TextFormField(
                controller: _arriveeController,
                decoration: champDecoration('Lieu d\'arrivée'),
                validator:
                    (value) =>
                        value!.isEmpty
                            ? 'Veuillez entrer un lieu d\'arrivée'
                            : null,
              ),
              const SizedBox(height: 16),

              // Date de départ
              GestureDetector(
                onTap: _choisirDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: champDecoration('Date de départ'),
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Veuillez choisir une date' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Heure de départ
              GestureDetector(
                onTap: _choisirHeure,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _heureController,
                    decoration: champDecoration('Heure de départ'),
                    validator:
                        (value) =>
                            value!.isEmpty
                                ? 'Veuillez choisir une heure'
                                : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Prix
              TextFormField(
                controller: _prixController,
                decoration: champDecoration('Prix du billet (F CFA)'),
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Veuillez entrer le prix' : null,
              ),
              const SizedBox(height: 30),

              // Bouton
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text(
                  'Ajouter le trajet',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: _soumettreFormulaire,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
