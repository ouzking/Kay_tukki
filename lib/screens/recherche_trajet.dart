import 'package:flutter/material.dart';

class RechercheTrajetPage extends StatefulWidget {
  const RechercheTrajetPage({super.key});

  @override
  State<RechercheTrajetPage> createState() => _RechercheTrajetPageState();
}

class _RechercheTrajetPageState extends State<RechercheTrajetPage> {
  final _formKey = GlobalKey<FormState>();
  String depart = '';
  String arrivee = '';
  DateTime? dateDepart;
  int nombrePlaces = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trouver un trajet 🚌')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ville de départ',
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) => depart = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ville d’arrivée',
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) => arrivee = val,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  dateDepart == null
                      ? 'Choisir une date de départ'
                      : 'Départ : ${dateDepart!.day}/${dateDepart!.month}/${dateDepart!.year}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() {
                      dateDepart = date;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: nombrePlaces,
                decoration: const InputDecoration(
                  labelText: 'Nombre de places',
                  border: OutlineInputBorder(),
                ),
                items:
                    List.generate(10, (index) => index + 1)
                        .map(
                          (e) => DropdownMenuItem(value: e, child: Text('$e')),
                        )
                        .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => nombrePlaces = val);
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && dateDepart != null) {
                    // TODO: Envoi vers la page des résultats avec les données
                    Navigator.pushNamed(context, '/resultats');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Veuillez remplir tous les champs.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Rechercher', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
