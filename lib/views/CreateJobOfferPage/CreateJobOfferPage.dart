import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Pour formater les dates

class CreateJobOfferPage extends StatefulWidget {
  @override
  _CreateJobOfferPageState createState() => _CreateJobOfferPageState();
}

class _CreateJobOfferPageState extends State<CreateJobOfferPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  DateTime? _startDate;
  final TextEditingController _durationController = TextEditingController();
  String? _status; // Vous pouvez utiliser un dropdown ou autre pour le statut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer une nouvelle offre d\'emploi'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Titre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un titre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Localisation'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une localisation';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _budgetController,
                  decoration: InputDecoration(labelText: 'Budget'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un budget';
                    }
                    return null;
                  },
                ),
                ListTile(
                  title: Text(_startDate == null ? 'Date de début' : DateFormat('dd/MM/yyyy').format(_startDate!)),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _startDate) {
                      setState(() {
                        _startDate = picked;
                      });
                    }
                  },
                ),
                TextFormField(
                  controller: _durationController,
                  decoration: InputDecoration(labelText: 'Durée (en jours)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une durée';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _status,
                  hint: Text('Statut'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _status = newValue!;
                    });
                  },
                  items: <String>['Ouvert', 'Fermé', 'En cours']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) => value == null ? 'Veuillez choisir un statut' : null,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Ici, vous pouvez appeler une fonction pour créer l'offre d'emploi
                        // avec les données saisies par l'utilisateur
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Offre d\'emploi enregistrée')),
                        );
                        // Ensuite, vous pourriez naviguer de retour ou vers une autre page
                      }
                    },
                    child: Text('Soumettre'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // N'oubliez pas de nettoyer les contrôleurs lorsque le widget est supprimé
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _budgetController.dispose();
    _durationController.dispose();
    super.dispose();
  }
}
