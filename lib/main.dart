import 'package:flutter/material.dart';

import 'pages/dashboard.dart';
import 'pages/forgot_password.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/welcome.dart';
import 'screens/alertes.dart';
import 'screens/billet.dart';
import 'screens/confirmation.dart';
import 'screens/detail_trajet.dart';
import 'screens/paiement.dart';
import 'screens/profil.dart';
import 'screens/recherche_trajet.dart';
import 'screens/resultats_recherche.dart';
import 'screens/suivi.dart';
import 'screens/trajet_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/welcome',
      routes: {
        '/':
            (context) =>
                const DashboardPage(userName: 'Ousmane'), // à rendre dynamique
        '/recherche': (context) => const RechercheTrajetPage(),
        '/resultats': (context) => const ResultatsRecherchePage(),
        // '/details': (context) => const DetailTrajetPage(), <-- supprimée car nécessite des arguments
        '/trajetDetail':
            (context) => TrajetDetailPage(
              trajetCompagnie: 'Dem Dikk',
              trajetDepart: 'Ziguinchor',
              trajetArrivee: 'Dakar',
              trajetDateHeure: '22/04/2025 09:00',
              trajetPrix: '7000 F',
              trajetBusInfo: 'Wi-Fi, Clim, 50 places',
            ),
        '/paiement': (context) => const PaiementPage(),
        '/confirmation': (context) => const ConfirmationPage(),
        '/billet': (context) => const BilletPage(),
        '/billets': (context) => const BilletPage(),
        '/profil': (context) => const ProfilPage(),
        '/compte': (context) => const ProfilPage(),
        '/suivi': (context) => const SuiviPage(),
        '/alertes': (context) => const AlertesPage(),
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/dashboard': (context) => const DashboardPage(userName: 'Ousmane'),
      },
    );
  }
}
