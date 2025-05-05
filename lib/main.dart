import 'package:flutter/material.dart';

import 'admin/admin_home.dart';
import 'admin/ajouter_trajet_page.dart';
import 'admin/liste_trajets_page.dart';
import 'pages/dashboard.dart';
import 'pages/forgot_password.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/welcome.dart';
import 'screens/alertes.dart';
import 'screens/billet.dart';
import 'screens/confirmation.dart';
import 'screens/paiement.dart';
import 'screens/profil.dart';
import 'screens/recherche_trajet.dart';
import 'screens/reservations_page.dart';
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
      title: 'Kay Tukki',
      debugShowCheckedModeBanner: false,

      // 🌞 Thème clair
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),

      // 🌚 Thème sombre
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[900],
      ),

      // 🌓 Thème basé sur le système
      themeMode: ThemeMode.system,

      initialRoute: '/welcome',
      routes: {
        '/':
            (context) =>
                const DashboardPage(userName: 'Ousmane'), // à rendre dynamique
        '/recherche': (context) => const RechercheTrajetPage(),
        '/resultats': (context) => const ResultatsRecherchePage(),
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
        '/admin_home': (context) => const AdminHomePage(),
        '/reservations': (context) => const ReservationsPage(),
        '/ajouter_trajet': (context) => const AjouterTrajetPage(),
        '/liste_trajets': (context) => const ListeTrajetsPage(),
      },
    );
  }
}
