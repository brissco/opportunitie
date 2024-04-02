import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String? _selectedLanguage = 'Français'; // Valeur par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choix de la langue'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: _selectedLanguage,
          items: <String>['Français', 'English', 'Español'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedLanguage = newValue;
            });
            // Mettez à jour la langue de l'application
            // Ceci peut impliquer de définir une nouvelle locale pour l'application
            // ou de rafraîchir l'interface utilisateur pour refléter la nouvelle langue
            // Note: La mise à jour effective de la langue de l'application peut dépendre de votre gestion de l'internationalisation
          },
        ),
      ),
    );
  }
}
