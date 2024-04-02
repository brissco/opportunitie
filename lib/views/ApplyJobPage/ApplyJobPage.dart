import 'package:flutter/material.dart';

class ApplyJobPage extends StatefulWidget {
  final String jobTitle; // Optionnel : passer le titre de l'offre pour personnalisation

  ApplyJobPage({Key? key, required this.jobTitle}) : super(key: key);

  @override
  _ApplyJobPageState createState() => _ApplyJobPageState();
}

class _ApplyJobPageState extends State<ApplyJobPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cvLinkController = TextEditingController();
  TextEditingController motivationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postuler à ${widget.jobTitle}'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nom complet'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom complet';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Veuillez entrer un email valide';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   controller: cvLinkController,
              //   decoration: InputDecoration(labelText: 'Lien vers votre CV'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Veuillez entrer le lien vers votre CV';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                controller: motivationController,
                decoration: InputDecoration(labelText: 'Lettre de motivation'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre lettre de motivation';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Valider le formulaire
                    if (_formKey.currentState!.validate()) {
                      // Ici, vous pouvez traiter les données du formulaire, comme les envoyer à une API
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Postulation envoyée'),
                          content: Text('Votre postulation pour "${widget.jobTitle}" a été envoyée.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Ferme la boîte de dialogue
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Soumettre'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Nettoyer les contrôleurs pour éviter les fuites de mémoire
    nameController.dispose();
    emailController.dispose();
    cvLinkController.dispose();
    motivationController.dispose();
    super.dispose();
  }
}
