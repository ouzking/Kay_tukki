import 'package:flutter/material.dart';

class CovoiturageFormPage extends StatefulWidget {
  const CovoiturageFormPage({super.key});

  @override
  State<CovoiturageFormPage> createState() => _CovoiturageFormPageState();
}

class _CovoiturageFormPageState extends State<CovoiturageFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _departController = TextEditingController();
  final _arriveeController = TextEditingController();
  final _dateController = TextEditingController();
  final _heureController = TextEditingController();
  final _placesController = TextEditingController();
  final _prixController = TextEditingController();

  Future<void> _choisirDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        _dateController.text = "${date.day}/${date.month}/${date.year}";
      });
    }
  }

  Future<void> _choisirHeure() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        _heureController.text = time.format(context);
      });
    }
  }

  void _publierCovoiturage() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("🚗 Covoiturage publié !")));
      _departController.clear();
      _arriveeController.clear();
      _dateController.clear();
      _heureController.clear();
      _placesController.clear();
      _prixController.clear();
    }
  }

  InputDecoration champ(String label) => InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.black87),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    filled: true,
    fillColor: Colors.grey[200],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Publier un covoiturage",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _departController,
                decoration: champ("Départ"),
                validator: (val) => val!.isEmpty ? "Champ requis" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _arriveeController,
                decoration: champ("Destination"),
                validator: (val) => val!.isEmpty ? "Champ requis" : null,
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _choisirDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: champ("Date"),
                    validator: (val) => val!.isEmpty ? "Champ requis" : null,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _choisirHeure,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _heureController,
                    decoration: champ("Heure"),
                    validator: (val) => val!.isEmpty ? "Champ requis" : null,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _placesController,
                decoration: champ("Nombre de places disponibles"),
                keyboardType: TextInputType.number,
                validator: (val) => val!.isEmpty ? "Champ requis" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _prixController,
                decoration: champ("Prix par place (F CFA)"),
                keyboardType: TextInputType.number,
                validator: (val) => val!.isEmpty ? "Champ requis" : null,
              ),
              const SizedBox(height: 80), // Laisse de l'espace pour le FAB
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _publierCovoiturage,
        backgroundColor: Colors.green[700],
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Publier",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
