import 'package:animate_do/animate_do.dart'; // Add this package in pubspec.yaml
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String userName;

  const DashboardPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        title: Text(
          'Bonjour, $userName 👋',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 500),
                child: _buildButton(
                  context,
                  icon: Icons.search_rounded,
                  title: '🔍 Rechercher un trajet',
                  routeName: '/recherche',
                ),
              ),
              const SizedBox(height: 24),
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 500),
                child: _buildButton(
                  context,
                  icon: Icons.confirmation_num_outlined,
                  title: '📅 Mes billets',
                  routeName: '/billets',
                ),
              ),
              const SizedBox(height: 24),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 500),
                child: _buildButton(
                  context,
                  icon: Icons.directions_bus,
                  title: '🗺️ Suivre mon bus',
                  routeName: '/suivi',
                ),
              ),
              const SizedBox(height: 24),
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 500),
                child: _buildButton(
                  context,
                  icon: Icons.notifications,
                  title: '🔔 Mes alertes',
                  routeName: '/alertes',
                ),
              ),
              const Spacer(),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 600),
                child: _buildButton(
                  context,
                  icon: Icons.person,
                  title: '⚙️ Mon compte',
                  routeName: '/compte',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String routeName,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo.shade50,
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () => Navigator.pushNamed(context, routeName),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.indigo[900]),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            'Ouvrir',
            style: TextStyle(
              color: Colors.indigo[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
