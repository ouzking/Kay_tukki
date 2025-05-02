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
      Navigator.pushNamed(context, '/confirmation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payer mon billet 💳')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choisissez un moyen de paiement :',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                _buildOption('Orange Money', Colors.orange),
                _buildOption('Wave', Colors.blue),
                _buildOption('Free Money', Colors.red),
                _buildOption('PayDunya', Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            if (selectedMethod.isNotEmpty)
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _numeroController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Numéro de téléphone',
                      ),
                      validator:
                          (value) =>
                              value!.isEmpty
                                  ? 'Veuillez entrer le numéro'
                                  : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _pinController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Code PIN'),
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Veuillez entrer le PIN' : null,
                    ),
                  ],
                ),
              ),
            const Spacer(),
            if (selectedMethod.isNotEmpty)
              Center(
                child: ElevatedButton(
                  onPressed: _validerPaiement,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Text('Payer maintenant'),
                  ),
                ),
              ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                '✅ Paiement sécurisé',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String method, Color color) {
    return ChoiceChip(
      label: Text(method),
      selected: selectedMethod == method,
      onSelected: (_) {
        setState(() {
          selectedMethod = method;
        });
      },
      selectedColor: color.withOpacity(0.2),
    );
  }
}
