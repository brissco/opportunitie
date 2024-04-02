import 'package:flutter/material.dart';
import 'package:oopportinitie/views/JobOffer/JobOffer.dart';
import 'package:oopportinitie/views/JobOfferApp.JobOfferApp.dart';
import 'package:oopportinitie/views/login/LoginScreen.dart';
import 'package:oopportinitie/views/worker/WorksInProgress/WorksInProgressPage.dart';
import 'package:oopportinitie/views/worker/profil/ProfilePage.dart';
// import 'package:oopportinitie/views/JobOfferApp.JobOfferApp.dart';
import 'widgets/custom_drawer.dart'; // Assurez-vous que le chemin d'importation est correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // Index pour suivre la page sélectionnée

  // Méthode pour changer la vue affichée
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // La liste des pages à afficher
  final List<Widget> _pages = [
    Center(child: Text('Contenu Principal')), // Page d'accueil ou toute autre page par défaut
    ProfilePage(),
    LoginScreen(),
    WorksInProgressPage(),
    // Ajoutez d'autres pages ici selon vos besoins
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemple Drawer'),
        ),
        drawer: CustomDrawer(onSelectItem: _onItemTapped),
        body: JobOfferAppScrenn()// _pages.elementAt(_selectedIndex), // Afficher la page sélectionnée
        // body: JobOfferApp()// _pages.elementAt(_selectedIndex), // Afficher la page sélectionnée
      ),
    );
  }
}