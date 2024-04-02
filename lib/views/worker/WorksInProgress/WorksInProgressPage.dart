import 'package:flutter/material.dart';
class WorksInProgressPage extends StatelessWidget {
  final List<Work> worksInProgress = [
    Work(projectTitle: "Projet A", clientName: "Client A", startDate: "01/01/2022", endDate: "01/02/2022", progress: 0.5),
    // Ajoutez plus de travaux ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travaux en Cours"),
      ),
      body: ListView.builder(
        itemCount: worksInProgress.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(worksInProgress[index].projectTitle, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Client: ${worksInProgress[index].clientName}\nDébut: ${worksInProgress[index].startDate} - Fin: ${worksInProgress[index].endDate}"),
              trailing: LinearProgressIndicator(value: worksInProgress[index].progress),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WorkDetailsPage(work: worksInProgress[index])));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logique pour ajouter un nouveau travail
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Work {
  String projectTitle;
  String clientName;
  String startDate;
  String endDate;
  double progress;

  Work({required this.projectTitle, required this.clientName, required this.startDate, required this.endDate, required this.progress});
}

class WorkDetailsPage extends StatelessWidget {
  final Work work;

  WorkDetailsPage({required this.work});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(work.projectTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Client: ${work.clientName}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("Dates: ${work.startDate} - ${work.endDate}"),
              LinearProgressIndicator(value: work.progress),
              SizedBox(height: 20),
              Text("Objectifs du projet:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              // Ajoutez ici des détails sur les objectifs du projet
              Text("Livraisons:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              // Ajoutez ici des détails sur les livraisons
              Text("État d'avancement:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              // Ajoutez ici des détails sur l'état d'avancement
            ],
          ),
        ),
      ),
    );
  }
}
