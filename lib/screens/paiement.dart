import 'package:flutter/material.dart';

class PaiementPage extends StatefulWidget {
  const PaiementPage({super.key});

  @override
  State<PaiementPage> createState() => _PaiementPageState();
}

class _PaiementPageState extends State<PaiementPage> {
  String selectedMethod = '';
  final _formKey = GlobalKey<FormState>();
  final _numeroController = TextEditingController();
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _numeroController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  void _validerPaiement() {
    if (_formKey.currentState!.validate() && selectedMethod.isNotEmpty) {
      // Simuler un traitement, puis aller à la page de confirmation
      Navigator.pushNamed(context, '/confirmation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payer mon billet 💳'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choisissez un moyen de paiement sécurisé :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildOption('Orange Money', Colors.orange),
                _buildOption('Wave', Colors.blue),
                _buildOption('Free Money', Colors.red),
                _buildOption('Western Union', Colors.blueAccent),
              ],
            ),
            const SizedBox(height: 30),
            if (selectedMethod.isNotEmpty)
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _numeroController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Numéro de téléphone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF1F1F1),
                        prefixIcon: const Icon(Icons.phone),
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Veuillez entrer le numéro'
                                  : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _pinController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Code PIN',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF1F1F1),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Veuillez entrer le PIN'
                                  : null,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 30),
            if (selectedMethod.isNotEmpty)
              Center(
                child: ElevatedButton.icon(
                  onPressed: _validerPaiement,
                  icon: const Icon(Icons.payment, color: Colors.white),
                  label: const Text(
                    'Payer maintenant',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                '✅ Paiement sécurisé',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String method, Color color) {
    return ChoiceChip(
      label: Text(
        method,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: selectedMethod == method,
      onSelected: (_) {
        setState(() {
          selectedMethod = method;
        });
      },
      selectedColor: color,
      backgroundColor: color.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      labelStyle: const TextStyle(fontSize: 14),
    );
  }
}
