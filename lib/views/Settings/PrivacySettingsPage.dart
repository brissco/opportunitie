import 'package:flutter/material.dart';

class PrivacySettingsPage extends StatefulWidget {
  @override
  _PrivacySettingsPageState createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool _isProfilePublic = false;
  bool _canSeeMyPosts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres de confidentialité'),
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Rendre le profil public'),
            value: _isProfilePublic,
            onChanged: (bool value) {
              setState(() {
                _isProfilePublic = value;
              });
              // Ici, vous pourriez aussi appeler une fonction pour sauvegarder cette préférence (par ex., dans SharedPreferences ou une base de données)
            },
          ),
          SwitchListTile(
            title: Text('Qui peut voir mes publications'),
            value: _canSeeMyPosts,
            subtitle: Text(_canSeeMyPosts ? "Tout le monde" : "Seulement mes amis"),
            onChanged: (bool value) {
              setState(() {
                _canSeeMyPosts = value;
              });
              // Comme ci-dessus, pensez à sauvegarder cette préférence
            },
          ),
          // Ajoutez ici d'autres options de confidentialité si nécessaire
        ],
      ),
    );
  }
}
