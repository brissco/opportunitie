import 'package:flutter/material.dart';
import 'package:oopportinitie/model/JobOffer.dart';
import 'package:oopportinitie/widgets/JobOfferItem.dart';
import 'package:oopportinitie/views/CreateJobOfferPage/CreateJobOfferPage.dart';

void main() => runApp(JobOfferApp());

class JobOfferApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JobOffersPage(),
    );
  }
}


class JobOffersPage extends StatefulWidget {
  @override
  _JobOffersPageState createState() => _JobOffersPageState();
}

class _JobOffersPageState extends State<JobOffersPage> {
  List<JobOffer> jobOffers = []; // Liste initiale des offres d'emploi
  List<JobOffer> filteredJobOffers = []; // Liste filtrée des offres d'emploi

  @override
  void initState() {
    super.initState();
    jobOffers = getDummyJobOffers(); // Assurez-vous d'avoir une fonction pour obtenir les données
    filteredJobOffers = jobOffers;
  }

  void filterSearchResults(String query) {
    if(query.isEmpty) {
      setState(() {
        filteredJobOffers = jobOffers;
      });
    } else {
      setState(() {
        filteredJobOffers = jobOffers.where((offer) =>
        offer.title.toLowerCase().contains(query.toLowerCase()) ||
        offer.description.toLowerCase().contains(query.toLowerCase())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: filterSearchResults,
          decoration: InputDecoration(
            hintText: 'Rechercher une offre...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Implémentez la logique pour ouvrir un dialogue de filtre
            },
          ),
        ],
      ),
      body: buildJobOfferList(context, filteredJobOffers),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logique pour naviguer vers la page de création d'une offre
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateJobOfferPage()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Ajouter une offre',
      ),
    );
  }
}


List<JobOffer> getDummyJobOffers() {
  return [
    JobOffer(
      offerId: 1,
      title: "Développeur Flutter",
      description: "Description de l'offre 1",
      location: "Paris, France",
      budget: 50000.00,
      startDate: DateTime(2023, 1, 1),
      duration: 6,
      status: "Ouvert",
    ),
    JobOffer(
      offerId: 2,
      title: "Concepteur UI/UX",
      description: "Description de l'offre 2",
      location: "Lyon, France",
      budget: 45000.00,
      startDate: DateTime(2023, 2, 15),
      duration: 12,
      status: "Ouvert",
    ),
    JobOffer(
      offerId: 2,
      title: "Concepteur UI/UX",
      description: "Description de l'offre 2",
      location: "Lyon, France",
      budget: 45000.00,
      startDate: DateTime(2023, 2, 15),
      duration: 12,
      status: "Ouvert",
    ),
    JobOffer(
      offerId: 1,
      title: "Développeur Flutter",
      description: "Description de l'offre 1",
      location: "Paris, France",
      budget: 50000.00,
      startDate: DateTime(2023, 1, 1),
      duration: 6,
      status: "Ouvert",
    ),
    JobOffer(
      offerId: 2,
      title: "Concepteur UI/UX",
      description: "Description de l'offre 2",
      location: "Lyon, France",
      budget: 45000.00,
      startDate: DateTime(2023, 2, 15),
      duration: 12,
      status: "Ouvert",
    ),
    // Ajoutez plus d'offres fictives si nécessaire
  ];
}
