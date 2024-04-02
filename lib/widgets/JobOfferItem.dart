import 'package:flutter/material.dart';
import 'package:oopportinitie/model/JobOffer.dart';
import 'package:oopportinitie/views/ApplyJobPage/ApplyJobPage.dart';
import 'package:oopportinitie/views/CreateJobOfferPage/CreateJobOfferPage.dart';

Widget buildJobOfferList(BuildContext context, List<JobOffer> offers) {
  return ListView.builder(
    itemCount: offers.length,
    itemBuilder: (context, index) {
      final offer = offers[index];
      return Card(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(offer.title),
          subtitle: Text(offer.description),
          trailing: IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Logique pour postuler à l'offre
              // Par exemple, ouvrir une page de formulaire ou envoyer directement une candidature
              // Pour cet exemple, affichons simplement un SnackBar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ApplyJobPage(jobTitle: offer.title,)),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Postuler à : ${offer.title}')),
              );
            },
          ),
        ),
      );
    },
  );
}