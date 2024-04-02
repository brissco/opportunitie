import 'package:flutter/material.dart';
import 'package:oopportinitie/model/JobOffer.dart'; // Assurez-vous que ce chemin est correct

void main() => runApp(JobOfferAppScrenn());

class JobOfferAppScrenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OffersOverviewPage(),
    );
  }
}

class OffersOverviewPage extends StatelessWidget {
  final List<Tab> statusTabs = [
    Tab(text: 'OPEN'),
    Tab(text: 'CLOSED'),
    Tab(text: 'PAUSED'),
    Tab(text: 'CANCELED'),
    Tab(text: 'FILLED'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: statusTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Suivi des Offres'),
          bottom: TabBar(
            tabs: statusTabs,
            isScrollable: true, // Pour faire défiler si trop d'onglets
          ),
        ),
        body: TabBarView(
          children: statusTabs.map((Tab tab) {
            final String status = tab.text!;
            // Vous pouvez utiliser votre propre logique pour charger les offres par statut
            // Ceci est juste un placeholder pour le contenu de chaque onglet
            return Center(child: Text('Offres $status'));
          }).toList(),
        ),
      ),
    );
  }
}
